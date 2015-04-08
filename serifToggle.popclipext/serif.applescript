on run
	
	global selection
	set the selection to "{popclip text}"
	#set the selection to "<div>one</div>
	#" & "<div>two</div>
	#"
	
	global originalApplication
	
	tell application "System Events"
		set originalApplication to name of the first process whose frontmost is true
	end tell
	
	
	do shell script "echo " & quoted form of selection & " | textutil -convert rtf -font Courier -stdin -stdout | pbcopy -Prefer rtf"
	
	tell application originalApplication
		
		#tell application "Airmail"
		activate
		tell application id "com.apple.systemevents"
			keystroke "v" using {command down}
		end tell
	end tell
	
	
end run
