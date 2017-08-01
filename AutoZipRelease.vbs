'====================================
'����������
'====================================
p_7zip = "E:\Program Files\7-Zip\7z.exe" '7-zip����·��
p_hhc = "E:\Program Files (x86)\HTML Help Workshop\hhc.exe" 'HTML Help Workshop����·��
p_ver = "src\version.cpp" 'version.cpp�ļ�·��
Set fso = CreateObject("Scripting.FileSystemObject") '�ļ�����ϵͳ����
Set osh = CreateObject("WScript.Shell")

If Not fso.FileExists(p_7zip) Then
	WScript.Echo "7z.exe(7-Zip) not found."
	WScript.Quit
End If
If Not fso.FileExists(p_hhc) Then
	WScript.Echo "hhc.exe(HTML Help Workshop) not found."
	WScript.Quit
End If

'���Ϊ����ģʽ����Ϊ������ģʽ��������
If InStr(1,WScript.FullName,"wscript.exe",1) Then
	cmd = "cscript.exe """ & WScript.ScriptFullName & """"
	cmd = cmd & " """ & downDir & """"
	osh.Run cmd
	WScript.Quit
End If
'====================================
'������
'====================================
'�������ȡ�ı�
Function LoadText(FilePath,charset)
	Set adostream = CreateObject("ADODB.Stream")
	With adostream
		.Type = 2
		.Open
		.Charset = charset
		.Position = 0
		.LoadFromFile FilePath
		LoadText = .readtext
		.close
	End With
	Set adostream = Nothing
End Function
'������ʽ����
Function RegExpSearch(strng, patrn) 
	Dim regEx      ' ����������
	Set regEx = New RegExp         ' ����������ʽ��
	regEx.Pattern = patrn         ' ����ģʽ��
	regEx.IgnoreCase = True         ' �����Ƿ����ִ�Сд��TrueΪ�����֡�
	regEx.Global = True         ' ����ȫ��ƥ�䡣
	regEx.MultiLine = True
	Set RegExpSearch  = regEx.Execute(strng)
'	If RegExpSearch.Count > 0 Then
'		MsgBox RegExpSearch.Item(0)
'		If RegExpSearch.Item(0).Submatches.Count > 0 Then
'			Set SubMatches = RegExpSearch.Item(0).Submatches
'			MsgBox SubMatches.Item(0)
'		End If
'	End If
	Set regEx = Nothing
End Function
'====================================
'������
'====================================
verCpp = LoadText(p_ver,"utf-8")
verStrStart = InStr(verCpp,vbCrLf) + Len(vbCrLf)
verStrLength = InStr(verStrStart,verCpp,vbCrLf) - verStrStart
verStr = Mid(verCpp,verStrStart,verStrLength)
Set verStrReg = RegExpSearch(verStr,"\d+\.\d+\.\d+\.\d+")
verNum = verStrReg.Item(0)

WScript.Echo "Compiling help project(FastCopy.chm) ..."
command = """" & p_hhc & """ help\fastcopy.hhp"
Set oExec = osh.Exec(command)
Do While oExec.StdOut.AtEndOfStream <> True
	'�ɼ���ɾ��������ѹ״̬������ͬһ��
	ReadLine = oExec.StdOut.ReadLine
	WScript.Echo ReadLine
Loop

curDir = osh.CurrentDirectory + "\"
Dim platform,bit
platform = Split("x86,x64", ",")
bit = Split("win32,win64", ",")
For xi = 0 To 1
	zipName = "FastCopy-M_" & verNum & "_" & bit(xi) & ".zip"
	WScript.Echo "Add files to " & zipName & ""
	'7-Zip��ѹ�ļ���������
	command = """" & p_7zip & """ a -tzip"
	command = command & " """ & zipName & """ " 'ѹ������ַ
	command = command & " readme_chs.txt  readme_cht.txt readme_eng.txt readme_ja.txt license-gpl3.txt xxhash-LICENSE.txt "
	command = command & " """ & curDir & "help\FastCopy.chm"" "
	command = command & " """ & curDir & "Output\Release\" & platform(0) & "\FastExt1.dll"" "
	command = command & " """ & curDir & "Output\Release\" & platform(1) & "\FastEx64.dll"" "
	command = command & " """ & curDir & "Output\Release\" & platform(xi) & "\FastCopy.exe"" "
	command = command & " """ & curDir & "Output\Release\" & platform(xi) & "\setup.exe"" "
	Set oExec = osh.Exec(command)
	Do While oExec.StdOut.AtEndOfStream <> True
		ReadLine = oExec.StdOut.ReadLine
		WScript.Echo ReadLine
	Loop
Next

'osh.CurrentDirectory = "Output\XP_Release"
'command = """" & p_7zip & """ a -tzip"
'command = command & " """ & curDir & "FastCopy-M_" & verNum & "_Main_EXEC_For_WinXP.zip"" " 'ѹ������ַ
'command = command & " x86\FastCopy.exe "
'command = command & " x64\FastCopy.exe "
'Set oExec = osh.Exec(command)
'Do While oExec.StdOut.AtEndOfStream <> True
	'�ɼ���ɾ��������ѹ״̬������ͬһ��
'	ReadLine = oExec.StdOut.ReadLine
'	WScript.Echo ReadLine
'Loop
	
Msgbox "Done."
Set fso=Nothing
Set osh=Nothing