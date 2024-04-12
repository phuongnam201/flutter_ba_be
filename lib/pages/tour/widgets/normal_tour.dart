import 'package:flutter/material.dart';
import 'package:flutter_babe/controller/localization_controller.dart';
import 'package:flutter_babe/controller/tour_controller.dart';
import 'package:flutter_babe/utils/app_constants.dart';
import 'package:flutter_babe/utils/dimension.dart';
import 'package:flutter_babe/widgets/big_text.dart';
import 'package:flutter_babe/widgets/icon_and_text.dart';
import 'package:get/get.dart';

class NormalTour extends StatefulWidget {
  const NormalTour({super.key});

  @override
  State<NormalTour> createState() => _NormalTourState();
}

class _NormalTourState extends State<NormalTour> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(builder: (locaizationController) {
      return GetBuilder<TourController>(builder: (tourController) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius10)),
          //height: Dimensions.screenHeight,
          width: Dimensions.screenWidth,
          margin: EdgeInsets.only(
              left: Dimensions.width20,
              right: Dimensions.width20,
              top: Dimensions.height10),
          child: ListView.builder(
            itemCount: tourController.tourList.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true, // Set shrinkWrap to true
            itemBuilder: (context, index) {
              return Container(
                width: Dimensions.screenWidth,
                height: Dimensions.height10 * 13,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimensions.radius20)),
                margin: EdgeInsets.only(
                  bottom: Dimensions.height10,
                ),
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      //image
                      Container(
                        //height: 100,
                        width: 90,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(AppConstants.BASE_URL +
                                  "storage/" +
                                  tourController.tourList[index].image!),
                              fit: BoxFit.cover,
                            ),
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius10)),
                      ),
                      SizedBox(
                        width: Dimensions.width10,
                      ),
                      //information
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: Dimensions.screenWidth * 0.6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconAndTextWidget(
                                    icon: Icons.location_on,
                                    text:
                                        tourController.tourList[index].address!,
                                    textSize: Dimensions.font16,
                                    iconSize: Dimensions.font16,
                                    textColor: Colors.lightBlue,
                                    iconColor: Colors.lightBlue),
                                BigText(
                                  text: tourController.tourList[index].title!,
                                  size: Dimensions.font16,
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            //color: Colors.amber,
                            width: Dimensions.screenWidth * 0.6,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //origin price
                                    Text(
                                      "1.500.000 VNĐ",
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Colors.grey),
                                    ),
                                    //sale price
                                    BigText(
                                      text: tourController.tourList[index].price
                                          .toString(),
                                      color: Colors.amber[700],
                                      size: Dimensions.font20,
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    print(
                                        "You just clicked on book now with Tour ID: " +
                                            index.toString());
                                  },
                                  style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color.fromARGB(255, 255, 160, 0)),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radius20),
                                      ),
                                    ),
                                  ),
                                  child: Text("see_more".tr),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      });
    });
  }
}