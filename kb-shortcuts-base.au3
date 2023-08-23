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
	ConsoleWrite('111' & @CRLF)

	Local $hWnd = WinWait("ShareX - Editor menu", "", 3)
	Local $aWinPos = WinGetPos($hWnd)
	Local $hControl = ControlGetHandle($hWnd, "", "WindowsForms10.Window.8.app.0.1a52015_r6_ad11")
	Local $Color = Hex(PixelGetColor($aWinPos[0] + 875, $aWinPos[1] + 20), 6)
	Local $cWnd

	;~ ControlClick($hWnd, "", "WindowsForms10.Window.8.app.0.1a52015_r6_ad11", "left", 1, 875, 20)
	ControlClick($hWnd, "", ControlGetHandle($hWnd, "", "[REGEXPCLASS:WindowsForms10\.Window\.8\.app\.0\.[a-z0-9]{7}_r6_ad\d*]"), "left", 1, 875, 20)
	
	;~ WinWaitActive("ShareX - Color picker")
	$cWnd = WinWait("ShareX - Color picker", "", 3)
	;~ $cWnd = WinWaitActive("ShareX - Color picker")


Local $aWinPos = WinGetPos($hWnd)
	ConsoleWrite($aWinPos & @CRLF)

;~ Local $hControl = ControlGetHandle($hWnd, "", "WindowsForms10.Window.8.app.0.1a52015_r6_ad11")
Local $hControl = ControlGetHandle($hWnd, "", "WindowsForms10.Window.8.app.0.13f26d9_r6_ad11")

	ConsoleWrite($hControl & @CRLF)

Local $Color = Hex(PixelGetColor($aWinPos[0] + 875, $aWinPos[1] + 20), 6)
	ConsoleWrite($Color & @CRLF)

;~ ControlClick($hWnd, "", "WindowsForms10.Window.8.app.0.1a52015_r6_ad11", "left", 1, 875, 20)
;~ ConsoleWrite(ControlClick($hWnd, "", "WindowsForms10.Window.8.app.0.1a52015_r6_ad11", "left", 1, 875, 20) & @CRLF)
ConsoleWrite(ControlClick($hWnd, "", "WindowsForms10.Window.8.app.0.13f26d9_r6_ad11", "left", 1, 875, 20) & @CRLF)

WinWaitActive("ShareX - Color picker")

;~ 	If $Color = 'FFD800' Then
;~ 		ControlClick('ShareX - Color picker', '', 'WindowsForms10.BUTTON.app.0.1a52015_r6_ad14'); Click red.
;~ 	Else
;~ 		ControlClick('ShareX - Color picker', '', 'WindowsForms10.BUTTON.app.0.1a52015_r6_ad16'); Click yellow.
;~ 	EndIf
;~ 	ControlClick('ShareX - Color picker', '', 'WindowsForms10.BUTTON.app.0.1a52015_r6_ad142'); Click color picker OK.
	If $Color = 'FFD800' Then
		;~ ControlClick($cWnd, '', ControlGetHandle($cWnd, "", 'WindowsForms10.BUTTON.app.0.1a52015_r6_ad14')); Click red.
		Local $oWnd = ControlGetHandle($cWnd, "", '[REGEXPCLASS:^WindowsForms10\.BUTTON\.app\.0\.1a52015_r6_ad1; INSTANCE:4]')
		ControlClick($cWnd, '', $oWnd); Click red.
	Else
		;~ ControlClick($cWnd, '', ControlGetHandle($cWnd, "", 'WindowsForms10.BUTTON.app.0.1a52015_r6_ad16')); Click yellow.
		Local $yWnd = ControlGetHandle($cWnd, "", '[REGEXPCLASS:^WindowsForms10\.BUTTON\.app\.0\.1a52015_r6_ad1; INSTANCE:6]')
		ControlClick($cWnd, '', $yWnd); Click yellow.
	EndIf

	;~ ControlClick($cWnd, '', ControlGetHandle($cWnd, "", 'WindowsForms10.BUTTON.app.0.1a52015_r6_ad142'))
	Local $tWnd = ControlGetHandle($cWnd, "", '[REGEXPCLASS:^WindowsForms10\.BUTTON\.app\.0\.1a52015_r6_ad1; INSTANCE:42]'); Click color picker OK.
	If @error Then
		ConsoleWrite("Error occurred. Error code: " & @error & @CRLF)
	Else
		ConsoleWrite("Control handle: " & $hWnd & @CRLF)
	EndIf
	ControlClick($cWnd, '', $tWnd)
	HotKeySet($kb_sxy, "send_sxy") ; reactivate it
