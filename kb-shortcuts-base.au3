Opt("SendKeyDelay", 0) ; 0 removes completely the delay
Opt("SendKeyDownDelay", 0) ; 0 removes completely the delay

Local $kb_sal = "!^o"; define keyboard shortcut to insert 'see attached screenshot.'
Local $kb_sau = "!^+o"; define keyboard shortcut to insert 'See attached screenshot.'
Local $kb_dat = "!^d"; define keyboard shortcut to insert date.
Local $kb_dad = "!^+d"; define keyboard shortcut to insert date + 'did so.'
Local $kb_dan = "!^+n"; define keyboard shortcut to insert date + 'N/A.'
Local $kb_res = "!^w"; define keyboard shortcut to insert 'We can consider this resolved.'
Local $kb_eml = "!^e"; define keyboard shortcut to insert 'cagross@everlooksolutions.com'  Uses ctrl+alt+e.
Local $kb_srm = "!^s"; define keyboard shortcut to insert 'sent reminder'  Uses ctrl+alt+s.
Local $kb_tyv = "!^t"; define keyboard shortcut to insert 'Thank you for your reply.'  Uses ctrl+alt+t.
Local $kb_flw = "!^f"; define keyboard shortcut to insert 'Here are my follow-ups.'  Uses ctrl+alt+f.
Local $kb_out_task = "!^p"; define keyboard shortcut to create Outlook task. Uses ctrl+alt+p.
Local $kb_sxy = "!^k"; define keyboard shortcut to toggle ShareX border color between red and yellow. Uses ctrl+alt+k.
Local $kb_sxb = "!^v"; define keyboard shortcut to toggle ShareX border size between 1 and 5. Uses ctrl+alt+v.
Local $kb_rgx = "!^g"; define keyboard shortcut to insert multi-search regex. Uses ctrl+alt+g.
Local $kb_gpt = "!^h"; define keyboard shortcut to insert ChatGPT text. Uses ctrl+alt+h.


HotKeySet($kb_sal, "send_sal")
HotKeySet($kb_sau, "send_sau")
HotKeySet($kb_dat, "send_dat")
HotKeySet($kb_dad, "send_dad")
HotKeySet($kb_dan, "send_dan")
HotKeySet($kb_res, "send_res")
HotKeySet($kb_eml, "send_eml")
HotKeySet($kb_srm, "send_srm")
HotKeySet($kb_tyv, "send_tyv")
HotKeySet($kb_flw, "send_flw")
HotKeySet($kb_out_task, "out_task")
HotKeySet($kb_sxy, "send_sxy")
HotKeySet($kb_sxb, "send_sxb")
HotKeySet($kb_rgx, "send_rgx")
HotKeySet($kb_gpt, "send_gpt")

While 1
    Sleep(100)
WEnd

Func send_sal()
	HotKeySet($kb_sal) ; deactivate the hotkey in case the user presses it too long
	Send("see screenshot below")
	HotKeySet($kb_sal, "send_sal") ; reactivate it
EndFunc

Func send_sau()
	HotKeySet($kb_sau) ; deactivate the hotkey in case the user presses it too long
	Send("See screenshot below")
	HotKeySet($kb_sau, "send_sau") ; reactivate it
EndFunc

Func send_dat()
	HotKeySet($kb_dat) ; deactivate the hotkey in case the user presses it too long
	Send(int(@MDAY) & "/" & int(@MON) & "/" & StringRight(@YEAR, 2)); Send text to the active window.
	HotKeySet($kb_dat, "send_dat") ; reactivate it
EndFunc

Func send_dad()
	HotKeySet($kb_dad) ; deactivate the hotkey in case the user presses it too long
	Send(int(@MDAY) & "/" & int(@MON) & " did so."); Send text to the active window.
	HotKeySet($kb_dad, "send_dad") ; reactivate it
EndFunc

Func send_dan()
	HotKeySet($kb_dan) ; deactivate the hotkey in case the user presses it too long
	Send(int(@MDAY) & "/" & int(@MON) & " N/A."); Send text to the active window.
	HotKeySet($kb_dan, "send_dan") ; reactivate it
EndFunc

Func send_res()
	HotKeySet($kb_res) ; deactivate the hotkey in case the user presses it too long
	Send("We can consider this resolved.")
	HotKeySet($kb_res, "send_res") ; reactivate it
EndFunc

Func send_eml()
	HotKeySet($kb_eml) ; deactivate the hotkey in case the user presses it too long
	Send("cagross@everlooksolutions.com")
	HotKeySet($kb_eml, "send_eml") ; reactivate it
EndFunc

