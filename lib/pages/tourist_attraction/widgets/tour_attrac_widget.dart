import 'package:flutter/material.dart';
import 'package:flutter_babe/utils/dimension.dart';
import 'package:flutter_babe/widgets/big_text.dart';
import 'package:flutter_babe/widgets/icon_and_text.dart';
import 'package:flutter_babe/widgets/small_text.dart';

class TourAttractionWidget extends StatelessWidget {
  const TourAttractionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height100 * 3,
      width: Dimensions.screenWidth,
      color: Colors.grey[300],
      child: Container(
        margin: EdgeInsets.all(Dimensions.height20),
        child: GridView.builder(
          physics:
              NeverScrollableScrollPhysics(), // Disable GridView's scrolling
          shrinkWrap: true, // Wrap the GridView inside SingleChildScrollView
          itemCount: 2,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 250,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return Container(
              //height: 200, // Độ cao của container
              width: double.infinity, // Chiều rộng mở rộng toàn bộ
              // Padding cho container
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 211, 201, 201),
                    offset: const Offset(
                      1.5,
                      1.5,
                    ),
                    blurRadius: 2.0,
                    spreadRadius: 1.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.white,
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ), //BoxShadow
                ],
              ),
              child: Column(
                children: [
                  Container(
                    height: 150,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      //borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: Dimensions.height10),
                  Container(
                    margin: EdgeInsets.only(
                        left: Dimensions.width10, right: Dimensions.width10),
                    width: Dimensions.screenWidth * 0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(
                          text: "Lorem",
                          color: Colors.blue[800],
                          size: Dimensions.font16,
                        ),
                        IconAndTextWidget(
                            icon: Icons.location_on,
                            text: "Lorem",
                            textSize: Dimensions.font16 - 6,
                            iconSize: Dimensions.font16 - 6,
                            textColor: Colors.grey,
                            iconColor: Colors.grey),
                        SmallText(
                          text:
                              "Làm sao ta có thể nhìn thấy vĩnh hằng trong một hạt cát, hay tìm thấy vô biên trong một đóa hoa? Không gì trên thế giới này là hoàn hảo, nhưng mỗi chúng ta lại mang trong mình vẻ đẹp đặc biệt, giống như những viên ngọc quý ẩn giấu trong bụi rậm của cuộc sống.",
                          maxLines: 3,
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
