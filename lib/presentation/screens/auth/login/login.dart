import 'package:evently_app/core/widgets/my_text_form_field.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyTextFormField(hint: "Email",prefixIcon: Icon(Icons.email_rounded),textInputType: TextInputType.emailAddress,),
          ),
          

        ],
      ),

    );
  }
}