Func send_srm()
	HotKeySet($kb_srm) ; deactivate the hotkey in case the user presses it too long
	Send("sent reminder")
	HotKeySet($kb_srm, "send_srm") ; reactivate it
EndFunc

Func send_tyv()
	HotKeySet($kb_tyv) ; deactivate the hotkey in case the user presses it too long
	Send("Thank you for your reply.")
	HotKeySet($kb_tyv, "send_tyv") ; reactivate it
EndFunc

Func send_flw()
	HotKeySet($kb_flw) ; deactivate the hotkey in case the user presses it too long
	Send("Here are my follow-ups.")
	HotKeySet($kb_flw, "send_flw") ; reactivate it
EndFunc

Func out_task()
	HotKeySet($kb_out_task) ; deactivate the hotkey in case the user presses it too long
	Send("^b^uTask^u^b{ENTER}+8{space}{space}{ENTER}{ENTER}{ENTER}")
	Send("^b^uTo Do^u^b{ENTER}+8{space}{space}{ENTER}{ENTER}{ENTER}")
	Send("^b^uAfter^u^b{ENTER}+8{space}{space}{ENTER}{ENTER}")
	Send("{UP}{UP}{UP}{UP}{UP}{UP}{UP}")
	HotKeySet($kb_out_task, "out_task") ; reactivate it
EndFunc

Func send_sxy(); Check value of ShareX border color.  If yellow, change to red.  Otherwise, change to yellow.
	HotKeySet($kb_sxy) ; deactivate the hotkey in case the user presses it too long
	ConsoleWrite('Start ShareX border color kb shortcut.' & @CRLF)

	Local $hWnd = WinWait("ShareX - Editor menu", "", 3)
	Local $aWinPos = WinGetPos($hWnd)
	Local $Color = Hex(PixelGetColor($aWinPos[0] + 875, $aWinPos[1] + 20), 6)
	Local $cWnd

	ConsoleWrite('ControlClick on Border color tile:' & @CRLF)
	ConsoleWrite(ControlClick($hWnd, "", ControlGetHandle($hWnd, "", "[REGEXPCLASS:WindowsForms10\.Window\.8\.app\.0\.[a-z0-9]{7}_r\d+_ad\d*]"), "left", 1, 875, 20))

	Local $aWinPos = WinGetPos($hWnd)
	ConsoleWrite('$aWinPos:' & @CRLF)
	ConsoleWrite($aWinPos & @CRLF)


	Local $Color = Hex(PixelGetColor($aWinPos[0] + 875, $aWinPos[1] + 20), 6)
	ConsoleWrite('$Color:' & @CRLF)
	ConsoleWrite($Color & @CRLF)
	$cWnd = WinWaitActive("ShareX - Color picker", "", 3)
	If $Color = 'FFD800' Then
		ConsoleWrite('$oWnd:' & @CRLF)
		Local $oWnd = ControlGetHandle($cWnd, "", '[REGEXPCLASS:^WindowsForms10\.BUTTON\.app\.0\.1a52015_r\d+_ad1; INSTANCE:4]')
		ConsoleWrite('ControlClick on color:' & @CRLF)
		ConsoleWrite(ControlClick($cWnd, '', $oWnd) & @CRLF); Click red.
	Else
		ConsoleWrite('$yWnd:' & @CRLF)
		Local $yWnd = ControlGetHandle($cWnd, "", '[REGEXPCLASS:^WindowsForms10\.BUTTON\.app\.0\.1a52015_r\d+_ad1; INSTANCE:6]')
		ConsoleWrite('ControlClick on color:' & @CRLF)
		ConsoleWrite(ControlClick($cWnd, '', $yWnd) & @CRLF); Click yellow.
	EndIf

	Local $tWnd = ControlGetHandle($cWnd, "", '[REGEXPCLASS:^WindowsForms10\.BUTTON\.app\.0\.1a52015_r\d+_ad1; INSTANCE:42]'); Click color picker OK.
	If @error Then
		ConsoleWrite("Error occurred. Error code: " & @error & @CRLF)
	Else
		ConsoleWrite("Control handle: " & $hWnd & @CRLF)
	EndIf
	ControlClick($cWnd, '', $tWnd)
	HotKeySet($kb_sxy, "send_sxy") ; reactivate it
EndFunc

