import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lecket_mobile/components/widgets/fade_animation.dart';
import 'package:lecket_mobile/components/widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    _handlerSize(),
                    FadeAnimation(
                      1,
                      Text(
                        "Iniciar Sesion",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(
                        1.2,
                        InputPrimary(
                          label: "Email",
                        ),
                      ),
                      _handlerSize(),
                      FadeAnimation(
                        1.3,
                        InputPrimary(
                          label: "Contraseña",
                          obscureText: true,
                        ),
                      ),
                      _handlerSize(),
                    ],
                  ),
                ),
                FadeAnimation(
                  1.4,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: ButtonPrimary(
                      text: "Iniciar sesion",
                    ),
                  ),
                ),
                FadeAnimation(
                  1.5,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("¿No tienes cuenta? "),
                      Text(
                        "Registrate",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _handlerSize() {
    return SizedBox(
      height: 20,
    );
  }
}
