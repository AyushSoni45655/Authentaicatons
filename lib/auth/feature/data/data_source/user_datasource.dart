import 'package:authentication/auth/feature/data/entity_modal/user_entity_modal.dart';
import 'package:authentication/auth/feature/domain/entity/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserDataSource{
  Future<UserEntityModal>signUp(UserEntity userentity);
  Future<UserEntityModal>signin(String email,String password);
  Future<void>forgotPassword(String email);
  Future<bool>isUserLoggedIn();
  Future<void>logOut();
  Future<UserEntityModal>getUser();
}
class userDataSourceImplementation extends UserDataSource{
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  final SharedPreferences sh;
  userDataSourceImplementation({required this.firestore,required this.auth,required this.sh});
  @override
  Future<void> forgotPassword(String email)async{
     await auth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<bool> isUserLoggedIn()async{
   return sh.containsKey("Uid");
  }

  @override
  Future<void> logOut()async{
   await auth.signOut();
   await sh.remove("Uid");
  }

  @override
  Future<UserEntityModal> signUp(UserEntity userentity)async{
   final credentail = await auth.createUserWithEmailAndPassword(email: userentity.email, password: userentity.password);
   final data = UserEntityModal(
       id: credentail.user!.uid,
       name: userentity.name,
       email: userentity.email,
       password: userentity.password,
       phoneNumber: userentity.phoneNumber
   );
   await firestore.collection("Users").doc(data.id).set(data.toMap());
   await sh.setString("Uid", data.id);
   return data;
  }

  @override
  Future<UserEntityModal> signin(String email, String password)async{
  final credentail = await auth.signInWithEmailAndPassword(email: email, password: password);
  final userData = await firestore.collection("Users").doc(credentail.user!.uid).get();
  await sh.setString("Uid", credentail.user!.uid);
  return UserEntityModal.fromJson(userData.data()!);
  }

  @override
  Future<UserEntityModal> getUser()async{
    final uid =  sh.getString("Uid");
    if(uid == null){
      throw Exception("User is not logged in");
    }
   final datas = await firestore.collection("Users").doc(uid).get();
    if(!datas.exists){
      throw Exception("No User data found");
    }
    return UserEntityModal.fromJson(datas.data()!);
  }

}