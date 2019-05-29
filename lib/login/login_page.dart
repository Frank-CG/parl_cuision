import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

import 'package:parl_cuision/authentication/authentication.dart';
import 'package:parl_cuision/login/login.dart';

class LoginPage extends StatefulWidget {
  final UserRepository userRepository;

  LoginPage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc _loginBloc;
  AuthenticationBloc _authenticationBloc;

  UserRepository get _userRepository => widget.userRepository;

  @override
  void initState() {
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    _loginBloc = LoginBloc(
      userRepository: _userRepository,
      authenticationBloc: _authenticationBloc,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Login'),
      // ),
      // body: LoginForm(
      //   authenticationBloc: _authenticationBloc,
      //   loginBloc: _loginBloc,
      // ),
      resizeToAvoidBottomPadding: true,
      body:Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/bg.png"), fit: BoxFit.fill),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              flex: 0,
              child: Container(
                height: 100,
              ),
            ),
            Center(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      "Parl",
                      style: TextStyle(color: Colors.white, fontSize: 48.0, fontFamily: "Playfair Display",),
                    ),
                    Text(
                      "Cuision",
                      style: TextStyle(color: Colors.white, fontSize: 48.0, fontFamily: "Playfair Display"),
                    ),
                  ],
                ),
              ),
            ),            
            Text('- W E L C O M E -', style: TextStyle(color: Colors.white,),),
            Expanded(
              child: LoginForm(
                authenticationBloc: _authenticationBloc,
                loginBloc: _loginBloc,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }
}
