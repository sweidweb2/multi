import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/auth_widgets.dart';
import '../widgets/snackbar.dart';

// final TextEditingController _namecontroller=TextEditingController();
// final TextEditingController _emailcontroller=TextEditingController();
// final TextEditingController _passwordcontroller=TextEditingController();

class CustomerRegister extends StatefulWidget {
  const CustomerRegister({super.key});

  @override
  State<CustomerRegister> createState() => _CustomerRegisterState();
}

class _CustomerRegisterState extends State<CustomerRegister> {



  late String name;
  late String email;
  late String password;
  final GlobalKey<FormState> _formkey= GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey= GlobalKey<ScaffoldMessengerState>();
  bool passVisibility=false;

  XFile? _imageFile;
  dynamic _pickedImageError;
  ImagePicker _picker = ImagePicker();

  void _pickImageFromCamera() async {
    try{
      final pickedImage=await _picker.pickImage(
        source: ImageSource.camera,
        maxHeight: 300,
        maxWidth: 300,
        imageQuality: 95,
      );
      setState(() {
        _imageFile=pickedImage;
      });

    }catch(e){
      setState(() {
        _pickedImageError=e;
      });
      print(_pickedImageError);
    }
  }

  void _pickImageFromGallery() async {
    try{
      final pickedImage=await _picker.pickImage(
        source: ImageSource.gallery,
        maxHeight: 300,
        maxWidth: 300,
        imageQuality: 95,
      );
      setState(() {
        _imageFile=pickedImage;
      });

    }catch(e){
      setState(() {
        _pickedImageError=e;
      });
      print(_pickedImageError);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldKey,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              reverse: true,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      AuthHeaderLabel(headerlabel: 'Sign Up',),
                      Row(
                        children: [
                          Padding(
                            padding:const EdgeInsets.symmetric(vertical: 20,horizontal: 40),
                            child: CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.purpleAccent,
                              backgroundImage: _imageFile==null?null:FileImage(File(_imageFile!.path)),
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                decoration:const BoxDecoration(
                                  color: Colors.purple,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  ),
                                ),
                                child: IconButton(
                                  onPressed: (){
                                    _pickImageFromCamera();
                                  },
                                  icon:const Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(height: 6,),
                              Container(
                                decoration:const BoxDecoration(
                                  color: Colors.purple,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                  ),
                                ),
                                child: IconButton(
                                  onPressed: (){
                                    _pickImageFromGallery();
                                  },
                                  icon:const Icon(
                                    Icons.photo,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                          validator: (value){
                            if(value!.isEmpty){
                              return 'please enter your full name';
                            }
                            return null;
                          },
                          //controller: _namecontroller,
                          onChanged: (value){
                            name=value;
                          },
                          decoration: textFormDecoration.copyWith(
                            labelText: 'Full Name',
                            hintText: 'Enter your full name',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                          validator: (value){
                            if(value!.isEmpty){
                              return 'please enter your email';
                            }else if(value.isValidEmail()==false){
                              return 'invalid email';
                            }else if(value.isValidEmail()==true){
                              return null;
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          //controller: _emailcontroller,
                          onChanged: (value){
                            email=value;
                          },
                          decoration: textFormDecoration.copyWith(
                            labelText: 'Email Address',
                            hintText: 'Enter your email',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                          validator: (value){
                            if(value!.isEmpty){
                              return 'please enter your password';
                            }
                            return null;
                          },
                          obscureText: !passVisibility,
                          //controller: _passwordcontroller,
                          onChanged: (value){
                            password=value;
                          },
                          decoration: textFormDecoration.copyWith(
                            suffixIcon: IconButton(
                                onPressed: (){
                                  setState(() {
                                    passVisibility=!passVisibility;
                                  });
                                },
                                icon: Icon(
                                  passVisibility?Icons.visibility:Icons.visibility_off,
                                  color: Colors.purple,
                                ),
                            ),
                            labelText: 'Password',
                            hintText: 'Enter your password',
                          ),
                        ),
                      ),
                      HaveAccount(
                        haveAccount: 'already have account?  ',
                        actionLabel: 'Log In',
                        onpressed: (){},
                      ),
                      AuthMainButton(
                        mainButtonLabel: 'Sign Up',
                        onpressed: (){
                          if(_formkey.currentState!.validate()){

                            if(_imageFile!=null){
                              print('image picked');
                              print('valid');
                              print(name);
                              print(email);
                              print(password);

                              _formkey.currentState!.reset();
                              setState(() {
                                _imageFile=null;
                              });

                            }else{
                              MyMessageHandler.ShowSnackBar(
                                  _scaffoldKey,
                                  'please fill all fields'
                              );
                            }
                          }else{
                            MyMessageHandler.ShowSnackBar(
                                _scaffoldKey,
                                'please fill all fields'
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}




