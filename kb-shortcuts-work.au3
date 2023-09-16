#include <Misc.au3>; Required to use _IsPressed in the function below.
Opt("SendKeyDelay", 0) ; 0 removes completely the delay
Opt("SendKeyDownDelay", 0) ; 0 removes completely the delay

Local $kb_uri = "!^r"; define keyboard shortcut to insert 'understand issue'  Uses ctrl+alt+r.
Local $kb_dwt = "!^i"; define keyboard shortcut to insert 'discuss with team'  Uses ctrl+alt+i.
Local $kb_atr = "!^l"; define keyboard shortcut to insert 'attempt to reproduce'  Uses ctrl+alt+l.
Local $kb_out_task_ticket = "!^a"; define keyboard shortcut to create Outlook task. Uses ctrl+alt+p.
Local $kb_crv = "!^c"; define keyboard shortcut to insert 'Changeset/Resolution/Verfication. Uses ctrl+alt+c.
Local $kb_upt = "!^u"; define keyboard shortcut to insert 'update ticket.' Uses ctrl+alt+u
Local $kb_crr = "!^n"; define keyboard shortcut to insert 'created reminder' Uses ctrl+alt+n.

HotKeySet($kb_uri, "send_uri")
HotKeySet($kb_out_task_ticket, "out_task_ticket")
HotKeySet($kb_crv, "send_crv")
HotKeySet($kb_upt, "send_upt")
HotKeySet($kb_crr, "send_crr")
HotKeySet($kb_atr, "send_atr")
HotKeySet($kb_dwt, "send_dwt")

While 1
    Sleep(100)
WEnd


Func send_atr()
	HotKeySet($kb_atr) ; deactivate the hotkey in case the user presses it too long
	Send("attempt to reproduce")
	HotKeySet($kb_atr, "send_atr") ; reactivate it
EndFunc

Func send_uri()
	HotKeySet($kb_uri) ; deactivate the hotkey in case the user presses it too long
	Send("understand issue")
	HotKeySet($kb_uri, "send_uri") ; reactivate it
 EndFunc

 Func send_dwt()
	HotKeySet($kb_dwt) ; deactivate the hotkey in case the user presses it too long
	Send("discuss with team")
	HotKeySet($kb_dwt, "send_dwt") ; reactivate it
EndFunc

Func send_crr()
	HotKeySet($kb_crr) ; deactivate the hotkey in case the user presses it too long
	Send("created reminder"); Send text to the active window.
	HotKeySet($kb_crr, "send_crr") ; reactivate it
 EndFunc

Func send_crv()
	HotKeySet($kb_crv) ; deactivate the hotkey in case the user presses it too long
	Send("^b^uVerification^u^b{ENTER}{ENTER}{ENTER}")
	Send("{UP}{UP}{UP}{UP}{UP}")

	HotKeySet($kb_crv, "send_crv") ; reactivate it
 EndFunc

Func send_upt()
	HotKeySet($kb_upt) ; deactivate the hotkey in case the user presses it too long
	Send("update ticket")
	HotKeySet($kb_upt, "send_upt") ; reactivate it
 EndFunc

