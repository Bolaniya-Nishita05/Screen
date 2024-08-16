import 'package:flutter/material.dart';
import 'package:screen/ListPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget
{
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var name=new TextEditingController();
  var password=new TextEditingController();
  var isPasswordVisible=false;
  var isValid=true;
  var remember=false;

  var formKey=GlobalKey<FormState>();

  Future<void> setUser(String username,String password,bool remember) async {
    SharedPreferences pref=await SharedPreferences.getInstance();

    pref.setString("Username", username);
    pref.setString("Password", password);
    pref.setBool("Remember", remember);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Column(
          children: [
            Card(
              elevation: 5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset("assets/NBLogo.jpg",
                  fit: BoxFit.fill,
                  height: 100,
                  width: 150,
                ),
              ),
            ),
            Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      child: TextFormField(controller: name,
                        validator: (value) {
                          if(value==""){
                            return "Enter username";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.indigo),),
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.indigo),),
                          focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.indigo),),
                          errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.red.shade900),),
                          errorStyle: TextStyle(fontSize: 15),
                          labelText: "Enter Username, Email, or Mobile number",
                          floatingLabelStyle: TextStyle(color: Colors.indigo),
                          hintText: "Username",
                        ),
                      ),
                      margin: EdgeInsets.all(30),
                    ),
                    Container(
                      child: TextFormField(controller: password,
                        validator: (value) {
                          RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

                          if (value=="") {
                            return 'Enter password';
                          }
                          else {
                            if (!regex.hasMatch(value!)) {
                              return 'Enter valid password';
                            }
                            else {
                              return null;
                            }
                          }
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.indigo),),
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.indigo),),
                          focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.indigo),),
                          errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.red.shade900),),
                          errorStyle: TextStyle(fontSize: 15),
                          labelText: "Enter Password",
                          suffixIcon: InkWell(
                              child: isPasswordVisible?Icon(Icons.visibility_off_outlined,color: Colors.indigo,):Icon(Icons.visibility_outlined,color: Colors.indigo,),
                              onTap: () {
                                setState(() {
                                  isPasswordVisible=!isPasswordVisible;
                                });
                              }
                          ),
                          floatingLabelStyle: TextStyle(color: Colors.indigo,),
                          hintText: "Password",
                        ),
                        obscureText: !isPasswordVisible,
                        obscuringCharacter: "*",
                      ),
                      margin: EdgeInsets.fromLTRB(30,0,30,0),
                    ),
                    CheckboxListTile(
                      side: BorderSide(color: Colors.indigo,),
                      // visualDensity: VisualDensity.maximumDensity,
                      title: Text("REMEMBER ME?",
                        style: TextStyle(
                            color: Colors.indigo,
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.right,
                      ),
                      activeColor: Colors.indigo,
                      contentPadding: EdgeInsets.fromLTRB(0,30,30,0),
                      value: remember,
                      onChanged: (value) {
                        setState(() {
                          remember=value!;
                        });
                      },
                    ),
                    InkWell(
                      onTap: () {
                        if(formKey.currentState!.validate()){
                          if(name.text=="abcdefghijklmnopqrstuvwxyz" && password.text=="Abc@1234"){
                            setState(() {
                              isValid=true;
                              setUser(name.text, password.text,remember);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ListPage(),));
                            });
                          }
                          else{
                            setState(() {
                              isValid=false;
                            });
                          }
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(color: Colors.indigo,borderRadius: BorderRadius.circular(20)),
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: Center(
                          child: Text("SUBMIT",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: MediaQuery.of(context).size.height*0.025
                            ),
                          ),
                        ),
                        margin: EdgeInsets.all(30),
                      ),
                    ),
                    !isValid?Text("INVALID USERNAME & PASSWORD",
                      style: TextStyle(
                        color: Colors.red.shade900,
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),
                    ):Text(""),
                  ],
                )
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
      backgroundColor: Colors.deepPurple.shade100,
    );
  }
}