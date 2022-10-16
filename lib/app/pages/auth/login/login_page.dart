import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/styles/button_styles.dart';
import '../../../core/ui/components/button.dart';
import '../../../core/ui/styles/text_styles.dart';
import '../../../core/ui/styles/colors_app.dart';
import 'presenter/login_presenter.dart';
import 'view/login_view_impl.dart';

class LoginPage extends StatefulWidget {
  final LoginPresenter presenter;
  const LoginPage({super.key, required this.presenter});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends LoginViewImpl {
  final formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background_login.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate.fixed([
                  SizedBox(
                      height: MediaQuery.of(context).size.height *
                          (MediaQuery.of(context).size.width > 350
                              ? .30
                              : .25)),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Center(
                        child: Text('Login',
                            style: context.textStyles.titleWhite)),
                  ),
                  TextFormField(
                    controller: emailEC,
                    decoration: const InputDecoration(
                        label: Text('Email'),
                        floatingLabelBehavior: FloatingLabelBehavior.never),
                    validator: Validatorless.multiple([
                      Validatorless.required('Required'),
                      Validatorless.email('Invalid email')
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: passwordEC,
                    obscureText: true,
                    decoration: const InputDecoration(
                        label: Text('Password'),
                        floatingLabelBehavior: FloatingLabelBehavior.never),
                    validator: Validatorless.multiple([
                      Validatorless.required('Required'),
                      Validatorless.min(
                          6, 'Password must have at least 6 characters')
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Text(
                      'Forgot password?',
                      style: context.textStyles.textSecondaryFontMedium
                          .copyWith(color: context.colors.yellow, fontSize: 14),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Button(
                      width: MediaQuery.of(context).size.width * .9,
                      onPressed: () {
                        final valid = formKey.currentState?.validate() ?? false;

                        if (valid) {
                          showLoader();
                          widget.presenter.login(emailEC.text, passwordEC.text);
                        }
                      },
                      style: context.buttonStyles.yellowButton,
                      labelStyle: context
                          .textStyles.textSecondaryFontExtraBoldPrimaryColor,
                      label: 'Sign in')
                ]),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(children: [
                  const Spacer(),
                  Text.rich(
                    style: context.textStyles.textSecondaryFontMedium
                        .copyWith(color: Colors.white),
                    TextSpan(
                      text: "Don't have an account? ",
                      children: [
                        TextSpan(
                          text: 'Sign up',
                          style: context.textStyles.textSecondaryFontMedium
                              .copyWith(color: context.colors.yellow),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.of(context)
                                .pushNamed('/auth/register'),
                        )
                      ],
                    ),
                  )
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
