import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocho_project/constants.dart';
import 'package:pocho_project/routes/route.dart';
import 'package:pocho_project/splash/splash.dart';

void main() async {
  // initializing the firebase firestore
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyB6dcXHX0umJAvPEToSwfyQgYzaozi8V0A",
        appId: "1:259485677318:web:c1809b0492c18760151087",
        messagingSenderId: "259485677318",
        projectId: "instagram-58391",
        storageBucket: "instagram-58391.appspot.com",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          initialRoute: SplashScreen.routeName,
          routes: routes,

          debugShowCheckedModeBanner: false,
          title: 'First Method',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData.dark().copyWith(
            canvasColor: Colors.black,
            scaffoldBackgroundColor: Colors.black,
            textTheme: Typography.englishLike2018
                .apply(fontSizeFactor: 1.sp, bodyColor: Colors.white),
          ),
          home: child,
        );
      },
      child: SplashScreen(),
    );
  }
}
