import 'package:ezinore/components/my_button.dart';
import 'package:ezinore/components/text_field.dart';
import 'package:ezinore/screens/homeScreen.dart';
import 'package:flutter/material.dart';
class Login extends StatefulWidget {
  const Login({super.key});
    
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserin () async{
  final email = emailController.text.trim();
  final password = passwordController.text.trim();
  if(email == '' || password == ''){
    print('PLZ PROVIDE EMAIL AND PASS');
    return;
  }
  if(email == 'choudharyr976@gmail.com' && password == 'new@123'){
  Navigator.push(context,MaterialPageRoute(builder: (context)=> const Home()));
  }
  else{
  print('PLZ PROVIDE CORRECT EMAIL AND PASS');
  }
  
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body:  SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(children: [
            const SizedBox(height: 40),
            const Icon(Icons.lock,
            size: 100),
            const SizedBox(height: 30),
            Text(
              'Welcome Back! Please Login',
              style: TextStyle(
              color: Colors.grey[700],
              fontSize: 16
              ),
            ),
            const SizedBox(height: 50),
            MyTextField(controller: emailController,hintText: 'Email', obscureText: false),
            const SizedBox(height: 10),
            MyTextField(controller:passwordController, hintText: 'Password', obscureText: true),
            const SizedBox(height: 20),
            MyButton(onTap: signUserin),
          ]),
        ),
      ),
    );
  }
}