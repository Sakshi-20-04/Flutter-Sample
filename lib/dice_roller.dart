import 'dart:math';

import 'package:flutter/material.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {

  //var activeDiceImage;
  var currentRoll = 3;
  void rollDice() {
    
    setState(() {
      currentRoll = Random().nextInt(6) + 1;
    });
    
    print("changing img");
  }
  @override
  Widget build(BuildContext context) {
    return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/dice-${currentRoll}.png"
                , width: 200,),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: rollDice, child: Text("Roll Dice", style: TextStyle(
                  fontSize: 28,
                ),),),
              ],
            );
  }
}