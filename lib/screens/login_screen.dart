import 'package:flutter/material.dart';
import 'package:productos_app/providers/login_form_provider.dart';
import 'package:productos_app/ui/input_decorations.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

/*
String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
 
RegExp regExp  = new RegExp(pattern);
*/ 

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  AuthBackground(
        tarjeaLogin: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 250,),
              CardContainer(
                child: Column(
                  children: [
                    const SizedBox(height: 10,),
                    Text('Login', style: Theme.of(context).textTheme.headline4,),
                    const SizedBox(height: 30,),
                  
                    //Se crea aquí la referencia (instancia) al provider, en el create y solo porque en teoria solo importa para el form, no de forma general.
                    //

                    ChangeNotifierProvider(
                      create: ( _ ) => LoginFormProvider(),
                      child: _LoginForm(),
                    )

                  ],
                ),
              ),

              const SizedBox(height: 50,),
              const Text('Crear una nueva cuenta',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              const SizedBox(height: 50,),

            ],
          ),
        )
      ),
   );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   

    //Con este loginForm se tiene acceso a toda su clase
    final loginForm = Provider.of<LoginFormProvider>(context);
   
    return Container(
      child: Form(
        key: loginForm.formKey, //obtiene el key de la clase login_form
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: '@gmail.com',
                labelText: 'Correo electrónico',
                prefixIcon: Icons.alternate_email_sharp
              ),
              onChanged: (value) => loginForm.email = value,//Aquí es donde se hace la asignación al valor del login_form
              validator: (value){
                  
                  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  
                  RegExp regExp  = new RegExp(pattern);
              
                  //regresa null cuando el match es true
                  return regExp.hasMatch(value ?? '') ? null : 'Formato de correo incorrecto';
              },
            ),
            
            const SizedBox(height: 30,),
            
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: '*******',
                labelText: 'Contraseña',
                prefixIcon: Icons.lock_outlined
              ),
              onChanged: (value) => loginForm.pass =value, //Aquí es donde se hace la asignación al valor del login_form
              validator: (value){
                  
                 //Para la evaluación de la segunda condición del if, primero se debe cumplir la primera (value !=null), porl o tanto 
                 //no hay problema al ponerlas al mismo nivel
                 if( value != null && value.length>=6) {
                   return null;
                 } else {
                   return 'Minímo 6 caracteres';
                 }    
              
              },
            ),
            
            const SizedBox(height: 30,),

            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.deepPurple,
              child: Container(
                 padding: const EdgeInsets.symmetric(horizontal: 80,vertical: 15),
                 child: Text(
                              //Gracias al notifyListeners de la clase login_form, se puede hacer esta validación
                               loginForm.getIsLoading
                               ? 'Espere...'
                               : 'Ingresar'   
                              ,style: const TextStyle(color: Colors.white),
                            )
                ),
              onPressed: loginForm.getIsLoading ? null :() async {
                
                //Quitar el teclado al presionar el botón
                FocusScope.of(context).unfocus();  

                if(!loginForm.isValidForm()) return;

                //cambiar el valro del isLoading
                loginForm.setIsLoading = true;

                //simular un tiempo de espera
                await Future.delayed(const Duration(seconds: 3));

                //regresar valor a false por si marca error
                //TODO: valdiar que la información exista en una BD
                loginForm.setIsLoading = false;  

                //para destruir el stack de las pantallas y no permitir el volver a la pantalla del login
                Navigator.pushReplacementNamed(context, 'home');
              
              }
              )
          ],
         )
        ),
    );
  }
}