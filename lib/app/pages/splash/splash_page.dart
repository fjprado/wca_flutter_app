import 'package:flutter/material.dart';
import 'package:wca_flutter_app/app/core/ui/helpers/loader.dart';
import 'package:wca_flutter_app/app/core/ui/helpers/messages.dart';

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
      body: Container(),
    );
  }
}
