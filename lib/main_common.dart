import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lecket_mobile/routes.dart';
import 'package:lecket_mobile/core/injection_container.dart' as di;
import 'package:lecket_mobile/components/screens/home/home_screen.dart';

Future<void> mainCommon(String env) async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lecket",
      home: HomeScreen(),
      initialRoute: "/",
      routes: routes,
    );
  }
}
