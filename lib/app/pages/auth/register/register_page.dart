import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/styles/text_styles.dart';
import '../../../core/ui/components/button.dart';
import 'presenter/register_presenter.dart';
import 'view/register_view_impl.dart';

class RegisterPage extends StatefulWidget {

  final RegisterPresenter presenter;

  const RegisterPage({super.key, required this.presenter});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends RegisterViewImpl {
  final formKey = GlobalKey<FormState>();
  final nameEC = TextEditingController();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  final confirmPasswordEC = TextEditingController();

  @override
  void dispose() {
    nameEC.dispose();
    emailEC.dispose();
    passwordEC.dispose();
    confirmPasswordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 106.82,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/ball.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                'Create an Account',
                style: context.textStyles.titleBlack,
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameEC,
                      decoration: const InputDecoration(
                        label: Text('Full Name *'),
                      ),
                      validator: Validatorless.required('Required'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: emailEC,
                      decoration: const InputDecoration(
                        label: Text('Email *'),
                      ),
                      validator: Validatorless.multiple([
                        Validatorless.required('Required'),
                        Validatorless.email('Invalid email'),
                      ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: passwordEC,
                      obscureText: true,
                      decoration: const InputDecoration(
                        label: Text('Password *'),
                      ),
                      validator: Validatorless.multiple([
                        Validatorless.required('Required'),
                        Validatorless.min(
                            6, 'Password must have at least 6 characters'),
                      ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: confirmPasswordEC,
                      obscureText: true,
                      decoration: const InputDecoration(
                        label: Text('Confirm Password *'),
                      ),
                      validator: Validatorless.multiple([
                        Validatorless.required('Required'),
                        Validatorless.min(6,
                            'Confirm Password must have at least 6 characters'),
                        Validatorless.compare(
                            passwordEC, "Passwords don't match"),
                      ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Button.primary(
                      onPressed: () {
                        final formValid =
                            formKey.currentState?.validate() ?? false;

                        if (formValid) {
                          showLoader();
                          widget.presenter.register(
                            name: nameEC.text,
                            email: emailEC.text,
                            password: passwordEC.text,
                            confirmPassword: confirmPasswordEC.text,
                          );
                        }
                      },
                      label: 'Sign up',
                      width: MediaQuery.of(context).size.width * .9,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
