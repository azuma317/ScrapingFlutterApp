import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_flutter_app/providers/scraping_provider.dart';
import 'package:sample_flutter_app/screens/login_page.dart';

class ReadmePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final readme = ref.watch(readmeStocks);
    return Scaffold(
        appBar: AppBar(
          title: Text("README"),
        ),
        body: Center(
            child: Container(
                padding: EdgeInsets.all(32),
                child: Column(children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage:
                            NetworkImage(readme.value?.imageUrl ?? ""),
                        maxRadius: 40,
                        minRadius: 30,
                      ),
                      Column(
                        children: <Widget>[
                          Text(readme.value?.name ?? "",
                              style: Theme.of(context).textTheme.headline6),
                          Text(readme.value?.id ?? "",
                              style: Theme.of(context).textTheme.bodyText1),
                        ],
                      )
                    ],
                  ),
                ]))),
        floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }),
              );
            },
            child: const Icon(Icons.add)));
  }
}
