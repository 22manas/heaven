Option Explicit
Dim objFso, objOtF, cd, content

Set objFso = CreateObject("Scripting.FileSystemObject")
cd = Replace(Wscript.ScriptFullName, Wscript.ScriptName, "note.txt")

Set objOtF = objFso.OpenTextFile(cd, 1)
content = objOtF.ReadAll
objOtF.Close

Set objOtF = objFso.OpenTextFile(cd, 2)
objOtF.Write Replace(content, "good", "bad")
objOtF.Close

wscript.echo "Complete."