import 'package:flutter/material.dart';
import 'package:mobx_example/Dice%20Example/dice.dart';
import 'package:mobx_example/images/all_images.dart';

class DiceExample extends StatelessWidget {
   DiceExample({Key? key}) : super(key: key);

  final Dice dice=Dice();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Dice Example", style: TextStyle(fontSize: 25)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Tap the Dice",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                TextButton(onPressed: () { dice.roll(); }, child: Image.asset(Images.dice2),),
                //TextButton(onPressed: () { dice.roll(); }, child: Image.asset('assets/images/dice${dice.left}.jpeg'),),

                TextButton(onPressed: () {  }, child: Image.asset(Images.dice2),),
              ],
            ),
            SizedBox(height: 50,),
            Text("Total",style: TextStyle(fontSize: 25),),
            Text("4",style: TextStyle(fontSize: 50),)
          ],
        ),
      ),
    );
  }
}
