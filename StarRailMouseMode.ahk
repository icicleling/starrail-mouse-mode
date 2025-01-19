; version 1.1.0

#HotIf WinActive("ahk_exe StarRail.exe")

#SuspendExempt
x:: Suspend
#SuspendExempt False

XButton1::f
XButton2:: handleXButton2Down
XButton2 up:: handleXButton2Up
MButton::E
~w:: startRunning
~w up:: resetRunningStatus
RButton:: handleRButtonDown
RButton up:: handleRButtonUp

isRunning := false

handleXButton2Down() {
    Send '{Alt down}'
    KeyWait 'Alt'

    SetTimer resetAlt, 200
}

handleXButton2Up() {
    Send '{Alt up}'
    SetTimer resetAlt, 0
}

resetAlt() {
    if WinActive('ahk_exe StarRail.exe')
        return
    Send '{Alt up}'
    SetTimer resetAlt, 0
}

handleRButtonDown() {
    Send '{w down}'
    KeyWait 'w'
    startRunning
}

handleRButtonUp() {
    Send '{w up}'
    resetRunningStatus
}

startRunning() {
    global isRunning
    if isRunning = false {
        Sleep 100
        Send "{RButton}"
        isRunning := true
    }
}

resetRunningStatus() {
    global isRunning
    isRunning := false
}