create folder
New-Item -Path "c:\temp\" -Name "xenia_canary" -ItemType "directory"

#Download Xenia Canary
$out = 'c:\temp\xenia_canary\xenia_canary.zip'

wget "https://github.com/xenia-canary/xenia-canary/releases/latest/download/xenia_canary.zip" -OutFile $out

#Extract Xenia_canary
$sourcefile = "c:\temp\xenia_canary\xenia_canary.zip" Expand-Archive $sourcefile -DestinationPath 'c:\temp\xenia_canary\xenia_canary_latest\'

#Copy/Overwrite what is in the emulator folder
$sourceDirectory = "c:\temp\xenia_canary\xenia_canary_latest*" $destinationDirectory = "c:\emulatori\Xenia\xenia_canary" Copy-item -Force -Recurse -Verbose $sourceDirectory -Destination $destinationDirectory

#Delete downloaded Xenia_canary files when done to prep for next version
Remove-Item -Path "c:\temp\xenia_canary\" -recurse

#Once Script is done, confirm success/close
Read-Host -Prompt "Xenia_canary has updated! Press Enter to continue"
