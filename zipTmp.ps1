function ZipFiles( $zipfilename, $sourcedir )
{
    If (Test-Path $zipfilename){
	    Remove-Item $zipfilename
    }
    Add-Type -Assembly System.IO.Compression.FileSystem
    $compressionLevel = [System.IO.Compression.CompressionLevel]::Optimal
    [System.IO.Compression.ZipFile]::CreateFromDirectory($sourcedir,
        $zipfilename, $compressionLevel, $false)
}

# When calling PowerShell.exe explicitly the parameters parsing works dirrerently:
# https://technet.microsoft.com/pl-pl/library/hh847736.aspx
# param (
#    [string]$zipfile = $(throw "-zipfile is required.")
# )

ZipFiles tmp.zip "tmp\"
