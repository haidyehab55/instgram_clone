import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instgram_clone/responsive/mobile_screen_layout.dart';
import 'package:instgram_clone/responsive/web_screen_layout.dart';
import 'utils/colors.dart';
import 'responsive/responsive_layout_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/login_screen.dart';
import 'screens/sign_up.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyAigeW4cQ3FgQdbGHefAUp9QEk_Y77Cofo",
        appId: "1:346357225482:web:b7159fda390c5071a5a7f3",
        messagingSenderId: "346357225482",
        projectId: "instagram-clone-d65fb",
        storageBucket: "instagram-clone-d65fb.appspot.com",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return const ResponsiveLayout(
                webScreenLayout: WebScreenLayout(),
                mobileScreenLayout: MobileScreenLayout(),
              );
            }
            else if (snapshot.hasError){
              return Center(
                child: Text('${snapshot.error}'),
              );
            }
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          }
          return const Login();
        },
      ),
      routes: {
        '/login': (context) => const Login(),
        '/signUp': (context) => const SignUp(),
      },
    );
  }
}
