import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:local_social_flutter/screens/bulletinScreen.dart';
import './screens/loginScreen.dart';
import './screens/account_screen.dart';
import './screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: '',
    anonKey: '',
    // authCallbackUrlHostname: 'login-callback', // optional
    // debug: true, // optional
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Supabase Flutter',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.green,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.white,
            primary: Colors.green,
          ),
        ),
      ),
      initialRoute: SplashScreen.routeName,
      routes: <String, WidgetBuilder>{
        SplashScreen.routeName: (_) => const SplashScreen(),
        LoginScreen.routeName: (_) => const LoginScreen(),
        AccountScreen.routeName: (_) => const AccountScreen(),
      },
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Local Social',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         elevatedButtonTheme: ElevatedButtonThemeData(
//           style: ElevatedButton.styleFrom(
//             primary: Colors.blue[500],
//             shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(50)),
//             ),
//           ),
//         ),
//       ),
//       initialRoute: LoginScreen.routeName,
//       routes: {
//         LoginScreen.routeName: (context) => const LoginScreen(),
//         BulletinScreen.routeName: (context) => const BulletinScreen(),
//       },
//     );
//   }
// }
