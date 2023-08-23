import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Skills extends StatefulWidget {
  const Skills({Key? key}) : super(key: key);

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {

  List languages = [
    {
      "name": "Flutter",
      "percent": "75",
    },
    // {
    //   "name": "C",
    //   "percent": "65",
    // },
    {
      "name": "Python",
      "percent": "60",
    },
    {
      "name": "React.js",
      "percent": "60",
    },
    {
      "name": "React Native",
      "percent": "60",
    },
    {
      "name": "JavaScript",
      "percent": "60",
    },
    {
      "name": "PHP",
      "percent": "60",
    },
    {
      "name": "git",
      "percent": "70",
    },
  ];


  skillBar(int count){
    String percentage = "0.${int.parse(languages[count]["percent"])}";
    return
      Padding(
        padding: EdgeInsets.only(bottom: Get.height*0.022),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(languages[count]["name"],style: const TextStyle(color: Colors.grey),),
                Text("${languages[count]["percent"]}%",style: const TextStyle(color: Colors.grey),),
              ],
            ),
            SizedBox(height: Get.height*0.005,),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2.0)
              ),
              height: Get.height*0.006,
              width: Get.width,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xfff3ca2f),
                      borderRadius: BorderRadius.circular(2.0)
                  ),
                  height: Get.height*0.006,
                  width: Get.width*double.parse(percentage),
                ),
              ),
            ),
          ],
        ),
      );
  }


  @override
  Widget build(BuildContext context) {
    return
      ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: languages.length,
          itemBuilder: (BuildContext context, int index) {
            return skillBar(index);
          });
  }
}

