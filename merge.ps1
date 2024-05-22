$minecraft_version = "1.20.4"
$publish_directory = ".\publish\$minecraft_version"
$base_directory = ".\base"
$fo_base_directory = ".\base-fo\Packwiz\$minecraft_version"

if(Test-Path -Path $publish_directory)
{
    Remove-Item -Recurse -Force $publish_directory
}

New-Item -ItemType Directory $publish_directory -Force

Copy-Item -Path "$fo_base_directory\*" -Destination $publish_directory  -Recurse
Copy-Item -Path "$base_directory\*" -Destination $publish_directory -Recurse -Force

$previous_location = Get-Location
Set-Location -Path $publish_directory
packwiz modrinth export
Set-Location -Path $previous_location.ToString()