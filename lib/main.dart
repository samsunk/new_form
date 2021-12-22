import 'package:flutter/material.dart';
import 'package:new_form/screen/validate.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FormValidate(),      
    );
  }
}