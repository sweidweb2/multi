import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udemy_project2/main_screens/customer_home.dart';
import '../widgets/appbar_widgets.dart';
import '../widgets/yellow_button.dart';

class CartScreen extends StatefulWidget {

  final Widget? back;

  const CartScreen({super.key,this.back});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: widget.back,
            elevation: 0,
            backgroundColor: Colors.white,
            title: const AppBarTitle(title: 'Cart'),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.delete_forever),
                  color: Colors.black,
              )
            ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Your Cart Is Empty!',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                
                Material(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(25),
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width*0.6,
                      onPressed: (){
                      Navigator.canPop(context)?Navigator.pop(context):
                        Navigator.pushReplacementNamed(context, '/customer_home');
                      },
                      elevation: 0,
                    child: const Text(
                        'Continue Shopping',
                        style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          bottomSheet: Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'Total: \$ ',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        '00.00',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                YellowButton(
                  label: 'CASH OUT',
                  onpressed: (){},
                  width: 0.45,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


