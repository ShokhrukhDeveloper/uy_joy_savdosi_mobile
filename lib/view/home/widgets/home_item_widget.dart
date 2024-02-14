import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:navoiy_uy_joy/urls/Urls.dart';

import '../../../Models/announcement_list.dart';

class HomeItemWidget extends StatelessWidget {
   HomeItemWidget({required this.data,super.key});
   Announcement data;
   final oCcy = NumberFormat("#,##0", "uz_UZ");
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
                  image: NetworkImage("${Urls.baseImageUrl}/${data.photo}"),
                  fit: BoxFit.cover,
              )),
        ),
        Text("${data.title}",
        style: const TextStyle(fontWeight:FontWeight.w500,
          fontSize: 18
        ),
          maxLines: 2,
        ),
        Text(oCcy.format(data.price),
        style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 8),
          decoration: BoxDecoration(
              color: Color(0xffEFEFEF),
              borderRadius: BorderRadius.circular(8)

          ),
          child:  Text("${data.totalSpace} m\u00b2"),
        ),
      ],
    );
  }
}
