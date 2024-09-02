This simple plugin provides a way to retrieve the debug session ID from Godot editor.\
The first debug instance ID is 0, in the editor debugger this is shown as Session 1.
# Examples
## GDScript
```javascript
DebugSessionId.on_session_id(func(id):
    print(id)
    )
```
## C#
```csharp
DebugSessionId.OnSessionId(id => {
    GD.Print(id);
});
```
