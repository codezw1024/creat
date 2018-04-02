#RequireAdmin
Opt("GUICoordMode", 0)          ;1=绝对位置, 0=相对位置, 2=单元格

;CHCData导入数据、分割
#cs
run("C:\Program Files (x86)\Nav\CHC Geomatics Office\chcdata\CHCData.exe")
winwaitactive("CHCData")
mouseclick("left",74,104)
winwaitactive("打开")
ControlSetText("打开","","Edit1","C:\Users\z\Desktop\20170911\hcn\1017467254F")
send("{ENTER}")
sleep(1000)
WinMinimizeAll()

;winwaitclose("文件导入","正在导入")
;do
; mouseclick("left",74,104)
; until  winactive("打开")
;mouseclick("right",332,45)
ControlSetText("打开","","Edit1","C:\Users\z\Desktop\20170912\hcn\1017467255F")
#ce-------------

#cs----
;CGO创建工程、导入数据
Run("C:\Users\user\Desktop\cgo-929\CGO.exe")
WinWaitActive("CHC Geomatics Office")
Send("^{TAB}")
WinwaitActive("新建项目")
ControlSetText("新建项目","","Edit1","2017-11-18-DJTGPS+BDS");CGO工程名
ControlSetText("新建项目","","Edit2","C:\Users\user\Desktop");CGO工程路径
ControlClick("新建项目","","Button1")
WinWaitActive("项目属性")
ControlClick("项目属性","","Button1")
Sleep(500)
;导入文件
Send("{F3}")
WinWaitActive("打开")
ControlCommand("打开","","ComboBox2","SetCurrentSelection",1)
ControlSetText("打开","","Edit1","C:\Users\z\Desktop\天宝\t_2.11\02303170.17o");Rinex文件路径
ControlClick("打开","","Button1")
WinWaitActive("原始数据检查")
ControlClick("原始数据检查","","Button1")
#ce----

Dim $date
Dim $moshi[6]
Dim $cgo
Dim $gongcheng
Dim $baogao
Dim $file
Dim $m
Dim $i
$moshi[0]="-DJTBDS"
$moshi[1]="-DJTPS"
$moshi[2]="-DJTGPS+BDS"
$moshi[3]="-JYBDS"
$moshi[4]="-JYGPS"
$moshi[5]="-JYGPS+BDS"
For $date=1 To 15 Step 1
   For $m=0 To 5 Step 5
$cgo="C:\Users\user\Desktop\cgo-929\CGO.exe";CGO路径
$gongcheng="C:\Users\user\Desktop\2017-11-"&$date&$moshi[$m]&"\2017-11-"&$date&"-DJTBDS.CGO";工程路径
;$baogao="C:\Users\user\Desktop\2017-11-"&$date&"-DJTBDS"
DirRemove("C:\Users\user\Desktop\2017-11-1-DJTBDS\Reports",1)
DirCreate("C:\Users\user\Desktop\2017-11-1-DJTBDS\Reports")
Run($cgo)
WinWaitActive("CHC Geomatics Office")
WinActivate("CHC Geomatics Office")
Send("+{TAB}")
WinwaitActive(" CGOffice")
ControlSetText(" CGOffice","","Edit1",$gongcheng);打开指定CGO工程
ControlClick(" CGOffice","","Button1")
Sleep(2000)
Send("{F2}")
WinWaitClose("处理基线")
Send("^Q")
MouseClickDrag("left",500,107,1100,449,1)
Send("{F9}")
Sleep(500)
WinMinimizeAll()
Do
   $file=FileExists("C:\Users\user\Desktop\2017-11-1-DJTBDS\Reports\基线处理报告.html")
Until $file=1
WinMinimizeAll()
WinActivate("2017-11-1-DJTBDS")
WinClose("2017-11-1-DJTBDS")
WinWaitActive("CHC Geomatics Office")
ControlClick("CHC Geomatics Office","","Button1")
WinMinimizeAll()

   Next
Next






