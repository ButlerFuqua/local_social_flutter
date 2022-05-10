import 'package:flutter/material.dart';
import 'loginScreen.dart';

class BulletinScreen extends StatelessWidget {
  const BulletinScreen({Key? key}) : super(key: key);

  static const routeName = '/bulletin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bulletin'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.blender),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushReplacementNamed(context, LoginScreen.routeName);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: const [
            Text('data'),
          ],
        ),
      ),
    );
  }
}