Func send_sxb()
    ;~ Local Const $offSet = 415 + 50 ; This line was missing in the previous response
    Local Const $offSet = 415 ; This line was missing in the previous response

    HotKeySet($kb_sxb) ; Deactivate the hotkey in case the user presses it too long
    ConsoleWrite('Start ShareX border width kb shortcut.' & @CRLF)

    Local $hWnd = WinWait("ShareX - Editor menu", "", 3)
    ConsoleWrite('Window handle: ' & $hWnd & @CRLF)

    Local $aWinPos = WinGetPos($hWnd)
    ConsoleWrite('Window position: ' & 'Left=' & $aWinPos[0] & ', Top=' & $aWinPos[1] & ', Right=' & $aWinPos[2] & ', Bottom=' & $aWinPos[3] & @CRLF)

    Local Const $iSZ = $aWinPos[3] / 2 ; - 16
    ConsoleWrite('iSZ (half of window height): ' & $iSZ & @CRLF)

    Local $aArea[] = [1325, 24, 1410, 46] ;SearchArea left,top,right,bottom. This is an area on screen that will always contain the 'Tool options' button, regardless of whether the shape is rectangle or arrow.  In either case, the area will also contain a second button.
    Local $SearchColor = 0x778797 ;This is one color in the 'Tool options' button, that should not be in the second button in the search area.
    Local $aCoord = PixelSearch($aArea[0], $aArea[1], $aArea[2], $aArea[3], $SearchColor, 6); Find the exact coordinate of the pixel containing the above color.

    ConsoleWrite('Searching for pixel...' & @CRLF)
    If @error Then
        ConsoleWrite("! Error X and Y" & @CRLF)
    Else
        ConsoleWrite("Pixel Found at X and Y are: " & $aCoord[0] & "," & $aCoord[1] & @CRLF)
        If $aCoord[0] > 1375 Then
            $sActiveTool = "Rectangle"
        Else
            $sActiveTool = "Arrow"
        EndIf
        ConsoleWrite("$sActiveTool: " & $sActiveTool & @CRLF)
    EndIf

    ; Click the pixel corresponding to the Tool options button.
    ConsoleWrite('Clicking pixel...' & @CRLF)
	Local $controlClick = ControlClick($hWnd, "", ControlGetHandle($hWnd, "", "[REGEXPCLASS:WindowsForms10\.Window\.8\.app\.0\.[a-z0-9]{7}_r\d+_ad\d*]"), "left", 1, $aCoord[0]-$offSet, $iSZ)
    ConsoleWrite("$controlClick: " & $controlClick & @CRLF)

	Local $iBorderSize = Int(ControlGetText("[REGEXPCLASS:WindowsForms10\.Window\.20808\.app\.0\.[a-z0-9]{7}_r\d+_ad\d*]", "", "[REGEXPCLASS:WindowsForms10\.EDIT\.app\.0\.[a-z0-9]{7}_r\d+_ad\d+]"))
	
	ConsoleWrite("$iBorderSize: " & $iBorderSize & @CRLF)

    Local $controlSetText
    If $iBorderSize = 5 Then
      $controlSetText = ControlSetText("[REGEXPCLASS:WindowsForms10\.Window\.20808\.app\.0\.[a-z0-9]{7}_r\d+_ad\d*]", "", "[REGEXPCLASS:WindowsForms10\.EDIT\.app\.0\.[a-z0-9]{7}_r\d+_ad\d+]", "1")
    Else
      $controlSetText = ControlSetText("[REGEXPCLASS:WindowsForms10\.Window\.20808\.app\.0\.[a-z0-9]{7}_r\d+_ad\d*]", "", "[REGEXPCLASS:WindowsForms10\.EDIT\.app\.0\.[a-z0-9]{7}_r\d+_ad\d+]", "5")
    EndIf

    ConsoleWrite("$controlSetText: " & $controlSetText & @CRLF)

    Local $controlSend = ControlSend("[REGEXPCLASS:WindowsForms10\.Window\.20808\.app\.0\.[a-z0-9]{7}_r\d+_ad\d*]", "", "[REGEXPCLASS:WindowsForms10\.EDIT\.app\.0\.[a-z0-9]{7}_r\d+]", "{TAB}{ESC}")
    ConsoleWrite("$controlSend: " & $controlSend & @CRLF)

    HotKeySet($kb_sxb, "send_sxb") ; Reactivate the hotkey
EndFunc

Func send_rgx()
	HotKeySet($kb_rgx) ; deactivate the hotkey in case the user presses it too long
	Send("(grid[\s\S\n]*ow6)|(ow6[\s\S\n]*grid)"); Send text to the active window.
	HotKeySet($kb_rgx, "send_rgx") ; reactivate it
EndFunc

Func send_gpt()
	HotKeySet($kb_gpt) ; deactivate the hotkey in case the user presses it too long
	Send("My code is below. For now simply understand it. Do not comment or explain. Await my instruction."); Send text to the active window.
	HotKeySet($kb_gpt, "send_gpt") ; reactivate it
EndFunc