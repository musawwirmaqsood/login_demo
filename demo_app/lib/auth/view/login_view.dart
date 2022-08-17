import 'package:demo_app/auth/viewmodel/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: ViewModelBuilder<LoginViewModel>.reactive(
        builder: ((context, model, child) => Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextField(
                    controller: emailController,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        model.login(
                            emailController.text, passwordController.text);
                      },
                      child: const Text('Login'))
                ],
              ),
            )),
        viewModelBuilder: () => LoginViewModel(),
      ),
    );
  }
}
