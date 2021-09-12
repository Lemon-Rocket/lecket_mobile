import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lecket_mobile/blocs/login/login_bloc.dart';
import 'package:lecket_mobile/components/screens/dashboard/dashboard_screen.dart';
import 'package:lecket_mobile/components/widgets/fade_animation.dart';
import 'package:lecket_mobile/components/widgets/loading_indicator.dart';
import 'package:lecket_mobile/components/widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  String errorMessage = "";
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginBlocState>(
      listener: (BuildContext context, state) {
        if (state is LoginSuccess) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (_) => DashboardScreen(),
            ),
            ModalRoute.withName('/'),
          );
        } else if (state is LoginFailure) {
          setState(() {
            errorMessage = state.message;
          });
        }
      },
      builder: (BuildContext context, state) {
        if (state is LoginInProgress) {
          return LoadingIndicator();
        } else {
          return buildBody(context);
        }
      },
    );
  }

  Widget buildBody(BuildContext context) {
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
                          onChanged: (value) {
                            email = value;
                          },
                        ),
                      ),
                      _handlerSize(),
                      FadeAnimation(
                        1.3,
                        _handlerPasswordInput(),
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
                      onPressed: () {
                        BlocProvider.of<LoginBloc>(context).add(
                          LoginStarted(
                            email: email,
                            password: password,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                FadeAnimation(
                  1.5,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "¿No tienes cuenta? ",
                      ),
                      Text(
                        "Registrate",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
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

  Widget _handlerPasswordInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text(
            "Contraseña",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.black87,
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          obscureText: obscureText,
          cursorColor: Colors.black,
          onChanged: (value) => password = value,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: obscureText
                  ? Icon(Icons.visibility)
                  : Icon(Icons.visibility_off),
              onPressed: () {
                setState(
                  () {
                    obscureText = !obscureText;
                  },
                );
              },
            ),
            contentPadding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 15,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Colors.black,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Colors.grey[400],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
