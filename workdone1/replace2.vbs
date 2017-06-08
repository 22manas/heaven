strPath="C:\Users\pc user\Desktop\l"

Set objFso = CreateObject("Scripting.FileSystemObject")
Set objFolder = objFso.GetFolder (strPath)

TraverseFolder (objFso.GetFolder(strPath))

Function TraverseFolder(FolderName)
    For Each fld in FolderName.SubFolders
        TraverseFolder(fld) 
        For Each flname in fld.Files 
            if objFso.GetExtensionName(flname.Path)="txt" then
                msgbox fld.Path & "\" & objFso.GetFileName(flname.Path)

'After commenting whole below section,and running rest of code with
'the above mentioned msgbox every single folder and files are getting
'fetched but when i  uncomment below section, only some folders and
'files are getting displayed in msgbox'

                'Const ForReading = 1
                'Const ForWriting = 2

                'Set objFile = objFso.OpenTextFile(fld.Path & "\" & objFso.GetFileName(flname.Path), 1)

                'strText = objFile.ReadAll
                'objFile.Close

                 'strText= Replace(strText, "helloagain", "helloagain12312")
                 'strText= Replace(strText, "hero", "hello")
                 'strText= Replace(strText, "Database\Sy", "Database\SQ")

                'Set objFile = objFso.OpenTextFile(fld.Path & "\" & objFso.GetFileName(flname.Path), 2)

                'objFile.WriteLine strText
               ' objFile.Close
            End If
        Next
    Next
End Function
