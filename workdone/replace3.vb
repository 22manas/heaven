Option Explicit

Dim objFSO, strFolder, objFolder, objFile
Dim strOldValue, strNewValue, objRead, strContents, objWrite

Const ForReading = 1
Const ForWriting = 2

strFolder = "c:\Changing"
strOldValue = "http://test.example.com"
strNewValue = "test"

' Retrieve specified folder.
Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFolder = objFSO.GetFolder(strFolder)

' Enumerate all files in the folder.
For Each objFile In objFolder.Files
    ' Read file with textstream object.
    Set objRead = objFSO.OpenTextFile(objFile.Path, ForReading)
    ' Trap error if file is empty or cannot read.
    On Error Resume Next
    strContents = objRead.ReadAll
    If (Err.Number <> 0) Then
        On Error GoTo 0
        Wscript.Echo "Cannot read: " & objFile.Path
        strContents = ""
    End If
    On Error GoTo 0
    objRead.Close
    ' Check contents for specified string.
    If (InStr(strContents, strOldValue) > 0) Then
        ' Open file with textstream object to overwrite.
        strContents = Replace(strContents, strOldValue, strNewValue)
        Set objWrite = objFSO.OpenTextFile(objFile.Path, ForWriting)
        objWrite.Write strContents
        objWrite.Close
    End If
Next
