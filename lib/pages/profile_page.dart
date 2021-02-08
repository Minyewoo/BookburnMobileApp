import 'package:flutter/material.dart';
import 'package:flutter_login_vk/flutter_login_vk.dart';

class ProfileArguments {
  final VKUserProfile profile;

  ProfileArguments(this.profile);
}

class ProfilePage extends StatelessWidget {
  static String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    final ProfileArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('User: '),
            Text(
              '${args.profile.firstName} ${args.profile.lastName}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            if (args.profile.photo200 != null)
              Image.network(args.profile.photo200),
          ],
        ),
      ),
    );
  }
}