import 'package:pp2/models/user_model.dart';
import 'package:pp2/utils/constants.dart';

class UserData {
  static Future<User> getUser({required String userID}) async {
    
    var userResponse = await database.doc(userID).get();
    User user = User.fromMap(userResponse.data()!);
    return user;
  }

  static Future<User> createUser({required User user}) async {
    var userResponse = await database.doc(user.id).set(user.toMap());
    return user;
  }
}
