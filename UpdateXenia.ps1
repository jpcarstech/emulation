#create folder
New-Item -Path "c:\temp\" -Name "xenia" -ItemType "directory"

#Download Xenia
$out = 'c:\temp\xenia\xenia_master.zip'

wget "https://ci.appveyor.com/api/projects/benvanik/xenia/artifacts/xenia_master.zip?branch=master&job=Configuration%3A%20Release&pr=false" -OutFile $out

#Extract Xenia
$sourcefile = "c:\temp\xenia\xenia_master.zip" Expand-Archive $sourcefile -DestinationPath 'c:\temp\xenia\xenia_latest\'

#Copy/Overwrite what is in the emulator folder
$sourceDirectory = "c:\temp\xenia\xenia_latest*" $destinationDirectory = "c:\emulatori\Xenia" Copy-item -Force -Recurse -Verbose $sourceDirectory -Destination $destinationDirectory

#Delete downloaded Xenia files when done to prep for next version
Remove-Item -Path "c:\temp\xenia\" -recurse

#Once Script is done, confirm success/close
Read-Host -Prompt "Xenia has updated! Press Enter to continue"
