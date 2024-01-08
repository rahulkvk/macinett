
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:macinett/screens/login.dart';

import '../helpe/helper.dart';

class Machinereg extends StatelessWidget{
  String? email;
  String? pass;
  var formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
        backgroundColor: Colors.cyan,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.3,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 150),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Email",
                    filled: true,
                    fillColor: Colors.greenAccent.withOpacity(0.3),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none
                    ),
                    prefixIcon:Icon(Icons.email_sharp),
                  ),
                  validator: (email){
                    if (email!.isEmpty) {
                      return "Enter Some value";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (ename) {
                    email = ename;
                  },
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.1,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 150),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Password",
                    filled: true,
                    fillColor: Colors.greenAccent.withOpacity(0.3),
                    border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(Icons.password_sharp),
                  ),
                  obscureText: true,
                  validator: (pass){
                    if (pass!.isEmpty) {
                      return "Enter Some value";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (passw) {
                    pass = passw;
                  },
                ),
              ),
              SizedBox(height:MediaQuery.of(context).size.height*0.1,),
              ElevatedButton(onPressed: (){
                if(formkey.currentState!.validate()){
                  formkey.currentState!.save();
                  FireHelper().signUp(mail: email!, password :pass!).then((value) {
                    if(value == null){
                      Get.to(Machinelog());
                    }else{
                      Get.snackbar("Error", value);
                    }
                  });
                }
              }, child: Text("Register"))
            ],
          ),
        ),
      ),
    );
  }

}