EndFunc

Func send_sxb(); Check value of ShareX border size.  If 5, change to 1.  Otherwise, change to 5.
	HotKeySet($kb_sxb) ; deactivate the hotkey in case the user presses it too long

	Local $hWnd = WinWait("ShareX - Editor menu", "", 3)
	Local $aWinPos = WinGetPos($hWnd)
	Local Const $iSZ = $aWinPos[3] / 2 ; - 16
	;Local $aArea[] = [1325, 24, 1378, 46] ;SearchArea left,top,right,bottom. This is an area on screen that will always contain the 'Tool options' button, regardless of whether the shape is rectangle or arrow.  In either case, the area will also contain a second button.
	Local $aArea[] = [1325, 24, 1410, 46] ;SearchArea left,top,right,bottom. This is an area on screen that will always contain the 'Tool options' button, regardless of whether the shape is rectangle or arrow.  In either case, the area will also contain a second button.
	Local $SearchColor = 0x778797 ;This is one color in the 'Tool options' button, that should not be in the second button in the search area.
	Local $aCoord = PixelSearch($aArea[0], $aArea[1], $aArea[2], $aArea[3], $SearchColor, 6); Find the exact coordinate of the pixel containing the above color.
	Local Const $offSet = 415 + 50
	If @error Then
		ConsoleWrite("! Error X and Y" & @CRLF)
	Else
		ConsoleWrite("Pixel Found at  X and Y are: " & $aCoord[0] & "," & $aCoord[1] & @CRLF)
		If $aCoord[0] > 1375 Then ; I guess +70 for you = 1370
			$sActiveTool = "Rectangle"
		Else
			$sActiveTool = "Arrow"
		EndIf
		ConsoleWrite("$sActiveTool: " & $sActiveTool & @CRLF)
	EndIf

	; Click the pixel corresponding to Tool options button.
	Local $controlClick = ControlClick($hWnd, "", "WindowsForms10.Window.8.app.0.1a52015_r6_ad11", "left", 1, $aCoord[0]-$offSet, $iSZ)
	ConsoleWrite("$controlClick: " & $controlClick & @CRLF)

	Local $iBorderSize = Int(ControlGetText("[CLASS:WindowsForms10.Window.20808.app.0.1a52015_r6_ad1]", "", "WindowsForms10.EDIT.app.0.1a52015_r6_ad11"))
	ConsoleWrite("$iBorderSize: " & $iBorderSize & @CRLF)
	Local $controlSetText
	If $iBorderSize = 5 Then
		$controlSetText = ControlSetText("[CLASS:WindowsForms10.Window.20808.app.0.1a52015_r6_ad1]", "", "WindowsForms10.EDIT.app.0.1a52015_r6_ad11", "1")
	Else
		$controlSetText = ControlSetText("[CLASS:WindowsForms10.Window.20808.app.0.1a52015_r6_ad1]", "", "WindowsForms10.EDIT.app.0.1a52015_r6_ad11", "5")
	EndIf
	Local $controlSend = ControlSend("[CLASS:WindowsForms10.Window.20808.app.0.1a52015_r6_ad1]", "", "WindowsForms10.EDIT.app.0.1a52015_r6_ad11", "{TAB}{ESC}")
	ConsoleWrite("$controlSend: " & $controlSend & @CRLF)
	HotKeySet($kb_sxb, "send_sxb"); reactivate it
EndFunc

Func send_rgx()
	HotKeySet($kb_rgx) ; deactivate the hotkey in case the user presses it too long
	Send("(grid[\s\S\n]*ow6)|(ow6[\s\S\n]*grid)"); Send text to the active window.
	HotKeySet($kb_rgx, "send_rgx") ; reactivate it
EndFunc