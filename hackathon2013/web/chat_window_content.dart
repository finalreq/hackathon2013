import 'dart:html';
import 'package:hackathon2013/user.dart';
import 'package:hackathon2013/chat_message.dart';
import 'package:polymer/polymer.dart';

@CustomTag('chat-window-content')
class ChatWindowContent extends PolymerElement {
  
  var chatTextWindow;
  var inputTextWindow;
  var timeAliveWindow;
  var sendButton;
  
  User user;
  
  WebSocket webSocket;
  
  void inserted() {
    super.inserted();
    
    webSocket.onMessage.listen(receiveFromServer);
    
    chatTextWindow = $['chatTextWindowId'];
    inputTextWindow = $['inputTextWindowId'];
    timeAliveWindow = $['timeAliveWindowId'];
    sendButton = $['sendButtonId'];
  }
  
  void send(MouseEvent e) {
    //SEND
    if(inputTextWindow.value != "") {
      
      ChatMessage message = new ChatMessage(inputTextWindow.value, new Duration(hours:0, minutes:0, seconds:int.parse(timeAliveWindow.value)), user);
      
      webSocket.sendString(message.toJSON());
      
      inputTextWindow.value = "";
    }
  }
  
  void enter(KeyboardEvent e) {
    if(e.keyCode == KeyCode.ENTER) {
      sendButton.click();
    }
  }
  
  void receiveFromServer(MessageEvent e) {
    
  }
}