import 'package:flutter/material.dart';
import 'package:pp2/data/users_data.dart';
import 'package:pp2/models/user_model.dart';
import 'package:pp2/utils/enums.dart';

class UserDataController extends ChangeNotifier {
  User? user;
  USER userState = USER.ABSENT;

  Future<void> setUser({String? userID, User? user}) async {
    if (userState != USER.LOADING) {
      userState = USER.LOADING;
      await Future.delayed(Duration.zero);
      notifyListeners();
    }

    if (userID != null) {
      this.user = await UserData.getUser(userID: userID);
      userState = USER.PRESENT;
    } else {
      this.user = user!;
      userState = USER.PRESENT;
    }
    notifyListeners();
  }

  Future<void> createUser({required User user}) async {
    userState = USER.LOADING;
    await Future.delayed(Duration.zero);
    notifyListeners();
    await UserData.createUser(user: user);
    await setUser(user: user);
  }
}
