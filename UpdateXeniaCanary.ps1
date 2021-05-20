#create folder
New-Item -Path "$env:temp" -Name "xenia_canary" -ItemType "directory"

#Download Xenia Canary
$out = "$env:temp\xenia_canary\xenia_canary.zip"
wget "https://github.com/xenia-canary/xenia-canary/releases/latest/download/xenia_canary.zip" -OutFile $out

#Extract Xenia_canary
Expand-Archive $out -DestinationPath "D:\Emulators\Xbox 360\xenia_canary" -Force

#Delete downloaded Xenia_canary files when done to prep for next version
Remove-Item -Path "$env:temp\xenia_canary\" -recurse

#Once Script is done, confirm success/close
Read-Host -Prompt "Xenia_canary has updated! Press Enter to continue"
