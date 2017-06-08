
Option Explicit
Dim objFilesystem, objFolder, objFiles, objFile, tFile, objShell, objLogFile,objFSO, objStartFolder, colFiles
Dim SubFolder, FileText, strCount,strCount2, strOldText, strNewText, strEXT,strOldText1,strNewText1
Const ForReading = 1
Const ForWriting = 2
Const TriStateUseDefault = -2
Set objFilesystem = WScript.CreateObject("Scripting.FileSystemObject")
Set objShell = CreateObject("wscript.Shell")
strCount = 0
strCount2 = 0
strOldText="1ukmns"
strNewText="hello again"
strOldText1="h_e_l-l_o"
strNewText1="name_again"
strEXT = "exe,dll,ps,txt"

Set objFSO = CreateObject("Scripting.FileSystemObject")
objStartFolder = "C:\Users\1185165\Pictures\workdone\t1"

Set objFolder = objFSO.GetFolder(objStartFolder)
'Wscript.Echo objFolder.Path
Set colFiles = objFolder.Files
For Each objFile in colFiles    
    'Wscript.Echo objFile.Name
    'Now we have an exception for all files that can not be opened in text modus: all extensions such as "exe" should be listed upfront.
    If Instr(1,strEXT, Right(LCase(objFile.Name), 3))=0 and objFile.size> 0 Then
ReplaceText(objFile)
End If
Next

ShowSubfolders objFSO.GetFolder(objStartFolder)



Sub  ReplaceText(objFile)

    strCount = strCount + 1
        'WriteLog("Opening " & objFile.Name)
        Set tFile = objFile.OpenAsTextStream(ForReading, TriStateUseDefault)
        FileText = tFile.ReadAll
        tFile.Close
        If InStr(FileText, strOldText) Then
             'WriteLog("Replacing " & strOldText & " with " & strNewText & ".")
             FileText = Replace(FileText, strOldText, strNewText)
             FileText = Replace(FileText, strOldText1, strNewText1)
                'WriteLog("Text replaced")
        Else
                'WriteLog(strOldText & " was not found in the file.")
                strCount2 = strCount2 +1
        End If
        Set tFile = objFile.OpenAsTextStream(ForWriting, TriStateUseDefault)
        tFile.Write FileText
        tFile.Close
        FileText = ""
strCount = 0
strCount2 = 0
End Sub



Sub ShowSubFolders(Folder)
For Each Subfolder in Folder.SubFolders
    'Wscript.Echo Subfolder.Path
    Set objFolder = objFSO.GetFolder(Subfolder.Path)
    Set colFiles = objFolder.Files
    For Each objFile in colFiles
   'Wscript.Echo objFile.Name
ReplaceText(objFile)
    Next
    ShowSubFolders Subfolder
Next
End Sub

sub WriteLog(sEntry)
   If bolWriteLog then objLogFile.WriteLine(Now() & ": Log:      " & sEntry)
End Sub