import 'package:flutter/material.dart';
import 'package:screen/DetailPage.dart';
import 'package:screen/HomePage.dart';
import 'package:screen/ListPage.dart';
import 'package:screen/LoginPage.dart';
import 'package:screen/ProfilePage.dart';
import 'package:screen/demo.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  Future<Widget> nextScreen() async {
    SharedPreferences pref=await SharedPreferences.getInstance();

    // var username=pref.getString("Username");
    // var password=pref.getString("Password");

    var remember=pref.getBool("Remember");

    if(remember ?? false){
      return ListPage();
    }

    return HomePage();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: //HomePage()
            //ListPage()
            //DetailPage()
            //LoginPage()
            //Demo()
            //ProfilePage()
            FutureBuilder<Widget>(
              future: nextScreen(),
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  return snapshot.data!;
                }
                else{
                  return CircularProgressIndicator(color: Colors.orange.shade700,);
                }
              },
            )
    );
  }
}
