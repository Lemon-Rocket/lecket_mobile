import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'home_content_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: HomeContentScreen(),
      ),
      onWillPop: () async {
        final response = await showOkCancelAlertDialog(
          context: context,
          message:
              '  Estas por salir de la aplicación.\n¿Estas seguro que quireres salir?',
          title: 'Salir de la aplicación',
          okLabel: 'Salir',
          cancelLabel: 'Volver',
        );
        if (response == OkCancelResult.ok) {
          return true;
        }
        return false;
      },
    );
  }
}
