import 'package:flutter/material.dart';
class HomeItemWidget extends StatelessWidget {
  const HomeItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1.0,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: const Image(
                  image: AssetImage("assets/images/image.jpg"),
                  fit: BoxFit.cover,
              )),
        ),
        Text("Macbook 14",
        style: TextStyle(fontWeight:FontWeight.w500,
          fontSize: 18
        ),
        ),
        const Text("Rs 450,000",
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
              child: const Text("10/10"),
            ),
          ],
        ),
        const Text("Gulper Phase 4, Lah...  "),

      ],
    );
  }
}
