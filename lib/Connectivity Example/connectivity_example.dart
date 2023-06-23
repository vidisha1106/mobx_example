import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_example/Connectivity%20Example/connectivity_store.dart';

class ConnectivityExample extends StatelessWidget {
  ConnectivityExample({Key? key}) : super(key: key);

 final ConnectivityStore connectivityStore = ConnectivityStore();

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: ReactionBuilder(
          builder: (BuildContext context) {
            return reaction((_) => connectivityStore.connectivityStream.value,
                (result) {

              final messenger = ScaffoldMessenger.of(context);
              debugPrint(result.toString());
              messenger.showSnackBar(SnackBar(
                  content: Text(result == ConnectivityResult.none
                      ? 'Your are Offline '
                      : 'You are Online')));
            }, delay: 3000);
          },
          child: Scaffold(
            appBar: AppBar(
              title:
                  const Text("Connectivity Example", style: TextStyle(fontSize: 25)),
            ),
            body: const Padding(
               padding: EdgeInsets.all(10.0),
              child: Text(
                  'Turn your connection on/off for approximately 3 seconds to see the app respond to changes in your connection status.',
                  style: TextStyle(fontSize: 20)),
            ),
          )),
    );
  }
}
