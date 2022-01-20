import 'package:flutter/material.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  HomeAppBar({required Key key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();

  @override
  final preferredSize;
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Welcome back Geoffrey'),
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
    );
  }
}
