using Godot;
using System;
using Godot.Collections;
using Array = Godot.Collections.Array;

namespace Zas;

public class DebugSessionId {
	private static int id = -1;

	public static void OnSessionId(Action<int> callback) {
		if (id >= 0) {
			callback(id);
			return;
		}

		EngineDebugger.RegisterMessageCapture("DebugSessionIdPlugin", Callable.From<string, Godot.Collections.Array, bool>((_, data) => {
			id = data[0].AsInt32();
			callback(id);
			return true;
		}));
		EngineDebugger.SendMessage("DebugSessionIdPlugin:ID", new Array());
	}
}
