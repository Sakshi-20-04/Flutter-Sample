import 'package:flutter/material.dart';
import 'package:roll_dice/dice_roller.dart';
//import 'package:roll_dice/style_text.dart';


const startAlign = Alignment.topLeft;
const endAlign = Alignment.bottomRight;

// ignore: must_be_immutable
class GradientContainer extends StatelessWidget {
  const GradientContainer(this.color1, this.color2,{super.key});

  const GradientContainer.purple() : color1 = Colors.deepPurple, color2 = Colors.purple;

  final Color color1;
  final Color color2;

  
  @override
  Widget build(BuildContext context) {
    return Container(
          
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [ color1, color2 ] ,
              begin: startAlign,
              end: endAlign,
            ),
          ),

          child: Center(
            child: DiceRoller(),            
          ),
        );
  }
}



