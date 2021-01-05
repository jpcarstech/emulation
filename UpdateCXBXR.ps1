#create folder
New-Item -Path "c:\temp\" -Name "cxbxr" -ItemType "directory"

#Download CXBX-r
$out = 'c:\temp\cxbxr\cxbxr.zip'
wget $((wget "https://api.github.com/repos/Cxbx-Reloaded/Cxbx-Reloaded/releases" | ConvertFrom-Json)[0].assets.browser_download_url[1]) -OutFile $out

#Extract CXBX-r
$sourcefile = "c:\temp\cxbxr\cxbxr.zip"
Expand-Archive $sourcefile -DestinationPath 'c:\temp\cxbxr\cxbxrlatest\'

#Copy/Overwrite what is in the emulator folder
$sourceDirectory  = "c:\temp\cxbxr\cxbxrlatest\*"
$destinationDirectory = "D:\Emulators\XBOX\CXBX\"
Copy-item -Force -Recurse -Verbose $sourceDirectory -Destination $destinationDirectory

#Delete downloaded CXBX-r files when done to prep for next version
Remove-Item -Path "c:\temp\cxbxr\" -recurse

#Once Script is done, confirm success/close
Read-Host -Prompt "CXBX-R has updated!
Press Enter to exit"