Func out_task_ticket()

	HotKeySet($kb_out_task_ticket) ; deactivate the hotkey in case the user presses it too long
	
	Local $oneClick = "Add 1-click sub-task reminders to ADO ticket."
	Local $oneClickCoding = "Set Coding sub-task to myself/Active."
	Local $sAppserveredits = "If this ticket requires App Server edits, be sure that if another dev uses my Orbis Web code edits, and does NOT have those App Server edits, that they will experience no crippling error.  In those cases, it is OK if my edits don't have the affect they should; but that dev should not be prevented from doing other development, i.e. there should be no errors thrown anywhere."
	Local $sNetworkreqs = "If manual testing becomes tedious, consider reproducing the same action by making a network request in browser (or using Postman)."
	Local $sourceBranch = "Before doing any debugging, be sure that I know the source branch beforehand.  If not, it can cause issues if I later have to migrate the edits to a different branch, which may not contain the same issues as my original branch."
	Local $sgCode = "Note: In my local rig, item SG100003995 already has the correct SGCode value in DB. With this item, I'm able to make edits in item maintenance and save without SGCode error (i.e. save prevented due to incorrect SGCode). To resolve issue for any item, do the following:  manually update DB to ensure all records in BOBarCodes for the item in-question has my SGCode value set for the sgcode column (in my case that value is: SG1)."
	Local $sSecuritydalfunc = "If edits to dalfunc-mapping.js are needed, make them. To check, do the following:{ENTER}{TAB}Find the funcID of the form in-question.{ENTER}Open dalfunc-mapping.js.{ENTER}Find the entry for your form's funcID.{ENTER}{TAB}If the entry is in the mapping object, stop here.{ENTER}If the entry is in the fromMenuSettings object, move it to the mapping object.{ENTER}If the entry does not exist, add it to the mapping object.{ENTER}{ENTER}Address methods in the DAL file that are not list, findById, buildMainClause, or lookup-methods.  Specifically, if there are methods in the DAL file which need special permissions, e.g. users with READ permission can access the method, even if they don’t have WRITE permission, then you need to add them as exceptions in the mapping section entry. For example:{ENTER}{TAB}DAL file has methods A, B, and C. Method A is a print method so allow with read permission, method B is a load data method so allow it with read permission, and method C performs an App Server call so it is not allowed with read only.  Then the entry in mapping section contains a property named exceptions—value is an array of objects, each containing a property named methodName, and a string value containing the name of the method. See existing entries in dalfunc-mapping.js for examples.{ENTER}{ENTER}Take care that other views are cross-calling to the DAL in question before moving into the bottom section or you could block a user in production who wasn't set up properly.{ENTER}See Security task for more info.{ENTER}After{ENTER}{TAB}Add edits to separate commit.{ENTER}{ENTER}{ENTER}"
	Local $sQamissed = "If at some point during this ticket it was made clear that QA missed some sort of testing step, or a testing case (even in a previous ticket), plan to notify them of that so they don’t miss it next time."
	Local $regSetting = "If I add, modify, or delete a reg setting, add that info to Resolution section."
	Local $sprintRetro = "Note what went well and what could be improved. Add those to sprint retrospective task."
	Local $sSql = "If task required modification of database (either editing schema or data), be sure to take correct action. Adding/modifying registry settings do not require action. That action is:{ENTER}{TAB}Compose the SQL statement you think will accomplish what you want.{ENTER}Send it to Jaheer for his approval. Do not continue without his approval.{ENTER}Find the SharePoint folder for Internal Releases, then find the folder for the release in-question. In that folder, should be folders for DB Schema Scripts and DB SQL Scripts. The former is for schema edits (add SQL to Word documents that are already int he folder) and the latter is for data edits (add specific .sql files containing your script). Open the desired folder."
	Local $createPr = "Wait for commits to be made in local feature branch.{ENTER}Rebase feature branch onto target branch if helpful/necessary.{ENTER}Create new PR by pushing feature to remote. Set auto-complete. In auto-complete, do not set auto-close for work item. If I do, upon PR completion, the ticket State is auto-set to Resolved and QA will immediately begin testing.  That's not what I want.{ENTER}Set Coding and Dev Testing sub-tasks to myself and Closed.{ENTER}Set PR Completion sub-tasks to myself and Active.{ENTER}Wait for PR to complete.{ENTER}Set PR Completion sub-tasks to Closed.{ENTER}"
	Local $dalFileEdits = "If edits to any DAL file method are needed, be sure to upgrade that method to use SQLx3, i.e. set clause.useSqlx3 to true."
	Local $updateTicket = "Update ticket{ENTER}{TAB}Update ticket with resolution. Add to ADO's standalone 'Resolution' section. " & $regSetting & "{ENTER}Update ticket with verification steps. Add this to 'Discussion' section.  Be sure to add screenshots where helpful.{ENTER}Update ticket with release comment (in ADO, add this to the standalone 'Resolution' section).{ENTER}" & $sSql & "{ENTER}Ensure ticket resolution section describes the edit required.{ENTER}Ensure ticket verification section describes to QA the edit required, as well as where the script is located, and exactly what tables/columns are updated.  If not, QA will have problems knowing exactly what statement to execute.{ENTER}{ENTER}{ENTER}"
	Local $assignQa = "Assign to QA by doing the following.  Ensure the State of the ADO work item is marked as 'Resolved.' After, do not do anything else, e.g. do not open board and drag ticket to 'In QA.'  Also, do not assign ticket to anyone else--leave it assigned to me. A member of QA should eventually pick it up and assign to themself."

	SendEx("^b^uTask^u^b{ENTER}+8{space}{space}{ENTER}{ENTER}{ENTER}")
	Sleep(200)
	SendEx("^b^uTo Do^u^b{ENTER}+8{space}")
	Sleep(200)
	SendEx($oneClick & "{ENTER}")
	Sleep(200)
	SendEx("Understand Issue{ENTER}")
	SendEx("Repro{ENTER}{TAB}" & $sgCode & "{ENTER}{ENTER}")
    Sleep(200)
	;~ SendEx("Debug{ENTER}{TAB}" & $sNetworkreqs & "{ENTER}When I begin working on the ticket, open the scrum board and move the ticket to the In Dev column.{ENTER}" & $sourceBranch & "{ENTER}If helpful, try to use git bisect to determine the breaking commit.{ENTER}{ENTER}T: If ticket needs another team (e.g. SWAT) to obtain more info from customer, or ask customer to check some things on their end, move status to ‘In Review’ in the scrum board.{ENTER}")
	SendEx("Debug{ENTER}{TAB}")
	SendEx($oneClickCoding & "{ENTER}")
	SendEx($sNetworkreqs & "{ENTER}When I begin working on the ticket, open the scrum board and move the ticket to the In Dev column.{ENTER}" & $sourceBranch & "{ENTER}If helpful, try to use git bisect to determine the breaking commit.{ENTER}{ENTER}T: If ticket needs another team (e.g. SWAT) to obtain more info from customer, or ask customer to check some things on their end, move status to ‘In Review’ in the scrum board.{ENTER}")
    Sleep(200)
	SendEx("Make edits{ENTER}{TAB}Check if ticket will require module conversion.  If so, and time permits, start with that.{ENTER}Try to use unit tests (maybe with ChatGPT){ENTER}" & $dalFileEdits & "{ENTER}Add JSDoc{ENTER}" & $sSecuritydalfunc & "Wait for sprint to officially start.{ENTER}Create local feature branch (syntax: feature/<number>) and commit edits there. If someone else made the edits (e.g. J), note that in the Git commit message.{ENTER}" & $sAppserveredits & "{Enter}{ENTER}")
    Sleep(200)
	SendEx($createPr)
    Sleep(200)
	SendEx($updateTicket)
    Sleep(200)
	SendEx($assignQa & "{ENTER}Wait for QA to pass.{ENTER}{ENTER}")
    Sleep(200)
	SendEx("^b^uAfter^u^b{ENTER}+8{space}Delete unnecessary branches/stashes.{ENTER}Retire browser bookmark{ENTER}" & $sQamissed & "{ENTER}" & $sprintRetro & "{ENTER}{ENTER}")

 ;~ Remove the part about module conversion.  Then, in R2 section, at start, add, “Check if ticket will require module conversion.  If so, and time permits, start with that.

	HotKeySet($kb_out_task_ticket, "out_task_ticket") ; reactivate it
  EndFunc

  Func SendEx($ss); Required to resolve issue I was having with alt and ctrl keys remaining 'stuck pressed down' after sending a keystroke.  See here: https://www.autoitscript.com/forum/topic/69754-hotkey-causing-ctrl-key-to-be-locked-down-i-think/
    Local $iT = TimerInit()

    While _IsPressed("10") Or _IsPressed("11") Or _IsPressed("12")
        If TimerDiff($iT) > 1000 Then
            MsgBox(262144, "Warning", "Shift, Ctrl and Alt Keys need to be released to proceed!")
        EndIf
    WEnd
    Send($ss)

EndFunc