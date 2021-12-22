import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:motion_toast/motion_toast.dart';

class FormValidate extends StatefulWidget {
  const FormValidate({Key? key}) : super(key: key);

  @override
  _FormValidateState createState() => _FormValidateState();
}

class _FormValidateState extends State<FormValidate> {
  final _formkey = GlobalKey<FormState>();
  String email = '';
  String pass = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Form validation'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                const SizedBox(height: 10),
                const CircleAvatar(
                    backgroundImage: AssetImage('images/myimage.jpeg'),
                    radius: 80),
                const SizedBox(height: 30),
                TextFormField(
                  onSaved: (value) {
                    email = value!;
                  },
                  validator: MultiValidator([
                    RequiredValidator(errorText: '* Required'),
                    EmailValidator(errorText: 'Invalid email'),
                  ]),
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'enter your email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  onSaved: (value) {
                    pass = value!;
                  },
                  validator: MultiValidator([
                    RequiredValidator(errorText: '* Required'),
                    MinLengthValidator(6,
                        errorText: 'should be at least 6 characters'),
                    MaxLengthValidator(15,
                        errorText: 'should be less than 15 characters'),
                  ]),
                  decoration: const InputDecoration(
                    labelText: 'password',
                    hintText: 'enter your password',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      _formkey.currentState!.save();
                      MotionToast.success(
                              description: 'Data saved successfully')
                          .show(context);
                    }
                  },
                  child: const Text('Submit'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    _formkey.currentState!.reset();
                    MotionToast.success(description: 'Data reset successfully')
                        .show(context);
                  },
                  child: const Text('clear'),
                ),
              ],
            ),
          ),
        ));
  }
}
