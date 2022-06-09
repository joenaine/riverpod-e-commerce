import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';
import 'package:riverpodecomm/view/base_scaffold/base_scaffold.dart';


void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      scaffoldMessengerKey: Grock.snackbarMessengerKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BaseScaffold(),
    );
  }
}
