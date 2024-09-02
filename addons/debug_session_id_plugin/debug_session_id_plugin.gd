@tool
extends EditorPlugin

class DebugSessionIDPlugin extends EditorDebuggerPlugin:
	func _has_capture(capture):
		return capture == "DebugSessionIdPlugin"
		
	func _capture(message:String, data, session_id:int) -> bool:
		get_session(session_id).send_message("DebugSessionIdPlugin:ID", [session_id])
		return true

var debugger := DebugSessionIDPlugin.new()

func _enter_tree():
	add_debugger_plugin(debugger)
	pass

func _exit_tree():
	remove_debugger_plugin(debugger)
	pass
