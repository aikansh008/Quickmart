import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class Listtile extends StatelessWidget {
  const Listtile(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle,
      this.trailing,  this.screen});
  final IconData icon;
  final String title, subtitle;
  final Widget? trailing;
  final Widget? screen;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
          Navigator.push(
                    context, MaterialPageRoute(builder: (context) =>screen! ));
      },
      isThreeLine: true,
      leading: Icon(
        icon,
        size: 20,
        color: ecolor.primary,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: ESizes.md,
        ),
      ),
      subtitle: Text(subtitle,
          style: TextStyle(
            fontSize: ESizes.md,
          )),
      trailing: trailing,
    );
  }
}
