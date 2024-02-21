import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:netflix_flutter/view/Authentication/component/ForgetPassword.dart';
import 'package:netflix_flutter/view/Authentication/component/TextFild.dart';
import 'package:netflix_flutter/view/Authentication/component/donthaveaccount.dart';
import 'package:netflix_flutter/view/Authentication/component/registerButton.dart';

class SignIn extends StatefulWidget {
SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
String email='';
String password = '';

void setEmail(value){
  setState(() {
    email = value;
  });
}
void setPassword(value){
  setState(() {
    password = value;
  });
}

void LogIn(){
  print('LogIn Clicked');
}

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          child: Stack(
            children: [
              Container(
                height: 500,
                  decoration:const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('lib/assets/signin1.jpg'),
                      fit: BoxFit.cover,
                      )
                  ),
                ),
          
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding:const EdgeInsets.fromLTRB(40, 20, 30, 40), 
                  decoration:const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))
                    ),

                  child: Column(
                    children: [
                  //instance of TextFild
                  TextFild(sufixIcon:Icons.email,setTexts: setEmail,obscureText: false,label: 'Email',),
                                  
                  const SizedBox(height: 10,),

                  //instance of TextFild
                  TextFild(sufixIcon:Icons.key,setTexts: setPassword,obscureText: true,label: 'Password',),

                  const SizedBox(height: 20),

                    Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [ 
                      //from register component
                      RegisterButton(logIn:LogIn,buttonText:'LOG IN'),
                      const SizedBox(height: 10),
                      //frome forget password component
                      const ForgetPassword(),
                      const SizedBox(height: 30,),
                      //from dont have account
                      DontHaveAcount()
                        ])
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }