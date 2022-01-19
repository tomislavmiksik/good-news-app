import 'package:flutter/material.dart';

class ProfileAppBar extends StatefulWidget implements PreferredSizeWidget {
  ProfileAppBar({required Key key}) : preferredSize = const Size.fromHeight(kToolbarHeight), super(key: key);

  @override
  State<ProfileAppBar> createState() => _ProfileAppBarState();

  @override
  final preferredSize;
}

class _ProfileAppBarState extends State<ProfileAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      
    );
  }
}