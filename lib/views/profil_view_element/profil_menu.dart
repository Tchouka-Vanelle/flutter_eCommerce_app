import 'package:flutter/material.dart';
import 'package:task_management/models/user_session.dart';
import 'package:task_management/views/profil_view_element/login_view.dart';

class ProfilMenu extends StatelessWidget {

  const ProfilMenu({super.key});

  Future<void> _logout(BuildContext context) async {
    final session = await UserSession.instance;
    await session.clearSession();

    if (context.mounted) {
       Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (context) => const LoginView())
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      onSelected: (value){
        switch (value) {
          case 'Login':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginView()),
            );
            break;
          case 'Logout':
            _logout(context);
            break;
          }
      },
      itemBuilder: (context) => [
        const PopupMenuItem(value: 'Login', 
            child: Row(
                    children: [
                      Icon(Icons.login, color: Colors.blue),
                      SizedBox(width: 10),
                      Text('Login'),
                    ],
                  ),
        ),
        const PopupMenuItem(value: 'Logout', 
            child: Row(
            children: [
              Icon(Icons.logout, color: Colors.red),
              SizedBox(width: 10),
              Text('Logout'),
            ],
          ),
        ),
      ],
    );
  }

}
