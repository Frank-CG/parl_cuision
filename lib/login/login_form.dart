import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:parl_cuision/authentication/authentication.dart';
import 'package:parl_cuision/login/login.dart';

class LoginForm extends StatefulWidget {
  final LoginBloc loginBloc;
  final AuthenticationBloc authenticationBloc;

  LoginForm({
    Key key,
    @required this.loginBloc,
    @required this.authenticationBloc,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginBloc get _loginBloc => widget.loginBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginEvent, LoginState>(
      bloc: _loginBloc,
      builder: (
        BuildContext context,
        LoginState state,
      ) {
        if (state is LoginFailure) {
          _onWidgetDidBuild(() {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('${state.error}'),
                backgroundColor: Colors.red,
              ),
            );
          });
        }

        // return Form(
        //   child: Column(
        //     children: [
        //       TextFormField(
        //         decoration: InputDecoration(labelText: 'username'),
        //         controller: _usernameController,
        //       ),
        //       TextFormField(
        //         decoration: InputDecoration(labelText: 'password'),
        //         controller: _passwordController,
        //         obscureText: true,
        //       ),
        //       RaisedButton(
        //         onPressed:
        //             state is! LoginLoading ? _onLoginButtonPressed : null,
        //         child: Text('Login'),
        //       ),
        //       Container(
        //         child:
        //             state is LoginLoading ? CircularProgressIndicator() : null,
        //       ),
        //     ],
        //   ),
        // );

        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/plate.png"), fit: BoxFit.contain)
          ),
          //color: Colors.grey.shade300,
          margin: EdgeInsets.all(32.0),
          //padding: EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email', 
                      labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      fillColor: Colors.white,
                      enabledBorder: new UnderlineInputBorder(
                          borderSide: new BorderSide(color: Colors.white70,) ),
                    ),
                    controller: _usernameController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password', 
                      labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      fillColor: Colors.white,
                      enabledBorder: new UnderlineInputBorder(
                          borderSide: new BorderSide(color: Colors.white70,) ),
                    ),
                    controller: _passwordController,
                    obscureText: true,
                  ),
                  SizedBox(height: 180),
                  ConstrainedBox(
                    constraints: const BoxConstraints(minWidth: 320, minHeight: 50,), 
                    child: RaisedButton(
                              onPressed:
                                  state is! LoginLoading ? _onLoginButtonPressed : null,
                              child: Text('Login', style:TextStyle(fontSize: 16.9, fontWeight: FontWeight.bold),),
                            ),
                  ),
                  SizedBox(height: 20),
                  new InkWell(
                      child: new Text('Forgot password?',style:TextStyle(color: Colors.white, fontSize: 16.9,),),
                      onTap: () => {},
                  ),
                  Container(
                    child:
                        state is LoginLoading ? CircularProgressIndicator() : null,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

  _onLoginButtonPressed() {
    _loginBloc.dispatch(LoginButtonPressed(
      username: _usernameController.text,
      password: _passwordController.text,
    ));
  }
}
