import 'package:flutter/material.dart';
import 'package:intern_proj_fl/auth/screen/info.dart';
import 'package:intern_proj_fl/components/body.dart';
import 'package:intern_proj_fl/provider/auth_provider.dart';
import 'package:intern_proj_fl/splash/entry_screens.dart';
import 'package:intern_proj_fl/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'constants.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>AuthProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFEEF1F8),
          // primarySwatch: Colors.blue,
          primaryColor: primaryClr,
          fontFamily: "Intel",
          inputDecorationTheme:const InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
            errorStyle: TextStyle(height: 0),
          ),
        ),
        home:SplashScreen(),
      ),
    );
  }
}

