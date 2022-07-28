import 'package:flutter/material.dart';

class DrawerBar extends StatelessWidget {
  const DrawerBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text("miran amanj"),
            accountEmail: const Text("miran@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://images.fandango.com/ImageRenderer/400/0/redesign/static/img/default_poster.png/0/images/masterrepository/performer%20images/p341391/ChrisPratt-2020.jpg',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://images.pexels.com/photos/4100130/pexels-photo-4100130.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'))),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
            ),
            title: const Text('Home'),
            onTap: () => print('home'),
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
            ),
            title: Text('Account'),
            onTap: () => print('Account'),
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notificatoin'),
            onTap: () => print('notificatoin'),
          ),
          ListTile(
            leading: const Icon(Icons.library_books),
            title: const Text('Jobs'),
            onTap: () => print('Jovs'),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => print('Settings'),
          ),
          ListTile(
            leading: const Icon(Icons.feedback),
            title: const Text('Feedback'),
            onTap: () => print('Feedback'),
          ),
        ],
      ),
    );
  }
}
