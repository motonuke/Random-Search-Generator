# Random-Search-Generator

This script will randomly search based on a provided word list file. The script relies on a signed in account in both Edge and Chrome. Additionally a Chrome UA tool should be installed to force a mobile UA.

There are the following parameters available:

-WordList        - Provide the full path to a word list file to generate psuedo random searches

-DesktopLoops     - [Optional, Defaults to 36] Specify the number of searches to perform on the Desktop based browser

-DesktopLoops     - [Optional, Defaults to 22] Specify the number of searches to perform on the Mobile based browser

-Interactive      - [Optional, Defaults to Off] Switch to specify Interactive mode, will provide feedback about the scripts progress. Otherwise, no screen output is provide and the script will terminate all browswer theads when complete. 

Example:

```PowerShell
rsg.ps1 -WordList .\english-word-list.txt -DesktopLoops 50 -MobileLoops 25 -Interactive

I've included a curated word list that should have most english language curse words removed. 
