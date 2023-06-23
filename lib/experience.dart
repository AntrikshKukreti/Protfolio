import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Experience extends StatefulWidget {
  const Experience({Key? key}) : super(key: key);

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {

  List educationDetails = [
    {
      "position": "Analyst Programmer",
      "logo": "assets/images/ebizon.webp",
      "address": "Ebizon | Dehradun, India",
      "year":"March 2022- Present"
    },
  ];

experienceDetail(int count){
  return
    Padding(
      padding: EdgeInsets.symmetric(vertical: Get.height*0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: Get.height*0.01),
            child: Container(
              height: Get.height*0.05,
              color: const Color(0xff1D1C1C),
              width: Get.width,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width*0.015),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      educationDetails[count]["position"],style: TextStyle(color: Colors.white, fontSize: Get.height*0.026),),
                    Image(image:AssetImage(educationDetails[count]["logo"]),
                      width: Get.height*0.11,)
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: Get.height*0.01),
            child: Text(educationDetails[count]["address"],style: TextStyle(color: Colors.grey,fontSize: Get.height*0.02,fontWeight: FontWeight.bold),),
          ),
          Text(educationDetails[count]["year"],style: TextStyle(color: const Color(0xfff3ca2f),fontSize: Get.height*0.02,fontWeight: FontWeight.bold),)
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
          // physics: const BouncingScrollPhysics(),
          itemCount: educationDetails.length,
          itemBuilder: (BuildContext context, int index) {
            return experienceDetail(index);
          });

  }
}
