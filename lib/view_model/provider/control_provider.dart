import 'package:end/screens/coin/home_screen.dart';
import 'package:end/screens/coin/profile_screen.dart';
import 'package:end/screens/coin/search_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ControlProvider with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;

  String? uid;

  ControlProvider() {
    getAuth();
  }

  void getAuth() async {
    uid = await auth.currentUser?.uid ?? null;
    notifyListeners();
  }

  int currentIndex = 0;

  Widget currentScreen = HomeScreen();

  void changeSelectedValue(int selectedValue) {
    currentIndex = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          currentScreen = HomeScreen();
          break;
        }
      case 1:
        {
          currentScreen = SearchScreen();
          break;
        }
      case 2:
        {
          currentScreen = ProfileScreen();
          break;
        }
    }
    notifyListeners();
  }
}
