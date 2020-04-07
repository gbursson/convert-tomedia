<#
.Synopsis
   Convert media file using ffmpeg
.DESCRIPTION
   Convert media file to another format using ffmpeg (default output is mp3)
.EXAMPLE
   ConvertTo-Media extension filename
#>
function ConvertTo-Media {
    Param
    (
        # Filename to convert
        [Parameter(Mandatory = $true,
            ValueFromPipelineByPropertyName = $true,
            Position = 0)]
        $Filename,
        # Filetype (extension) of output file
        [Parameter(Mandatory = $false,
            ValueFromPipelineByPropertyName = $true,
            Position = 1)]
        $Filetype
    )

    if (-Not $Filetype) {
        $Filetype = "mp3"        
    }

    $NewFilename = [System.IO.Path]::GetFileNameWithoutExtension($Filename) + "." + ($Filetype)
    
    $Command = {ffmpeg -i ($Filename) ($NewFilename)}
    
    Invoke-Command $Command
}
