
import 'package:flutter/material.dart';

import '../auth/auth_service.dart';
import 'launcher_page.dart';

class UserDashboardPage extends StatelessWidget {
  static const String routeName = '/userdashboard';
  const UserDashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            AuthService.logout();
            Navigator.pushReplacementNamed(context, LauncherPage.routeName);
          }, icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('User Dashboard'),
          ],
        ),
      ),
    );
  }

}
