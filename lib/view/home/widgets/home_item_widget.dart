import 'package:flutter/material.dart';
import 'package:navoiy_uy_joy/urls/Urls.dart';
class HomeItemWidget extends StatelessWidget {
   HomeItemWidget({required this.data,super.key});
  dynamic data;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1.0,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child:  Image(
                  image: NetworkImage("${Urls.baseUrlImage}/${data["photo"]}"),
                  fit: BoxFit.cover,
              )),
        ),
        Text("${data["title"]}",
        style: TextStyle(fontWeight:FontWeight.w500,
          fontSize: 18
        ),
        ),
         Text("Narxi: ${data["price"]}",
        style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),

        ),
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 4),
              padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 2),
              decoration: BoxDecoration(
                  color: Color(0xffEFEFEF),
                borderRadius: BorderRadius.circular(8)
              ),
              child: const Text("New"),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 3,horizontal: 2),
              decoration: BoxDecoration(
                color: Color(0xffEFEFEF),
                borderRadius: BorderRadius.circular(8)

              ),
              child:  Text("${data["repair"]}"),
            ),
          ],
        ),
         Text(" ${data["flatHasThings"]}"),

      ],
    );
  }
}
