import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:sena_flutter_app/helpers/firebase_errors.dart';
import 'package:sena_flutter_app/helpers/validators.dart';
import 'package:provider/provider.dart';
import 'package:sena_flutter_app/models/user.dart';
import 'package:sena_flutter_app/models/user_manager.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Entrar'),
        centerTitle: true,
        actions: [
          FlatButton(
            onPressed: () {},
            child: Text('CRIAR CONTA', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Center(
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Consumer<UserManager>(
              builder: (_, userManager, __) {
                return ListView(
                  padding: EdgeInsets.all(16),
                  shrinkWrap: true,
                  children: [
                    TextFormField(
                      enabled: !userManager.loading,
                      controller: emailController,
                      decoration: InputDecoration(hintText: 'Email'),
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      validator: (email) {
                        if (!emailValid(email)) return 'Email inválido';
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      enabled: !userManager.loading,
                      controller: passwordController,
                      decoration: InputDecoration(hintText: 'Password'),
                      obscureText: true,
                      autocorrect: false,
                      validator: (password) {
                        if (password.isEmpty || password.length < 6)
                          return 'Senha invalida';
                        return null;
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        onPressed: () {},
                        padding: EdgeInsets.zero,
                        child: const Text('Esqueci minha senha'),
                      ),
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      height: 44,
                      child: RaisedButton(
                        color: Theme.of(context).primaryColor,
                        disabledColor:
                            Theme.of(context).primaryColor.withAlpha(100),
                        textColor: Colors.white,
                        onPressed: userManager.loading
                            ? null
                            : () {
                                if (formKey.currentState.validate()) {
                                  final user = User(
                                      email: emailController.text,
                                      password: passwordController.text);
                                  userManager.signIn(
                                      user: user,
                                      onFail: (e) {
                                        scaffoldKey.currentState.showSnackBar(
                                          SnackBar(
                                            content:
                                                Text('Falha ao entrar: $e'),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                      },
                                      onSucess: () {
                                        // TODO: FECHAR TELA DE LOGIN
                                      });
                                }
                              },
                        child: userManager.loading
                            ? CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.white),
                              )
                            : Text(
                                'Entrar',
                                style: TextStyle(fontSize: 18),
                              ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
