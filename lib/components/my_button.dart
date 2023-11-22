import 'package:flutter/material.dart';
class MyButton extends StatelessWidget {
  final Function onTap;
  const MyButton({super.key , required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.grey[200],
      onTap: (){onTap();},
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: const BoxDecoration(color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: const Center(child: Text('Sign in' , style: TextStyle(color: Colors.white,
        fontWeight: FontWeight.bold),)),
      ),
    );
  }
}