import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Education extends StatefulWidget {
  const Education({Key? key}) : super(key: key);

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {

  List details = [
    {
      "education": "Postgraduate",
      "logo": "assets/images/gehu.png",
      "collegeName": "Graphic Era Hill University, Dehradun, India",
      "year":"2020-2022"
    },
    {
      "education": "Undergraduate",
      "logo": "assets/images/ITM.png",
      "collegeName": "Institute Of Technology & Management, Dehradun, India",
      "year":"2017-2020"
    },
    {
      "education": "Intermediate",
      "logo": "assets/images/sgrr.png",
      "collegeName": "Shri Guru Ram Rai Public School (Bindal), Dehradun, India",
      "year":"2016-2017",
    },
    {
      "education": "Metriculate",
      "logo": "assets/images/sgrr.png",
      "collegeName": "Shri Guru Ram Rai Public School (Bindal), Dehradun, India",
      "year":"2014-2015",
    },
  ];


  educationDetails(int count){
    return
      Padding(
        padding: EdgeInsets.symmetric(vertical: Get.height*0.01),
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
                      details[count]["education"],style: TextStyle(color: Colors.white, fontSize: Get.height*0.026),),
                    Image(image:AssetImage(details[count]["logo"]),
                      width: Get.height*0.04,)
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: Get.height*0.01),
            child: Text(details[count]["collegeName"],style: TextStyle(color: Colors.grey,fontSize: Get.height*0.02,fontWeight: FontWeight.bold),),
          ),
          Text(details[count]["year"],style: TextStyle(color: const Color(0xfff3ca2f),fontSize: Get.height*0.02,fontWeight: FontWeight.bold),)
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
          itemCount: details.length,
          itemBuilder: (BuildContext context, int index) {
            return educationDetails(index);
          });
  }
}
