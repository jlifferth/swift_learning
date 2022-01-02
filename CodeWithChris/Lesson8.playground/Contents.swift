struct ChatView {
    
    // Properties
    var message:String = ""
    var messageWithPrefix:String {
        let prefix = "Chris says: "
        return prefix + message
    }

    // Methods
    func sendChat() {
        
        
        // Code to send the chat message
        print(messageWithPrefix)
        
    }
    
    func deleteChat() {
        print(messageWithPrefix)
    }
    
}
