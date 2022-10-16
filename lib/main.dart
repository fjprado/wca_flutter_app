import 'package:flutter/material.dart';
import 'package:wca_flutter_app/app/core/config/env/env.dart';
import 'package:wca_flutter_app/app/wca_flutter_app.dart';

Future<void> main() async {
  await Env.instance.load();
  runApp(WcaFlutterApp());
}
