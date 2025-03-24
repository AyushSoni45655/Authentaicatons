import 'package:authentication/auth/feature/domain/entity/user.dart';

class UserEntityModal extends UserEntity {
  UserEntityModal({
    required super.id,
    required super.name,
    required super.email,
    required super.password,
    required super.phoneNumber,
  });
  Map<String,dynamic>toMap(){
    return{
      "Id":id,
      "Name":name,
      "Email":email,
      "Password":password,
      "PhoneNumber":phoneNumber
    };
  }
  //form map to get data firebase
factory UserEntityModal.fromJson(Map<String,dynamic>json){
    return UserEntityModal(
        id: json["Id"]??"No Id",
        name: json["Name"]??"No Name",
        email: json["Email"]??"No Email",
        password: json["Password"]??"No Password",
        phoneNumber: json["PhoneNumber"]??"No PhoneNumber"
    );
}
}
