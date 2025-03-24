
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper{
  static  String getUserId = "USERID";
  static String getUserName = "USERName";
  static  String getUserImage = "USERImage";
  static String getUserUserName = "USERName";
  static  String getUserEmail = "USEREmail";
  Future<bool>saveUserId(String id)async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(getUserId, id);
  }
  Future<bool>saveUserName(String name)async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(getUserName, name);
  }
  Future<bool>saveUserUserName(String userName)async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(getUserUserName, userName);
  }
  Future<bool>saveUserEmail(String email)async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(getUserEmail, email);
  }
  Future<bool>saveUserImage(String image)async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(getUserImage, image);
  }
  Future<String?>getUsersName()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(getUserName);
  }
  Future<String?>getUsersUserName()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(getUserUserName);
  }
  Future<String?>getUsersId()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(getUserId);
  }
  Future<String?>getUsersEmail()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(getUserEmail);
  }
  Future<String?>getUsersImage()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(getUserImage);
  }
}