

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctorapplicationfinal/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'home_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final _auth = FirebaseAuth.instance;

  final _formkey = GlobalKey<FormState>();

  final NameEditingController = new TextEditingController();
  final PlaceEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmpasswordEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    final firstname = TextFormField(
      autofocus: false,
      controller: NameEditingController,
      keyboardType: TextInputType.name,
      validator: (value){
        RegExp regex = new RegExp(r'^.{3,}$');
        if(value!.isEmpty){
          return ("Firstname cannot be empty");
        }

        if(!regex.hasMatch(value))
        {
          return("Please enter a valid name (minimum 3 characters required)");
        }
        return null;
      },
      onSaved: (value)
      {
        NameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle_rounded),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Name",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
          )
      ),
    );

    final placename = TextFormField(
      autofocus: false,
      controller: PlaceEditingController,
      keyboardType: TextInputType.name,
      validator: (value){
        RegExp regex = new RegExp(r'^.{3,}$');
        if(value!.isEmpty){
          return ("place cannot be empty");
        }

        if(!regex.hasMatch(value))
        {
          return("Please enter a valid Location name (minimum 3 characters required)");
        }
        return null;
      },
      onSaved: (value)
      {
        PlaceEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.location_city_rounded),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Place",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
          )
      ),
    );

    final email = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      validator: (value){
        if(value!.isEmpty){
          return ("Please enter your email");
        }

        if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+").hasMatch(value))
        {
          return("Please enter a valid email");
        }
      },
      onSaved: (value)
      {
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email ID",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
          )
      ),
    );


    final password = TextFormField(
      autofocus: false,
      controller: passwordEditingController,
      validator: (value){
        RegExp regex = new RegExp(r'^.{6,}$');
        if(value!.isEmpty){
          return ("Please enter your password");
        }

        if(!regex.hasMatch(value))
        {
          return("Please enter a valid password (minimum 6 characters required)");
        }
      },
      obscureText: true,
      onSaved: (value)
      {
        passwordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key_rounded),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
          )
      ),
    );


    final confirmpassword = TextFormField(
      autofocus: false,
      controller: confirmpasswordEditingController,
      validator: (value){
        if (confirmpasswordEditingController.text!= passwordEditingController.text){
          return "Password Doesn't match";
        }
        return null;
      },
      obscureText: true,
      onSaved: (value)
      {
        confirmpasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key_rounded),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Name",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
          )
      ),
    );

    final signButton = Material(

        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: (){

            Signup(emailEditingController.text, passwordEditingController.text);

          },
          child: Text("SignUp"
            ,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),

        ),);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: (){
          Navigator.of(context).pop();
        },),
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white54,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>
                  [
                    SizedBox(
                      height: 180,
                      child: Image.asset('assets/logo.gif',
                        fit: BoxFit.contain,),

                    ),

                    SizedBox(height: 20),
                    firstname,
                    SizedBox(height: 20),
                    placename,
                    SizedBox(height: 20),
                    email,
                    SizedBox(height: 20),
                    password,
                    SizedBox(height: 20),
                    confirmpassword,
                    SizedBox(height: 20),
                    signButton





                      ],
                    )

                ),
              ),
            ),
          ),
        ),

    );
  }

  void Signup(String email,String password) async {
    if (_formkey.currentState!.validate()){
      await _auth.createUserWithEmailAndPassword(email: email, password: password)
          .then((value) =>
      {
        postvaluetofirestore()}
      ).catchError((e)
          {
          Fluttertoast.showToast(msg: e!.message);
          });
    }
  }
  postvaluetofirestore() async
  {

    FirebaseFirestore firebasefirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    userModel.emailid= user!.email;
    userModel.uid=user.uid;

    userModel.name=NameEditingController.text;
    userModel.place=PlaceEditingController.text;

    await firebasefirestore
          .collection("users")
        .doc(user.uid)
    .set(userModel.toMap());

    Fluttertoast.showToast(msg: "Account created successfully");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context)
        => HomePage()),
    (route)
        =>false);



  }
}

