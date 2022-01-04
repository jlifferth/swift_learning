
struct MyStructure {
    
    var message = "Hello"
    
    func myFunction() {
        
        print(message)
    }
}

var a:MyStructure = MyStructure()
a.message = "Hi"
print(a.message)
a.myFunction()

var b = MyStructure()
b.message = "World"
print(b.message)


struct DatabaseManager {

    private var severName = "Server 1"

    func saveData(data:String) -> Bool {
        
        print(severName)
        // This code saves the data and returns a boolean result
        return true
    }
}


struct ChatView {
    var message = "Hello"
    
    func sendChat() {
        // Save the chat message
        let db = DatabaseManager()
        _ = db.saveData(data: message)
        
        // Check the successful boolean value, if unsuccessful, show alert to user
    }
}
