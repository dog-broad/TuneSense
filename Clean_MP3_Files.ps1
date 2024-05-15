# Define the root directory containing the subfolders
$rootDir = "D:\TuneSense"

# Define the subfolders
$folders = @("Telugu_Mass", "Telugu_Melodies", "Telugu_Sad", "Telugu_Upbeat")

# Define the string to remove from filenames
$removeString = "[SPOTIFY-DOWNLOADER.COM] "

# Loop through each subfolder
foreach ($folder in $folders) {
    # Get the full path of the current folder
    $currentFolder = Join-Path -Path $rootDir -ChildPath $folder

    # Get all mp3 files in the current folder
    $files = Get-ChildItem -Path $currentFolder -Filter "*.mp3"

    # Loop through each file
    foreach ($file in $files) {
        # Check if the file name contains the string to remove
        if ($file.Name.Contains($removeString)) {
            # Create the new file name by removing the string
            $newFileName = $file.Name -replace [regex]::Escape($removeString), ""

            # Get the full path for the new file name
            $newFilePath = Join-Path -Path $currentFolder -ChildPath $newFileName

            # Rename the file
            Rename-Item -Path $file.FullName -NewName $newFilePath

            # Output the renamed file
            Write-Output "Renamed '$($file.FullName)' to '$newFilePath'"
        }
    }
}