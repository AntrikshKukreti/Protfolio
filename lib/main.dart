import 'dart:async';
import 'package:cv/workExperience.dart';
import 'package:cv/skkills.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'certificates.dart';
import 'controllers.dart';
import 'educationDetails.dart';
import 'experience.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_text_reveal/random_text_reveal.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
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
  ScrollController scrollController = ScrollController();
  final GlobalKey<RandomTextRevealState> globalKey = GlobalKey();
  final contactController= Controllers();
  RxString initialValue = "Mobile Apps.".obs;
  RxString endValue = "Web Sites   ".obs;
  RxString temp = "".obs;
  RxBool changedValue =false.obs;
  var about = GlobalKey();
  var mySkills = GlobalKey();
  var education = GlobalKey();
  var certificates = GlobalKey();
  var contactUs = GlobalKey();
  late FocusNode myFocusNode;

  blink(){
    temp.value = initialValue.value;
    initialValue.value = endValue.value;
    endValue.value = temp.value;
  }


  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 4), (timer) async {
      await blink();
      globalKey.currentState?.play();
    });
    myFocusNode = FocusNode();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

emailService() async {
  final mailtoLink = Mailto(
      to: ["antrikshkukreti@gmail.com"],
      subject: contactController.subjectController.text,
      body: "Hello, ${contactController.nameController.text} this side.\n \n${contactController.messageController.text}",
  );
  await launch('$mailtoLink');
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: Drawer(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: Color(0xff1D1C1C)),
                    accountName: Text(
                      "Antriksh Kukreti",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    accountEmail: Text(
                      "antrikshkukreti@gmail.com",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    currentAccountPicture: CircleAvatar(
                      foregroundImage: AssetImage("assets/images/dp.jpg"),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.home,
                    ),
                    title: const Text('Home'),
                    onTap: () {
                      Navigator.pop(context);
                      scrollController.animateTo(
                        scrollController.position.minScrollExtent,
                        curve: Curves.easeOut,
                        duration: const Duration(milliseconds: 500),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.info,
                    ),
                    title: const Text('About'),
                    onTap: () {
                      Navigator.pop(context);
                      Scrollable.ensureVisible(about.currentContext!
                      ,curve:Curves.bounceIn,
                      duration: const Duration(milliseconds: 500));
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.cast_for_education,
                    ),
                    title: const Text('Education & Experience'),
                    onTap: () {
                      Navigator.pop(context);
                      Scrollable.ensureVisible(education.currentContext!
                          ,curve:Curves.bounceIn,
                          duration: const Duration(milliseconds: 500));
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.edit,
                    ),
                    title: const Text('Projects'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.book,
                    ),
                    title: const Text('Certificates'),
                    onTap: () {
                      Navigator.pop(context);
                      Scrollable.ensureVisible(certificates.currentContext!
                          ,curve:Curves.bounceIn,
                          duration: const Duration(milliseconds: 500));
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.email,
                    ),
                    title: const Text('Contact Me'),
                    onTap: () {
                      Navigator.pop(context);
                      Scrollable.ensureVisible(contactUs.currentContext!
                          ,curve:Curves.bounceIn,
                          duration: const Duration(milliseconds: 500));
                    },
                  ),
                  const Divider(
                    height: 20,
                    thickness: 1,
                    indent: 15,
                    endIndent: 15,
                    color: Colors.black,
                  ),
                  const AboutListTile(
                    // <-- SEE HERE
                    icon: Icon(
                      Icons.info,
                    ),
                    applicationIcon: Icon(
                      Icons.local_play,
                    ),
                    applicationName: 'Antriksh',
                    applicationVersion: '1.0.0',
                    applicationLegalese: '© 2023 Company',
                    aboutBoxChildren: [
                      ///Content goes here...
                    ],
                    child: Text('About app'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: Get.height * 0.015),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () async {
                      final Uri url = Uri.parse('https://m.facebook.com/antriksh.kukreti');
                      if (!await launchUrl(url,mode: LaunchMode.externalNonBrowserApplication)) {
                      throw Exception('Could not launch $url');
                      }
                    },
                    child: const FaIcon(
                      FontAwesomeIcons.facebook,
                      color: Color(0xff0095ea),
                    ),
                  ),
                  const FaIcon(FontAwesomeIcons.twitter, color: Color(0xff00a2ed)),
                  InkWell(
                    onTap: () async {
                      final Uri url = Uri.parse('https://instagram.com/antrikshkukreti?igshid=NTc4MTIwNjQ2YQ==');
                      if (!await launchUrl(url)) {
                        throw Exception('Could not launch $url');
                      }
                    },
                    child: const FaIcon(
                      FontAwesomeIcons.instagram,
                      color: Color(0xfff71473),
                    ),
                  ),
                  InkWell(
                      onTap: () async {
                        final Uri url = Uri.parse('https://github.com/AntrikshKukreti');
                        if (!await launchUrl(url)) {
                        throw Exception('Could not launch $url');
                        }
                      },
                      child: const FaIcon(FontAwesomeIcons.github)),
                  InkWell(
                    onTap: () async {
                      final Uri url = Uri.parse('https://www.linkedin.com/in/antriksh-kukreti-051864196');
                      if (!await launchUrl(url)) {
                        throw Exception('Could not launch $url');
                      }
                    },
                    child: const FaIcon(
                      FontAwesomeIcons.linkedin,
                      color: Color(0xff0078b1),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        /// to remove hamburger icon from top left of app bar.
        automaticallyImplyLeading: false,

        title: GestureDetector(
          onTap: (){
            scrollController.animateTo(
              scrollController.position.minScrollExtent,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 500),
            );
          },
          child: Row(
            children: [
              Image(
                image: const AssetImage("assets/images/icon.png"),
                width: Get.width * 0.1,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title),
                  Text(
                    "portfolio",
                    style: TextStyle(fontSize: Get.height * 0.015),
                  )
                ],
              ),
            ],
          ),
        ),

        actions: [
          Builder(
              builder: (context) => // Ensure Scaffold is in context
                  IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () => Scaffold.of(context).openDrawer())),
        ],
        backgroundColor: Colors.black,
        // backgroundColor: const Color(0xff1D1C1C),
      ),
      body: Obx(()=>GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.black,
                  height: Get.height * 0.25,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'HELLO ',
                                  style: TextStyle(
                                      color: const Color(0xfff3ca2f),
                                      fontSize: Get.width * 0.085),
                                ),
                                Text(
                                  'I AM',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Get.width * 0.085),
                                ),
                              ],
                            ),
                            Text(
                              "Antriksh Kukreti",
                              style: TextStyle(
                                  fontFamily: "Allison_Script",
                                  color: Colors.white,
                                  fontSize: Get.width * 0.085),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            radius: Get.width * 0.21,
                            backgroundColor:
                                const Color(0xfff3ca2f).withOpacity(0.2),
                            child: CircleAvatar(
                              radius: Get.width * 0.2,
                              backgroundColor: const Color(0xfff3ca2f),
                              child: CircleAvatar(
                                foregroundImage:
                                    const AssetImage("assets/images/dp.jpg"),
                                radius: Get.width * 0.19,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const Divider(
                  height: 20,
                  thickness: 1,
                  indent: 15,
                  endIndent: 15,
                  color: Colors.white,
                ),

                Padding(
                  padding: EdgeInsets.only(
                      left: Get.width * 0.04, right: Get.width * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("I Design & Develop",style: TextStyle(color: Colors.white,fontSize: Get.width*0.085),),
                      RandomTextReveal(
                        key: globalKey,
                        initialText: initialValue.value,
                        shouldPlayOnStart: false,
                        text: endValue.value,
                        duration: const Duration(seconds: 2),
                        style: GoogleFonts.orbitron(
                          textStyle: TextStyle(
                            fontSize: Get.width*0.05,
                            color: const Color(0xfff3ca2f),
                            fontWeight: FontWeight.bold,
                            letterSpacing: 8,
                          ),
                        ),
                        randomString: Source.alphabets,
                        // onFinished: () {
                        //   debugPrint('Password cracked successfully');
                        // },
                        curve: Curves.easeIn,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),


                      Padding(
                        padding: EdgeInsets.only(top: Get.height*0.03 ),
                        child: Text("ABOUT",
                          style: TextStyle(
                              color: Colors.grey, fontSize: Get.width * 0.08),
                        key: about,),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: Get.height * 0.01),
                        child: Text(
                          "Currently working as Flutter and React JS Developer. Having 1+ years of experience including Flutter app & web applications and javascript libraries like React JS.",
                          style: TextStyle(
                              color: Colors.grey, fontSize: Get.width * 0.04),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: Get.height*0.03),
                        child: SizedBox(
                          height: Get.height*0.06,
                          width: Get.width,
                          child: const WorkExperience(),
                        ),
                      ),

                      Padding(
                        key: mySkills,
                        padding: EdgeInsets.only(top: Get.height * 0.05),
                        child: Row(
                          children: [
                            Text(
                              'MY SKILLS ',
                              style: TextStyle(
                                  color: const Color(0xfff3ca2f),
                                  fontSize: Get.width * 0.085),
                            ),
                            Text(
                              'AND',
                              style: TextStyle(
                                  color: Colors.grey, fontSize: Get.width * 0.085),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'SPECIALIZATIONS',
                        style: TextStyle(
                            color: Colors.grey, fontSize: Get.width * 0.085),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(vertical: Get.height * 0.01),
                        child: Text(
                          "Computer programming is not just my profession, it's my passion. Striving to do my best on every project, I always try to go one step beyond, and expand my knowledge.",
                          style: TextStyle(
                              color: Colors.grey, fontSize: Get.width * 0.04),
                        ),
                      ),

                      /// My Skills :
                      SizedBox(
                        height: Get.height * 0.4,
                        child: const Skills(),
                      ),

                      Text("EDUCATION",
                          style: TextStyle(
                              color: Colors.grey, fontSize: Get.width * 0.08),
                      key: education,),

                      SizedBox(height: Get.height * 0.65,
                          child: const Education()
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: Get.height*0.05),
                        child: Text("EXPERIENCE",
                            style: TextStyle(
                                color: Colors.grey, fontSize: Get.width * 0.08)),
                      ),
                      SizedBox(height: Get.height*0.145,
                      child: const Experience(),),

                      Padding(
                        padding: EdgeInsets.only(top: Get.height*0.05),
                        child: Text("CERTIFICATES",
                            style: TextStyle(
                                color: Colors.grey, fontSize: Get.width * 0.08),
                          key: certificates),
                      ),
                      SizedBox(height: Get.height*0.2,
                        child: const Courses(),),

                      Text(
                        'CONTACT ME',
                        key: contactUs,
                        style: TextStyle(
                            color: const Color(0xfff3ca2f),
                            fontSize: Get.width * 0.085),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: Get.height*0.01),
                        child: Text("Dehradun,India",style: TextStyle(color: Colors.grey,fontSize: Get.height*0.02,fontWeight: FontWeight.bold)),
                      ),
                      Text("antrikshkukreti@gmail.com",style: TextStyle(color: Colors.grey,fontSize: Get.height*0.02,fontWeight: FontWeight.bold)),
                      Text("+91 9557669576",style: TextStyle(color: Colors.grey,fontSize: Get.height*0.02,fontWeight: FontWeight.bold)),

                      ///Name
                      Padding(
                        padding: EdgeInsets.only(top:Get.height*0.015),
                        child: SizedBox(
                          height: Get.height*0.045,
                          child: TextField(
                            controller: contactController.nameController,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[A-Za-z ]')),
                            ],
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              hintText: 'Name*',
                              filled: true,
                              fillColor: Colors.blueGrey[50],
                              labelStyle: const TextStyle(fontSize: 12),
                              contentPadding: const EdgeInsets.fromLTRB(
                                  10.0, 10.0, 0.0, 10.0),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xff397651),
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xff397651)),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                      ),
                      ///Subject
                      Padding(
                        padding: EdgeInsets.only(top:Get.height*0.015),
                        child: SizedBox(
                          height: Get.height*0.045,
                          child: TextField(
                            controller: contactController.subjectController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              hintText: 'Subject(Optional)',
                              filled: true,
                              fillColor: Colors.blueGrey[50],
                              labelStyle: const TextStyle(fontSize: 12),
                              contentPadding: const EdgeInsets.fromLTRB(
                                  10.0, 10.0, 0.0, 10.0),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xff397651),
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xff397651)),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                      ),
                      ///Message
                      Padding(
                        padding: EdgeInsets.only(top:Get.height*0.015),
                        child: GestureDetector(
                          onTap: (){
                            myFocusNode.requestFocus();
                          },
                          child: Container(
                            height: Get.height*0.25,
                            decoration: BoxDecoration(
                              color: const Color(0xffE9E8E8),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: const Color(0xff397651)),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: Get.height * 0.015,
                                      left: Get.width * 0.02,
                                  ),
                                  child: const Icon(
                                    Icons.feedback,
                                    color: Colors.grey,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(right: Get.width*0.02),
                                    child: TextField(
                                      controller: contactController.messageController,
                                      minLines: 1,
                                      maxLines: 30,
                                      maxLength: 500,
                                      focusNode: myFocusNode,
                                      keyboardType: TextInputType.multiline,
                                      decoration: InputDecoration(
                                        counterText: "",
                                        hintText: 'Message*',
                                        filled: true,
                                        fillColor: const Color(0xffE9E8E8),
                                        labelStyle: const TextStyle(fontSize: 12),
                                        contentPadding: EdgeInsets.fromLTRB(
                                            Get.width * 0.02, 10.0, 0.0, 10.0),
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.transparent),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.transparent),
                                          borderRadius: BorderRadius.circular(15.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(vertical: Get.height*0.02),
                        child: InkWell(onTap: () async {
                          if( contactController.nameController.text.trim()!="" &&
                              contactController.messageController.text.trim()!=""){
                            await emailService();
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text("Please fill all required fields"),
                            ));
                          }
                        },
                          child: Container(
                            height: Get.height*0.045,
                            width: Get.width*0.35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: const Color(0xfff3ca2f),
                            ),
                            child: Center(child: Text("Send",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: Get.height*0.02),)),
                          ),
                        ),
                      )

                    ],
                  ),
                ),
              ],
            ),
          ),
      ),
      ),
    );
  }
}
