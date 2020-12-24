#create folder
New-Item -Path "c:\temp\" -Name "pcsx2" -ItemType "directory"

#Download PCSX2
$out = 'c:\temp\pcsx2\pcsx2.7z'
(iwr https://buildbot.orphis.net/pcsx2/).Content.Split("`n") | ? {$_ -match '>download<'} | select -f 1 | % {iwr ('https://buildbot.orphis.net' + $_.split("'")[1].replace('amp;', '')) -OutFile $out}

#Extract PCSX2
$sourcefile = "c:\temp\pcsx2\pcsx2.7z"
Expand-7Zip -ArchiveFileName $sourcefile -TargetPath 'c:\temp\pcsx2'

#renames subfolder which was extracted (excludes the downloaded .7z file)(and ignores any subfolders)
Get-ChildItem C:\temp\pcsx2 -Exclude pcsx2.7Z -Filter *pcsx2* | Rename-Item -NewName 'pcsx2latest' -verbose

#Overwrite portable.ini contents
Set-Content -Path C:\temp\pcsx2\pcsx2latest\portable.ini -Value 'RunWizard=0'

#Copy/Overwrite what is in the emulator folder
$sourceDirectory  = "c:\temp\pcsx2\pcsx2latest\*"
$destinationDirectory = "D:\Emulators\PS2\PCSX2"
Copy-item -Force -Recurse -Verbose $sourceDirectory -Destination $destinationDirectory

#Delete downloaded PCSX2 files when done to prep for next version
Remove-Item -Path "c:\temp\pcsx2\" -recurse

#Once Script is done, confirm success/close
Read-Host -Prompt "PCSX2 has updated!
Press Enter to exit"
