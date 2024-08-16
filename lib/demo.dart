import 'package:flutter/material.dart';

class Demo extends StatefulWidget
{
  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  var name=new TextEditingController();
  var email=new TextEditingController();
  var mobileNo=new TextEditingController();
  var password=new TextEditingController();
  var isPasswordVisible=false;
  var isValid=true;

  var formKey=GlobalKey<FormState>();

  bool isEmailValid(String email)
  {
    bool emailValid=RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    return emailValid;
  }

  bool isMobileNoValid(String mobileNo)
  {
    bool mobileValid=RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(mobileNo);
    return mobileValid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    child: TextFormField(controller: name,
                      validator: (value) {
                        if(value!.isEmpty){
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
                        labelText: "Enter Username",
                        floatingLabelStyle: TextStyle(color: Colors.indigo),
                        hintText: "Username",
                        prefixIcon: Icon(Icons.abc)
                      ),
                    ),
                    margin: EdgeInsets.all(20),
                  ),
                  Container(
                    child: TextFormField(controller: email,
                      validator: (value) {
                        if(value!.isEmpty){
                          return "Enter Email";
                        }
                        else if(!isEmailValid(value)){
                          return "Enter Valid E-Mail";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.indigo),),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.indigo),),
                        focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.indigo),),
                        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.red.shade900),),
                        errorStyle: TextStyle(fontSize: 15),
                        labelText: "Enter Email",
                        floatingLabelStyle: TextStyle(color: Colors.indigo),
                        hintText: "Email",
                        prefixIcon: Icon(Icons.email_outlined)
                      ),
                    ),
                    margin: EdgeInsets.all(20),
                  ),
                  Container(
                    child: TextFormField(controller: mobileNo,
                      validator: (value) {
                        if(value!.isEmpty){
                          return "Enter Mobile No.";
                        }
                        else if(!isMobileNoValid(value)){
                          return "Enter Valid Mobile No.";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.indigo),),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.indigo),),
                        focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.indigo),),
                        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.red.shade900),),
                        errorStyle: TextStyle(fontSize: 15),
                        labelText: "Enter Mobile No.",
                        floatingLabelStyle: TextStyle(color: Colors.indigo),
                        hintText: "Mobile No.",
                        prefixIcon: Icon(Icons.call)
                      ),
                    ),
                    margin: EdgeInsets.all(20),
                  ),
                  Container(
                    child: TextFormField(controller: password,
                      validator: (value) {
                        RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

                        if (value!.isEmpty) {
                          return 'Enter password';
                        }
                        else if(value!.length<8){
                          return "Password must contain atleast 8 characters";
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
                        prefixIcon: Icon(Icons.password),
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
                      obscuringCharacter: "p",
                    ),
                    margin: EdgeInsets.all(20)
                  ),
                  InkWell(
                    onTap: () {
                      if(formKey.currentState!.validate()){
                        if(name.text=="abcdefghijklmnopqrstuvwxyz" && password.text=="Abc@1234"){
                          setState(() {
                            isValid=true;
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
                  ):Text("")
                ],
              )
          )
        ],
      )
    );
  }
}