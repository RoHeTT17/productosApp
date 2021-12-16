import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {

  final Widget tarjeaLogin;

  const AuthBackground({Key? key, required this.tarjeaLogin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color:  Colors.red,
      width:  double.infinity,
      height: double.infinity,
      child: Stack(
        children:  [
           const _PurpleBox(),
           const IconUser(),
           tarjeaLogin
        ],
      ),
    );
  }
}

class IconUser extends StatelessWidget {
  const IconUser({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30),
        child: const Icon(Icons.person_pin,color: Colors.white,size: 100,),
      ),
    );
  }
}

class _PurpleBox extends StatelessWidget {
  const _PurpleBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(

          width: double.infinity,
          height: size.height*.4,
          //color: Colors.indigo,
          decoration: _purpleBackGround(),
          child: Stack(
            children: const[
              Positioned(child: _Bubble(),top: 90,left: 30,),
              Positioned(child: _Bubble(),bottom: 90,right: 30,),
              Positioned(child: _Bubble(),bottom: -50,left: 30,),
              Positioned(child: _Bubble(),top: -40,right: -30,),
              Positioned(child: _Bubble(),top: -20,left: 190,)
              
            ],
          ),

    );
  }

  BoxDecoration _purpleBackGround() {
    return const BoxDecoration(
          gradient: LinearGradient(
            colors:[
              Color.fromRGBO(63, 63, 156, 1),
              Color.fromRGBO(90, 70, 178, 1)
            ]
          )
        );
  }
}

class _Bubble extends StatelessWidget {
  const _Bubble({  Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container( 
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color.fromRGBO(255, 255, 255, 0.05)

      ),
      
    );
  }
}
