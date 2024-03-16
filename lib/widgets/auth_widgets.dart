import 'package:flutter/material.dart';



class AuthMainButton extends StatelessWidget {

  final String mainButtonLabel;
  final Function() onpressed;

  const AuthMainButton({
    super.key,
    required this.mainButtonLabel,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Material(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(25),
        child: MaterialButton(
          minWidth: double.infinity,
          onPressed: onpressed,
          child: Text(
            mainButtonLabel,
            style:const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 24,
            ),
          ),

        ),
      ),
    );
  }
}

class HaveAccount extends StatelessWidget {

  final String haveAccount;
  final String actionLabel;
  final Function() onpressed;

  const HaveAccount({
    super.key,
    required this.haveAccount,
    required this.actionLabel,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          haveAccount,
          style: TextStyle(
            fontSize: 16,
            fontStyle: FontStyle.italic,
          ),
        ),
        TextButton(
          onPressed: onpressed,
          child:Text(
            actionLabel,
            style: TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),
          ),
        ),
      ],
    );
  }
}

class AuthHeaderLabel extends StatelessWidget {

  final String headerlabel;

  const AuthHeaderLabel({
    super.key,
    required this.headerlabel
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            headerlabel,
            style:const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            onPressed: (){
              Navigator.pushReplacementNamed(context, '/welcome_screen');
            },
            icon:const Icon(
              Icons.home_work,
              size: 40,
            ),
          )
        ],
      ),
    );
  }
}

var textFormDecoration=InputDecoration(
  labelText: 'Full Name',
  hintText: 'Enter your full name',
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(25),
  ),
  enabledBorder:OutlineInputBorder(
    borderRadius: BorderRadius.circular(25),
    borderSide: BorderSide(
      color: Colors.purple,
      width: 1,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(25),
    borderSide: BorderSide(
      color: Colors.deepPurpleAccent,
      width: 2,
    ),
  ),
);

extension EmailValidator on String{
  bool isValidEmail(){
    return RegExp(r'^([a-zA-Z0-9]+)([\-\_\.]*)([a-zA-Z0-9]*)([@])([a-zA-Z0-9]{2,})([\.][a-zA-Z]{2,3})$').hasMatch(this);
  }
}