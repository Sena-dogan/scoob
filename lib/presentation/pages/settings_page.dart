import 'dart:io';

import 'package:flutter/material.dart';
import 'package:scoob/presentation/widgets/bottom_nav_bar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SettingsItem(
            title: 'Help',
            icon: Icon(
              Icons.help_outline,
              size: 32,
            ),
          ),
          const CostumDivider(),
          const SettingsItem(
            title: 'Rate Us',
            icon: Icon(
              Icons.star_border,
              size: 32,
            ),
          ),
          const CostumDivider(),
          const SettingsItem(
            title: 'Share With Friends',
            icon: Icon(
              Icons.ios_share_outlined,
              size: 32,
            ),
          ),
          const CostumDivider(),
          const SettingsItem(
            title: 'Terms Of Use',
            icon: Icon(
              Icons.description_outlined,
              size: 32,
            ),
          ),
          const CostumDivider(),
          const SettingsItem(
            title: 'Privacy Policy',
            icon: Icon(
              Icons.privacy_tip_outlined,
              size: 32,
            ),
          ),
          const CostumDivider(),
          ListTile(
            leading: const Icon(
              Icons.info_outline,
              size: 32,
            ),
            title: const Text('OS Version'),
            trailing: Text(
              Platform.isAndroid
                  ? 'Android ${Platform.operatingSystemVersion.split(' ')[2]}'
                  : 'iOS ${Platform.operatingSystemVersion.split(' ')[1]}',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF3C3C43).withOpacity(0.6),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(
        selectedIndex: 1,
      ),
    );
  }
}

class CostumDivider extends StatelessWidget {
  const CostumDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      indent: 16,
      height: 2,
      color: Color(0xFFE5E5EA),
    );
  }
}

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(title),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: const Color(0xFF3C3C43).withOpacity(0.6),
      ),
    );
  }
}
