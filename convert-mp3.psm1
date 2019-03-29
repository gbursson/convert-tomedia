<#
.Synopsis
   Convert file to mp3 using ffmpeg
.DESCRIPTION
   Convert file to mp3 using ffmpeg
.EXAMPLE
   Convert-ToMp3 extension filename
#>
function ConvertTo-MP3 {
    Param
    (
        # Filename to convert
        [Parameter(Mandatory = $true,
            ValueFromPipelineByPropertyName = $true,
            Position = 0)]
        $Filetype,
        [Parameter(Mandatory = $true,
            ValueFromPipelineByPropertyName = $true,
            Position = 1)]
        $Filename

    )

    $NewFilename = [System.IO.Path]::GetFileNameWithoutExtension($Filename) + "." + ($Filetype)
    $Command = {ffmpeg -i ($Filename) ($NewFilename)}
    Invoke-Command $Command
}