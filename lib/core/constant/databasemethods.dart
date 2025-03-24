import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethod{
  Future addMessage(String chatRoomId,String messageId,Map<String,dynamic>messageInfo)async{
    return await FirebaseFirestore.instance.collection("ChatRooms").doc(chatRoomId).collection("Chats").doc(messageId).set(messageInfo);
  }
  Future updateLatsMessageSend(String chatRoomId,Map<String,dynamic>latMesasageInfoMap)async{
    return await FirebaseFirestore.instance.collection("ChatRooms").doc(chatRoomId).update(latMesasageInfoMap);
  }
}