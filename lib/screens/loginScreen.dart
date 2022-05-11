import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';
import 'package:local_social_flutter/components/auth_state.dart';
import 'package:local_social_flutter/utils/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends AuthState<LoginScreen> {
  bool _isLoading = false;
  late final TextEditingController _emailController;

  Future<void> _signIn() async {
    setState(() {
      _isLoading = true;
    });
    final response = await supabase.auth.signIn(
        email: _emailController.text,
        options: AuthOptions(
            redirectTo: kIsWeb
                ? null
                : 'io.supabase.flutterquickstart://login-callback/'));
    final error = response.error;
    if (error != null) {
      context.showErrorSnackBar(message: error.message);
    } else {
      context.showSnackBar(message: 'Check your email for login link!');
      _emailController.clear();
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        children: [
          const Text('Sign in via the magic link with your email below'),
          const SizedBox(height: 18),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          const SizedBox(height: 18),
          ElevatedButton(
            onPressed: _isLoading ? null : _signIn,
            child: Text(_isLoading ? 'Loading' : 'Send Magic Link'),
          ),
        ],
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:local_social_flutter/services/userService.dart';
// import 'bulletinScreen.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({
//     Key? key,
//   }) : super(key: key);

//   static const routeName = '/login';

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();

//   final _userService = new UserService();

//   @override
//   void initState() {
//     super.initState();
//   }

//   void handleLogin() async {
//     final email = emailController.text;
//     final password = passwordController.text;
//     if (await _userService.loginUser(email, password)) {
//       // Navigator.pushReplacementNamed(context, BulletinScreen.routeName);
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Error Logging in'),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(10),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'Login',
//                 style: Theme.of(context).textTheme.headline5,
//               ),
//               TextFormField(
//                 decoration: const InputDecoration(
//                   border: UnderlineInputBorder(),
//                   labelText: 'Email',
//                 ),
//                 controller: emailController,
//               ),
//               TextFormField(
//                 decoration: const InputDecoration(
//                   border: UnderlineInputBorder(),
//                   labelText: 'Password',
//                 ),
//                 controller: passwordController,
//               ),
//               ElevatedButton(
//                 child: const Text('Login'),
//                 onPressed: handleLogin,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
