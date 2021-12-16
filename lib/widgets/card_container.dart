import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {

  final Widget child;

  const CardContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        //height: 300,
        decoration: _createCardShape(),
        child: this.child, //es el que se recibe como parámetro
      ),
    );
  }

  BoxDecoration _createCardShape() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(25),   
      boxShadow: const[
         BoxShadow(
                    color: Colors.black12,
                    blurRadius: 15,
                    offset: Offset(0,5)
                  )
      ]
    );
  }
}