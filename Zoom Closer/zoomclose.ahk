#SingleInstance force
#Persistent
zoomcount := 0
SetTimer, Repeat, 1000
SetTitleMatchMode, 1
Return

Repeat:
{
    DetectHiddenWindows, Off
    If  !(WinExist("Zoom")) && !(WinExist("Waiting for Host"))
    {
        DetectHiddenWindows, On
        if (WinExist("Zoom"))
        {
            zoomcount := zoomcount + 1
            if(zoomcount > 2)
            {
                Process, close, Zoom.exe
                zoomcount := 0
            }
        } else {
            zoomcount := 0
        }
    } else {
        zoomcount := 0
    }
}