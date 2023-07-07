$location = "/home/cipher/Documents/GitHub/scarecrow-ps1" 
$scarecrow_JSON = Get-Content -raw "$location/data.json" | ConvertFrom-Json
function getPath($title) { return "$location/$title"}

function getFile($fileList) {
  
    if ($fileList.Count -gt 0) {
        Write-Host "│   ├── List of Files : "
        $index = 0
        foreach ($file in $fileList) {
            $index++
            Write-Host "│   │   ├── " -NoNewLine
            Write-Host "$index. $($file.Name)"
        }
        Write-Host "│   │   ├── " -NoNewLine
        $userInput = Read-Host "Enter the index number of the file:"
        $userInput = $userInput.Trim()
    
        if ($userInput -match '^\d+$' -and $userInput -ge 1 -and $userInput -le $fileList.Count) {
            $selectedFile = $fileList[$userInput - 1]
            Write-Host "│   │   ├── " -NoNewLine
            Write-Host " [ Selected ] : $($selectedFile.Name)"
            return $selectedFile
        }
        else {
            Write-Host "Invalid input. Please enter a valid index number."
        }
    }
    else {
        Write-Host "No files found in the directory."
    }
    
}



$ascii_file = getPath($scarecrow_JSON.assets.ascii)
cat $ascii_file


$wordList_directory = $scarecrow_JSON.directory.wordlist
$handshakeList_directory = $scarecrow_JSON.directory.handshake

Write-Host "scarecrow-ps1" 
Write-Host "│  "
# 1. Select Wordlist from /usr/share/wordlists
Write-Host "├── WorldLists"
Write-Host "│   ├── [ 1 ] Select WorldLists from : $wordList_directory"
$wordList = Get-ChildItem -Path $wordList_directory -File
$dictFile = getFile($wordList)
Write-Host "│   │   ├── " -NoNewLine
Write-Host "You have Selected (WordList): $dictFile"

# 2. Select Handshake from /home/cipher/hs
Write-Host "├── Handshakes"
Write-Host "│   ├── [ 2 ] Select Handshakes from : $handshakeList_directory"
$handshakeList = Get-ChildItem -Path $handshakeList_directory -File
$hsFile = getFile($handshakeList)
Write-Host "│   │   ├── " -NoNewLine
Write-Host "You have Selected (Handshake): $hsFile"
Write-Host "├── sudo scarecrow-ng -w $dictFile $hsFile" -ForegroundColor White 
$choose = Read-Host "├── Crack WPA/WPA2 WiFi Handshake Now (y/n) : " 

if($choose -eq 'y')
{
    Write-Host "│   ├── Cracking Handshake using " -NoNewline
    Write-Host "scarecrow-ng" -ForegroundColor White
    sudo scarecrow-ng -w $dictFile $hsFile

} else {  Write-Host "└──[ Quiting Now ] "}
# └─$ PS>sudo aireplay-ng --deauth 10 -a 7A:0C:B8:C9:37:F9 wlan0mon    
