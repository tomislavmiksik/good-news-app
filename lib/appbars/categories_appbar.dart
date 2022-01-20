import 'package:flutter/material.dart';

class CategoriesAppBar extends StatefulWidget implements PreferredSizeWidget {
  CategoriesAppBar({required Key key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  State<CategoriesAppBar> createState() => _CategoriesAppbarState();

  @override
  final preferredSize;
}

class _CategoriesAppbarState extends State<CategoriesAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Welcome back Geoffrey'),
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
    );
  }
}
