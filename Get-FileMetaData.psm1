Function Get-FileMetaData {
    Param
    (
        [System.IO.FileInfo] 
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        $File
    )
    
    $shell = New-Object -ComObject "Shell.Application"
    $Obj = $shell.NameSpace($File.DirectoryName)


    $ObjFile = $Obj.parsename($File.Name)
    $Items = $Obj.Items()
    $MetaData = @{}
    $PropertArray = @(0..500)
            
    Foreach ($i in $PropertArray) { 
        If ($Obj.GetDetailsOf($ObjFile, $i)) { #To avoid empty values
            $MetaData[$($Obj.GetDetailsOf($Items, $i))] = $Obj.GetDetailsOf($ObjFile, $i)
        }
    }
    $MetaData
}
