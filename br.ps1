if ($args.count -eq 1) {$word_file = $args[0]} else {write-output "You must provide a word list file as a parameter";exit}
$words = get-content $word_file -erroraction Stop
write-output "Working with $($words.length) words"
$wl = 1..$words.length

for ($a = 1; $a -lt 36; $a++) {
	write-output "I'm on iteration $a of Standard Desktop Mode"
	$random_n1 = get-random -input ($wl) -Count 5
	$phrase = -join ($words[$random_n1[0]]," ",$words[$random_n1[1]]," ",$words[$random_n1[2]]," ",$words[$random_n1[3]]," ",$words[$random_n1[4]])
	$random_time = get-random -minimum 20 -maximum 90

    Start-Process microsoft-edge:http://www.bing.com/search?q=$phrase

	write-output "Sleeping for $random_time seconds..."
	start-sleep $random_time
}

for ($a = 1; $a -lt 22; $a++) {
	write-output "I'm on iteration $a of Mobile (Chrome)"
	$random_number = get-random
	$random_n1 = get-random -input ($wl) -Count 5
	$phrase = -join ($words[$random_n1[0]]," ",$words[$random_n1[1]]," ",$words[$random_n1[2]]," ",$words[$random_n1[3]]," ",$words[$random_n1[4]])
	$random_time = get-random -minimum 20 -maximum 90

	& 'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe' http://www.bing.com/search?q=$phrase
	write-output "Sleeping for $random_time seconds..."
	start-sleep $random_time
}

write-output "All done with this round..."
get-date
start-sleep 10
start-process microsoft-edge:https://www.bing.com/rewards/dashboard


### Old code kept down here for reference

# function random_wl {$script:random_n1 = get-random -input (1..$words.length) -Count 5}

	# $get_word = Invoke-WebRequest -Uri https://randomword.com
	# $random_word = $get_word.AllElements | where {$_.innerhtml -ilike "*random_word*"} | select -ExpandProperty InnerText -last 1
	# $random_word = $random_word.Split( )
	# $random_word = $random_word.Replace(";","")
	
	
		# $random_time = get-random -minimum 60 -maximum 300
	# $useragent = "User-Agent: Mozilla/5.0 (compatible; MSIE 10.0; Windows Phone 8.0; Trident/6.0; IEMobile/10.0; ARM; Touch; NOKIA; Lumia 920)"
	# $wc6 = (new-object System.net.WebClient)
	# $wc6.Headers.Add("user-agent", $userAgent)
	# $ie = New-Object -ComObject "InternetExplorer.Application"
	# $ie.visible = $true
	# $ie.navigate("http://www.bing.com/search?q=$phrase")