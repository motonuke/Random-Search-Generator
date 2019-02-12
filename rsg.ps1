[CmdletBinding()] 
param(
	[Parameter(Mandatory=$true)][string]$WordList,
	[Parameter()][int]$DesktopLoops=36,
	[Parameter()][int]$MobileLoops=22,
	[Parameter()][switch]$Interactive=$false
	)

$words = get-content $WordList -erroraction Stop
if ($Interactive) {write-output "Working with $($words.length) words"}
$wl = 1..$words.length

for ($a = 1; $a -lt $desktoploops; $a++) {
	if ($Interactive) {write-output "I'm on iteration $a of $desktoploops - Standard Desktop Mode"}
	$random_n1 = get-random -input ($wl) -Count 5
	$phrase = -join ($words[$random_n1[0]]," ",$words[$random_n1[1]]," ",$words[$random_n1[2]]," ",$words[$random_n1[3]]," ",$words[$random_n1[4]])
	$random_time = get-random -minimum 20 -maximum 90

    Start-Process microsoft-edge:http://www.bing.com/search?q=$phrase

	if ($Interactive) {write-output "Sleeping for $random_time seconds..."}
	start-sleep $random_time
}

for ($a = 1; $a -lt $mobileloops; $a++) {
	if ($Interactive) {write-output "I'm on iteration $a of $mobileloops - Mobile (Chrome)"}
	$random_number = get-random
	$random_n1 = get-random -input ($wl) -Count 5
	$phrase = -join ($words[$random_n1[0]]," ",$words[$random_n1[1]]," ",$words[$random_n1[2]]," ",$words[$random_n1[3]]," ",$words[$random_n1[4]])
	$random_time = get-random -minimum 20 -maximum 90

	& 'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe' http://www.bing.com/search?q=$phrase
	if ($Interactive) {write-output "Sleeping for $random_time seconds..."}
	start-sleep $random_time
}

if ($Interactive) {
	write-output "All done with this round..."
	get-date
	start-sleep 10
	start-process microsoft-edge:https://www.bing.com/rewards/dashboard
}
start-sleep 5
if (!$Interactive) {
	## Automated version will auto kill the threads
	$procs = "*edge*","*chrome*"
	foreach ($proc in $procs) {get-process -Name $proc | Stop-process -Force -Confirm:0}
}
