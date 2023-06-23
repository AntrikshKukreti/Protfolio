import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkExperience extends StatefulWidget {
  const WorkExperience({Key? key}) : super(key: key);

  @override
  State<WorkExperience> createState() => _WorkExperienceState();
}

class _WorkExperienceState extends State<WorkExperience> {
  List workingKnowledge = [
    {
      "workingKnowledge": "Web Development"
    },
    {
      "workingKnowledge": "App Development",
    },
    {
      "workingKnowledge": "Programming",
    },
  ];

  development(int count) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width*0.01,vertical: Get.height*0.01),
      child: Container(
        height: Get.height * 0.035,
        width: Get.width * 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: const Color(0xff444242),
        ),
        child: Center(
          child: Text(
            workingKnowledge[count]["workingKnowledge"],
            style: TextStyle(color: Colors.white, fontSize: Get.width * 0.05),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: workingKnowledge.length,
        itemBuilder: (BuildContext context, int index) {
          return development(index);
        });
  }
}
