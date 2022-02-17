import 'package:flutter/material.dart';

class  ErrorMessageWidget extends StatelessWidget {
  String title;
  Function onPressed;

  ErrorMessageWidget({required this.title , required this.onPressed});

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment:  MainAxisAlignment.center,
      children: [
        Text(title , style: const TextStyle(
            color: Colors.red , fontSize: 20
        ),),
        const SizedBox(height: 10,),
        ElevatedButton(
            child: const Text("retry"),
            onPressed:()=>onPressed()
        ),
      ],
    );;
  }
}

