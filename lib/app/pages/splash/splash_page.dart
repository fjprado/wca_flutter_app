import 'package:flutter/material.dart';
import 'package:wca_flutter_app/app/core/styles/button_styles.dart';
import 'package:wca_flutter_app/app/core/styles/colors_app.dart';
import 'package:wca_flutter_app/app/core/styles/text_styles.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash Page'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyles.instance.primaryButton,
              child: Text('Salvar'),
            ),
            OutlinedButton(
              onPressed: () {},
              style: ButtonStyles.instance.primaryOutlinedButton,
              child: Text('Salvar'),
            ),
            TextField(),
          ],
        ),
      ),
    );
  }
}
