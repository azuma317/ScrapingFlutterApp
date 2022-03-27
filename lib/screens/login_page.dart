import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:sample_flutter_app/providers/auth_provider.dart';
import 'package:sample_flutter_app/utility/firebase_auth.dart';

class LoginPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Providerから値を受け取る
    final email = ref.watch(emailProvider);
    final password = ref.watch(passwordProvider);
    final infoText = ref.watch(infoTextProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: "Mail Address"),
                onChanged: (String value) {
                  ref.read(emailProvider.notifier).state = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
                onChanged: (String value) {
                  ref.read(passwordProvider.notifier).state = value;
                },
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () async {
                  try {
                    // メール/パスワードでログイン
                    final User user = await Auth().login(email, password);
                    ref.read(userProvider.notifier).state = user;
                    ref.read(infoTextProvider.notifier).state =
                        "ログインOK:${user.email}";
                    await Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) {
                        return LoginPage();
                      }),
                    );
                  } catch (e) {
                    // ログインに失敗した場合
                    ref.read(infoTextProvider.notifier).state =
                        "ログインNG:${e.toString()}";
                  }
                },
                child: Text("ログイン"),
              ),
              const SizedBox(height: 8),
              Text(infoText),
            ],
          ),
        ),
      ),
    );
  }
}
