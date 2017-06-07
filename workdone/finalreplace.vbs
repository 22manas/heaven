' This code replaces one string by another inside files looping though subfolders.
' It is vbscript so copy the text below in a .txt file and rename to .vbs
' It will take any non zero bytes file except for extensions you filter out in advance.

Option Explicit
Dim objFilesystem, objFolder, objFiles, objFile, tFile, objShell, objLogFile,objFSO, objStartFolder, colFiles
Dim SubFolder, FileText, bolWriteLog, strLogName, strLogPath, strCount, strCount2, strOldText, strNewText, strEXT,strOldText1,strNewText1
bolWriteLog = True
Const ForReading = 1
Const ForWriting = 2
Const TriStateUseDefault = -2
Set objFilesystem = WScript.CreateObject("Scripting.FileSystemObject")
Set objShell = CreateObject("wscript.Shell")
strLogName = "log.txt"
strLogPath = "C:\Users\pc user\Desktop\vbs\log.txt" & strLogName

strCount = 0
strCount2 = 0
strOldText="main_tera_hero"
strNewText="finally_ho_gaya"
strOldText1="hello"
strNewText1="h_e_l-l_o"
strEXT = "exe,dll,ps"

'Initialize log file
If bolWriteLog Then
   on error resume next
   Set objLogFile = objFileSystem.OpenTextFile(strLogPath, 2, True)
   WriteLog "############### Start Log ##################"
   If not err.number = 0 then
      msgbox "There was a problem opening the log file for writing." & chr(10) & _
         "Please check whether """ & strLogPath & """ is a valid file and can be openend for writing." & _
         chr(10) & chr(10) & "If you're not sure what to do, please contact your support person.",vbCritical, "Script Error"
      wscript.quit
   end if
   on error goto 0
end If


Set objFSO = CreateObject("Scripting.FileSystemObject")
objStartFolder = "C:\Users\pc user\Desktop\vbs\t1"

Set objFolder = objFSO.GetFolder(objStartFolder)
Wscript.Echo objFolder.Path
Set colFiles = objFolder.Files
For Each objFile in colFiles
    Wscript.Echo objFile.Name
' Now we have an exception for all files that can not be opened in text modus: all extensions such as "exe" should be listed upfront.
    If Instr(1,strEXT, Right(LCase(objFile.Name), 3))=0 and objFile.size> 0 Then
ReplaceText(objFile)
End If

Next

ShowSubfolders objFSO.GetFolder(objStartFolder)



Sub  ReplaceText(objFile)

    strCount = strCount + 1
        WriteLog("Opening " & objFile.Name)
        Set tFile = objFile.OpenAsTextStream(ForReading, TriStateUseDefault)
        FileText = tFile.ReadAll
        tFile.Close
        If InStr(FileText, strOldText) Then
             WriteLog("Replacing " & strOldText & " with " & strNewText & ".")
             FileText = Replace(FileText, strOldText, strNewText)
             FileText = Replace(FileText, strOldText1, strNewText1)
                WriteLog("Text replaced")
        Else
                WriteLog(strOldText & " was not found in the file.")
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
    Wscript.Echo Subfolder.Path
    Set objFolder = objFSO.GetFolder(Subfolder.Path)
    Set colFiles = objFolder.Files
    For Each objFile in colFiles
Wscript.Echo objFile.Name
ReplaceText(objFile)
    Next
    ShowSubFolders Subfolder
Next
End Sub


WriteLog "###############  EndLog  ##################"

WScript.Echo "Script Complete"
objShell.Run "C:\" & strLogName

'Clear environment and exit
On Error Resume Next

Set tFile = Nothing
Set objFile = Nothing
Set objFiles = Nothing
Set objFolder = Nothing
Set objLogFile = Nothing
Set objFilesystem = Nothing
Set objShell = Nothing

WScript.Quit

'Subs and functions ********** DO NOT EDIT ***************

sub WriteLog(sEntry)
   If bolWriteLog then objLogFile.WriteLine(Now() & ": Log:      " & sEntry)
End Sub