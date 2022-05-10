import 'package:flutter/material.dart';
import './bulletinScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  static const routeName = '/';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: Theme.of(context).textTheme.headline5,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Email',
                ),
                onChanged: (text) {
                  print('First text field: $text');
                },
              ),
              ElevatedButton(
                child: Text('Login'),
                onPressed: () => Navigator.pushReplacementNamed(
                    context, BulletinScreen.routeName),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
