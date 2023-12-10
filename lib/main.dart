import 'package:e_commerce/View/homescreen.dart';
import 'package:e_commerce/ViewModel/apiprovider.dart';
import 'package:e_commerce/View/loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'Model/hive.dart';
import 'ViewModel/hive_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(ModelAdapter().typeId)) {
    Hive.registerAdapter(ModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Providerprofile>(
            create: (context) => Providerprofile()),
        ChangeNotifierProvider<Hiveprovider>(
            create: (context) => Hiveprovider()),
      ],
      // child: ChangeNotifierProvider(
      //   create: (context) => providerapp(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return Homepage();
            } else {
              return Loginscreen();
            }
          }),
        ),
      ),
    );
  }
}
