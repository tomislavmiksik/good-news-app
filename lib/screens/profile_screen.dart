import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const routePath = '/profile';

  ProfileScreen({Key? key}) : super(key: key);
  //this shit is a concept end me
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 300,
            alignment: Alignment.center,
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/geoff.jpg'),
                  radius: 75,
                ),
                SizedBox(height: 20),
                Text(
                  'Geoffrey Bayzose',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '@bigGeoffTheAmazonian',
                  style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
