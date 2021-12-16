import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier{

  //crear el key
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String email = '';
  String pass = '';
  bool _isLoading = false;

 bool get getIsLoading => _isLoading;
  
 set setIsLoading(bool value){
   this._isLoading = value;
   notifyListeners();
 }

  bool isValidForm(){
    //si el currentState aun no esta preparano (Es null), regresa false
    return formKey.currentState?.validate() ?? false;
  }

}