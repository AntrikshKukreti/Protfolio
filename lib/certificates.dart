import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Courses extends StatefulWidget {
  const Courses({Key? key}) : super(key: key);

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {

  List certificates = [
    {
      "logo": "assets/images/coursera.png",
      "courseName": "JAVA Programming",
      "from":"Duke University | Coursera"
    },
  ];

  certificateCources(int count){
    return
      Padding(
        padding: EdgeInsets.symmetric(vertical: Get.height*0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: Get.height*0.01),
              child: Image(image: AssetImage(certificates[count]["logo"]),width: Get.width*0.5),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: Get.height*0.01),
              child: Text(certificates[count]["courseName"],style: TextStyle(color: Colors.grey,fontSize: Get.height*0.02),),
            ),
            Text(certificates[count]["from"],style: TextStyle(color: Colors.grey,fontSize: Get.height*0.02),),
          ],
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return
      ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: certificates.length,
          itemBuilder: (BuildContext context, int index) {
            return certificateCources(index);
          });
  }
}
