import 'package:polymer/polymer.dart';

@CustomTag('message-box')
class MessageBox extends PolymerElement {
  @observable String boxText = 'Empty Message Box';
  @observable String cssClassProps = "right";
  
  get applyAuthorStyles => true;
}