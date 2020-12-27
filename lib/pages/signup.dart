import 'package:flutter/material.dart';
import 'package:sena_flutter_app/helpers/validators.dart';
import 'package:sena_flutter_app/models/user.dart';
import 'package:provider/provider.dart';
import 'package:sena_flutter_app/models/user_manager.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController passwordController = TextEditingController();

  String roleChoose;
  List listRoles = ['Usuário', 'Gestor', 'Parceiro'];
  String teamChoose;
  List listTeams = ['Empresarial', 'TV', 'Fibra', 'Todas'];

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final User user = User();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(title: Text('Criar Conta')),
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
                      decoration:
                          const InputDecoration(hintText: 'Nome Completo'),
                      keyboardType: TextInputType.text,
                      validator: (String name) {
                        if (name.isEmpty)
                          return 'Campo obrigatório';
                        else if (name.trim().split(' ').length <= 1)
                          return 'Preencha seu nome completo';
                        return null;
                      },
                      onSaved: (name) => user.name = name,
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      enabled: !userManager.loading,
                      decoration: const InputDecoration(hintText: 'Email'),
                      keyboardType: TextInputType.emailAddress,
                      validator: (String email) {
                        if (email.isEmpty)
                          return 'Campo obrigatório';
                        else if (!emailValid(email)) return 'Email invalido';
                        return null;
                      },
                      onSaved: (email) => user.email = email,
                    ),
                    SizedBox(height: 16),
                    DropdownButtonFormField(
                      hint: Container(child: Text('Novo Selecione cargo:')),
                      value: roleChoose,
                      items: listRoles.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          roleChoose = newValue;
                        });
                      },
                      onSaved: (role) => user.role = role,
                    ),
                    SizedBox(height: 16),
                    DropdownButtonFormField(
                      hint: Container(child: Text('Novo Selecione alavanca:')),
                      value: teamChoose,
                      items: listTeams.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          teamChoose = newValue;
                        });
                      },
                      onSaved: (team) => user.team = team,
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      enabled: !userManager.loading,
                      controller: passwordController,
                      decoration: const InputDecoration(hintText: 'Senha'),
                      obscureText: true,
                      validator: (String pass) {
                        if (pass.isEmpty)
                          return 'Campo obrigatório';
                        else if (pass.length < 6) return 'Senha muito curta';
                        return null;
                      },
                      onSaved: (password) => user.password = password,
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      enabled: !userManager.loading,
                      decoration:
                          const InputDecoration(hintText: 'Repita a senha'),
                      obscureText: true,
                      validator: (String value) {
                        if (value.isEmpty)
                          return 'Campo obrigatório';
                        else if (value != passwordController.text)
                          return 'Senhas não coincidem';
                        return null;
                      },
                      onSaved: (confirmPassword) =>
                          user.confirmPassword = confirmPassword,
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
                                  formKey.currentState.save();
                                  userManager.signup(
                                    user: user,
                                    onFail: (e) {
                                      scaffoldKey.currentState.showSnackBar(
                                        SnackBar(
                                          content:
                                              Text('Erro ao cadastrar: $e'),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    },
                                    onSucess: () {
                                      Navigator.of(context).pop();
                                    },
                                  );
                                }
                              },
                        child: userManager.loading
                            ? CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.white),
                              )
                            : Text(
                                'Cadastrar',
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
