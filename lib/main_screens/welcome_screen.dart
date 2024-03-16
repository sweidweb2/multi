import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:udemy_project2/main_screens/supplier_home.dart';
import 'package:udemy_project2/widgets/yellow_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

const myytextcolor=[
  Colors.yellowAccent,
  Colors.red,
  Colors.blueAccent,
  Colors.green,
  Colors.purple,
  Colors.teal,
];

const mytextstyle=TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Acme',
                  );

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/images/inapp/bgimage.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                'Welcome',
                  textStyle:mytextstyle,
                  colors:myytextcolor,
                ),
                ColorizeAnimatedText(
                    'Duck Store',
                    textStyle:mytextstyle,
                    colors:myytextcolor
                ),
              ],
              isRepeatingAnimation: true,
              repeatForever: true,
            ),

            const SizedBox(
              height: 120,
              width: 200,
              child: Image(image: AssetImage('images/images/inapp/logo.jpg')),
            ),
            // const Text(
            //   'SHOP',
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 30,
            //   ),
            // ),
            DefaultTextStyle(
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 45,
                fontWeight: FontWeight.bold,
                fontFamily: 'Acme',
              ),
              child: SizedBox(
                height: 80,
                child: AnimatedTextKit(
                  animatedTexts: [
                    RotateAnimatedText('Buy'),
                    RotateAnimatedText('Shop'),
                    RotateAnimatedText('MultiStore'),
                  ],
                  repeatForever: true,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      decoration:const BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            bottomLeft: Radius.circular(50)),
                      ),
                      child:const Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'Suppliers only',
                          style: TextStyle(
                            color: Colors.yellowAccent,
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 6),
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width*0.9,
                      decoration:const BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            bottomLeft: Radius.circular(50)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Animated_logo(controller: _controller),
                          YellowButton(
                              label: 'Login',
                              onpressed: (){
                                Navigator.pushReplacementNamed(context, '/supplier_home');
                              },
                              width: 0.25
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right:8.0),
                            child: YellowButton(
                                label: 'Sign up',
                                onpressed: (){},
                                width: 0.25
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width*0.9,
                  decoration:const BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: YellowButton(
                            label: 'Login',
                            onpressed: (){
                              Navigator.pushReplacementNamed(context, '/customer_home');
                            },
                            width: 0.25
                        ),
                      ),
                      YellowButton(
                          label: 'Sign up',
                          onpressed: (){
                            Navigator.pushReplacementNamed(context, '/customer_signup');
                          },
                          width: 0.25
                      ),
                      Animated_logo(controller: _controller),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Container(
                decoration:BoxDecoration(
                  color: Colors.white38.withOpacity(0.3),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CreatedAccountsLogin(
                      label: 'Google',
                      onpressed: (){},
                      child:const Image(image: AssetImage('images/images/inapp/google.jpg')),
                    ),
                    CreatedAccountsLogin(
                      label: 'FaceBook',
                      onpressed: (){},
                      child:const Image(image: AssetImage('images/images/inapp/facebook.jpg')),
                    ),
                    CreatedAccountsLogin(
                      label: 'Guest',
                      onpressed: () async{
                        await FirebaseAuth.instance.signInAnonymously();
                      },
                      child:const Icon(
                        Icons.person,
                        size: 55,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Animated_logo extends StatelessWidget {
  const Animated_logo({
    super.key,
    required AnimationController controller,
  }) : _controller = controller;

  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: Image(
          image: AssetImage('images/images/inapp/logo.jpg'),
      ),
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
          angle: _controller.value * 2.0 * pi,
          child: child,
        );
      },
    );
  }
}

class CreatedAccountsLogin extends StatelessWidget {

  final String label;
  final Function() onpressed;
  final Widget child;


  const CreatedAccountsLogin({
    super.key,
    required this.label,
    required this.onpressed,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: onpressed,
        child: Column(
          children: [
            SizedBox(
                height:50 ,
                width: 50,
                child: child,
            ),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
