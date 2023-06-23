import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_example/Dice%20Example/dice.dart';
import 'package:provider/provider.dart';

class DiceExample extends StatelessWidget {
  const DiceExample({Key? key}) : super(key: key);

  // final Dice dice = Dice();

  @override
  Widget build(BuildContext context) {
    final dice=Provider.of<Dice>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Dice Example", style: TextStyle(fontSize: 25)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Tap the Dice",
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: TextButton(
                    onPressed: dice.roll,
                    child: Observer(
                      builder: (_) {
                        return Image.asset(
                            'assets/images/dice${dice.left}.png');
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: TextButton(
                    onPressed: dice.roll,
                    child: Observer(
                        builder: (_) {
                          return Image.asset('assets/images/dice${dice.right}.png');
                        },),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Total",
              style: TextStyle(fontSize: 25),
            ),
            Observer(
              builder: (_) {
                return  Text(
                  dice.total.toString(),
                  style: const TextStyle(fontSize: 50),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
