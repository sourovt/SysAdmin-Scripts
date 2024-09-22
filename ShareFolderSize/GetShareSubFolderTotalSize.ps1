# The following script provides a listing of subfolders in a network share and gives total size for each of those folders
# This script is almost fully produced through BingGPT

# Get all subfolders in the current directory
Get-ChildItem -Directory '\\server1\share1' |

# Iterate over each subfolder
ForEach-Object {

    # Get all subfolders within the current subfolder
    Get-ChildItem $_.FullName -Directory -Depth 0 |

    # Iterate over each sub-subfolder
    ForEach-Object {

        # Get the full path of the current sub-subfolder
        $subFolder = $_.FullName

        # Get the total size of all files within the current sub-subfolder
        $size = (Get-ChildItem $_.FullName -Recurse | Where-Object { !$_.PSIsContainer } | Measure-Object Length -Sum).Sum

        # Convert the size to a human-readable format and display it
        if ($size -eq 0 -or $null) {
            Write-Host "$subFolder -- 0 bytes"
        } else {
            $sizeInKB = $size / 1KB
            $sizeInMB = $size / 1MB
            $sizeInGB = $size / 1GB

            if ($sizeInGB -ge 1) {
                Write-Host "$subFolder -- $($sizeInGB.ToString("0.00")) GB"
            } elseif ($sizeInMB -ge 1) {
                Write-Host "$subFolder -- $($sizeInMB.ToString("0.00")) MB"
            } elseif ($sizeInKB -ge 1) {
                Write-Host "$subFolder -- $($sizeInKB.ToString("0.00")) KB"
            } else {
                Write-Host "$subFolder -- $size bytes"
            }
        }
    }
}
