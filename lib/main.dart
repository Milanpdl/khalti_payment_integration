import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return KhaltiScope(
        publicKey: 'test_public_key_d5d9f63743584dc38753056b0cc737d5',
        enabledDebugging: true,
        builder: (context, navkey) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Khalti payment Method',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const HomePage(),
            navigatorKey: navkey,
            localizationsDelegates: const [KhaltiLocalizations.delegate],
          );
        });
  }
}
