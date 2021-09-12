import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lecket_mobile/blocs/login/login_bloc.dart';
import 'package:lecket_mobile/components/screens/auth/login_screen.dart';
// import 'package:lecket_mobile/components/widgets/back_button_icon.dart';
import 'package:lecket_mobile/core/injection_container.dart';

class HomeContentScreen extends StatefulWidget {
  @override
  HomeContentScreenState createState() => HomeContentScreenState();
}

class HomeContentScreenState extends State<HomeContentScreen> {
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: LoginScreen(),
    // );
    return Scaffold(
      body: BlocProvider<LoginBloc>(
        create: (_) => sl<LoginBloc>(),
        child: LoginScreen(),
      ),
    );
  }
}
