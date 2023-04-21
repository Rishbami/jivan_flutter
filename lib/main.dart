import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jivan/DevicePage/device_model.dart';
import 'package:jivan/LoginPage/welcome_screen.dart';
import 'package:jivan/RoomPage/room_model.dart';
import 'package:jivan/jivan_page.dart';
import 'package:provider/provider.dart';
import 'package:jivan/LoginPage/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:jivan/LoginPage/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DeviceModel()),
        ChangeNotifierProvider(create: (context) => RoomModel())
      ],
      child: MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        iconTheme: const IconThemeData(
          color: Color(0xff443B52),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
          color: Color(0xff507b75),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
              color: Color(0xff443B52)
          ),
        ),
        tabBarTheme: const TabBarTheme(
          unselectedLabelColor: Color(0xb2ffffff), // 0xb2 70%
          labelColor: Colors.white,
          ),
        ),
        home: const JivanPage(),
      ),
    ),
  );
}
