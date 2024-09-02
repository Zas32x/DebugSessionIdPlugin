class_name DebugSessionId

static var id := -1

static func on_session_id(lambda: Callable):
	if id >= 0:
		lambda.call(id)
		pass
	
	var callback := func(message: String, data: Array) -> bool:
		id = data[0]
		lambda.call(data[0])
		return true
	
	EngineDebugger.register_message_capture("DebugSessionIdPlugin", callback)
	EngineDebugger.send_message("DebugSessionIdPlugin:ID", [])
