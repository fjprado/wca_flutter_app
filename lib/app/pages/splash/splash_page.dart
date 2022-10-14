import 'package:flutter/material.dart';
import 'package:wca_flutter_app/app/core/ui/components/button.dart';
import 'package:wca_flutter_app/app/core/ui/components/rounded_button.dart';
import 'package:wca_flutter_app/app/core/ui/helpers/loader.dart';
import 'package:wca_flutter_app/app/core/ui/helpers/messages.dart';
import 'package:wca_flutter_app/app/core/ui/styles/button_styles.dart';
import 'package:wca_flutter_app/app/core/ui/styles/text_styles.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with Loader<SplashPage>, Messages<SplashPage> {
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
              onPressed: () async {
                showLoader();
                await Future.delayed(Duration(seconds: 2));
                hideLoader();
              },
              style: ButtonStyles.instance.primaryButton,
              child: Text('Salvar'),
            ),
            OutlinedButton(
              onPressed: () {
                showError('Erro no botão outlined');
              },
              style: ButtonStyles.instance.primaryOutlinedButton,
              child: Text('Salvar'),
            ),
            TextField(),
            Button(
              onPressed: () {
                showInfo('info no botão info');
              },
              style: ButtonStyles.instance.primaryButton,
              labelStyle: TextStyles.instance.textPrimaryFontBold,
              label: 'Salvar',
            ),
            RoundedButton(
              icon: Icons.add,
              onPressed: () {
                showSuccess('success no botão redondo');
              },
            )
          ],
        ),
      ),
    );
  }
}
