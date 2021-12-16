import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        margin: const EdgeInsets.only(top: 30.0, bottom: 50.0),
        width: double.infinity,
        height: 400,
        decoration: _cardBorders(),
        child: Stack(
          children: [
            _BackgroundImage()
          ],
        ),
        //color: Colors.red,
      ),
    );
  }

  BoxDecoration _cardBorders() => BoxDecoration(

    color: Colors.white,
    borderRadius: BorderRadius.circular(25.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 10.0,
        offset: Offset(0,7)

      )
    ]


  );
}

class _BackgroundImage extends StatelessWidget {
  const _BackgroundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 400,
        child: FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage('https://via.placeholder.com/400x300/f6f6f6'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}