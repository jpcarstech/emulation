#create folder
New-Item -Path "c:\temp\" -Name "vita3k" -ItemType "directory"

#Download Vitak3K
$out = 'c:\temp\vita3k\vita3k.zip'

wget "https://github.com/Vita3K/Vita3K/releases/download/continous/windows-latest.zip" -OutFile $out

#Extract Vita3k
$sourcefile = "c:\temp\vita3k\vita3k.zip" Expand-Archive $sourcefile -DestinationPath 'c:\temp\vita3k\vita3k_latest\'

#Copy/Overwrite what is in the emulator folder
$sourceDirectory = "c:\temp\vita3k\vita3k_latest*" $destinationDirectory = "c:\emulatori\Vita3k" Copy-item -Force -Recurse -Verbose $sourceDirectory -Destination $destinationDirectory

#Delete downloaded Vita3k files when done to prep for next version
Remove-Item -Path "c:\temp\vita3k\" -recurse

#Once Script is done, confirm success/close
Read-Host -Prompt "Vita3k has updated! Press Enter to exit"
