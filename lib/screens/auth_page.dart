import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:sample_flutter_app/providers/auth_provider.dart';

class MyAuthPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(emailProvider);
    final password = ref.watch(passwordProvider);
    final infoText = ref.watch(infoTextProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("ユーザー登録"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: "メールアドレス"),
                onChanged: (String value) {
                  ref.read(emailProvider.notifier).state = value;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(labelText: "パスワード（６文字以上）"),
                obscureText: true,
                onChanged: (String value) {
                  ref.read(passwordProvider.notifier).state = value;
                },
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () async {
                  try {
                    final FirebaseAuth auth = FirebaseAuth.instance;
                    final UserCredential result =
                        await auth.createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                    );

                    // 登録したユーザー情報
                    final User user = result.user!;
                    ref.read(infoTextProvider.notifier).state =
                        "登録OK：${user.email}";
                  } catch (e) {
                    // 登録に失敗した場合
                    ref.read(infoTextProvider.notifier).state =
                        "登録NG：${e.toString()}";
                  }
                },
                child: Text("ユーザー登録"),
              ),
              const SizedBox(height: 8),
              Text(infoText)
            ],
          ),
        ),
      ),
    );
  }
}
