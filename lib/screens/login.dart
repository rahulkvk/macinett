import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:macinett/screens/home.dart';
import 'package:macinett/screens/register.dart';

import '../helpe/helper.dart';
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(home:Machinelog()));
}
class Machinelog extends StatelessWidget{
  var formkey = GlobalKey<FormState>();
  String? email;
  String? pwd;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.2,),
          Text("Login"),
          Form(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 150),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Email",
                          filled: true,
                          fillColor: Colors.cyan.withOpacity(0.3),
                          border: OutlineInputBorder(borderRadius:BorderRadius.circular(20),borderSide: BorderSide.none),
                          prefixIcon: Icon(Icons.email)
                      ),
                      validator: (uname) {
                        if (uname!.isEmpty) {
                          return "Enter Some value";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (name) {
                        email = name;
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
                          fillColor:Colors.cyan.withOpacity(0.3),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none),
                          prefixIcon: Icon(Icons.password)
                      ),
                      obscureText: true,
                      validator: (password) {
                        if (password!.isEmpty) {
                          return "Password cannot be empty";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (pass) {
                        pwd = pass;
                      },
                    ),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height*0.06,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.3,
                    child: ElevatedButton(onPressed: (){
                      if (formkey.currentState!.validate()) {
                        formkey.currentState!.save();
                        FireHelper().signIn(mail: email!, pass: pwd!).then((value){
                          if(value != null){
                            Get.to(Machinehom());
                          }else{
                            Get.snackbar("Error", "User not found $value");
                          }
                        });
                      }
                    }, child: Text("Login")),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                  TextButton(onPressed: (){
                    Get.to(Machinereg());
                  }, child: Text("Not register! Register here")),
                ],
              ))
        ],
      ),
    );
  }

}