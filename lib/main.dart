import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'landingPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Antriksh'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    Timer.periodic(const Duration(milliseconds: 3000), (timer){
      Get.off(const LandingPage(title: "Antriksh",));
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Center(
            child: Image.asset(
              "assets/images/Animation02.gif",
            ),
          ),

          SizedBox(
            height: Get.height,
            width: Get.width,
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: const AssetImage("assets/images/icon.png"),
                  width: Get.width * 0.15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("ANTRIKSH",style: TextStyle(color: const Color(0xfff3ca2f),fontSize: Get.width * 0.085,fontWeight: FontWeight.bold),),
                    Text("Portfolio",style: TextStyle(color: Colors.white,fontSize: Get.width * 0.06,fontWeight: FontWeight.bold),),
                  ],
                ),
              ],
            ),
          ),
          Image.asset(
            "assets/images/loading04.gif",
            height: Get.height*0.16,
            width: Get.width,
          ),
        ],
      )
    );
  }
}
