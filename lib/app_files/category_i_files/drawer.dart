import 'package:flutter/material.dart';
import 'package:nlib_library_assistant/utils/app_colors.dart';
import 'package:nlib_library_assistant/utils/dimentions.dart';
import 'package:nlib_library_assistant/widgets/text_formatter.dart';

import '../../widgets/rounded_button.dart';

class SlidDrawer extends StatelessWidget {
  const SlidDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: AppColors.BASE_COLOR),
            accountName: TextHeader(text: 'W.D.Fernando'),
            accountEmail: TextHeader(
              text: 'wdfernando@students.nsbm.ac.lk',
              fontSize: Dimentions.font12,
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(),
            ),
          ),
          buttonPanes(
              text: 'User Profile', icon: Icon(Icons.supervised_user_circle)),
          buttonPanes(text: 'Borrowed Books', icon: Icon(Icons.library_books)),
          buttonPanes(text: 'Notification', icon: Icon(Icons.notifications)),
          buttonPanes(text: 'Favourite', icon: Icon(Icons.favorite)),
          buttonPanes(text: 'Settings', icon: Icon(Icons.settings)),
          buttonPanes(
              text: 'Help and support', icon: Icon(Icons.help_outlined)),
          SizedBox(height: Dimentions.height50),
          Padding(
            padding: EdgeInsets.all(Dimentions.height50),
            child: RoundButton(
              buttonText: 'LogOut',
            ),
          ),
        ],
      ),
    );
  }

  Widget buttonPanes({required String text, required Icon icon}) {
    return ListTile(
      leading: icon,
      title: Text(text),
      onTap: () {},
    );
  }
}
