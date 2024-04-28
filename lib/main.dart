import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/route_manager.dart';
import 'package:pp2/controllers/Authentication/auth_screen_controller.dart';
import 'package:pp2/controllers/Authentication/user_controller.dart';
import 'package:pp2/controllers/HomeNavController/home_nav_controller.dart';
import 'package:pp2/firebase_options.dart';
import 'package:pp2/utils/routing.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );
  runApp(const Wave());
}

class Wave extends StatelessWidget {
  const Wave({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserDataController(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeNavController(),
        ),
      ],
      child: GetMaterialApp(
        getPages: AppRoutes.routes,
        initialRoute: AppRoutes.splashScreen,
      ),
    );
  }
}
