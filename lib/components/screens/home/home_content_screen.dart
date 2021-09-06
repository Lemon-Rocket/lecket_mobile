import 'package:flutter/material.dart';
import 'package:lecket_mobile/components/screens/auth/login_screen.dart';

class HomeContentScreen extends StatefulWidget {
  @override
  HomeContentScreenState createState() => HomeContentScreenState();
}

class HomeContentScreenState extends State<HomeContentScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: LoginScreen(),
    );
  }
}
