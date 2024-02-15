import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:navoiy_uy_joy/models/announce_details.dart';
import 'package:navoiy_uy_joy/urls/Urls.dart';
import 'package:navoiy_uy_joy/view/product/widgets/image_viewer.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({required this.id, super.key});
  final int id;
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  bool loading=true;
  AnnounceDetails? data;
  List<String> images=[];
  Future<void> getDataById(int id)async
  {
    var response = await http.get(Uri.parse("${Urls.announce}/$id"));
    if(response.statusCode==200){
      data = AnnounceDetails.fromJson(jsonDecode(response.body));



      await Future.delayed(const Duration(seconds: 1));
      setState(() {
      loading=false;
      });
    }
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> _makePhoneSms(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'sms',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  void initState() {
  getDataById(widget.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(""),actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.share))],),
      body:loading?const Center(child: CircularProgressIndicator(),):  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                      height: 250,
                      child: ImageViewer(imgList: images,),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Kecha 17:48 da"),
                        Text("${data?.details.title}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                        ),
                        ),
                        Text("${data?.details.price} so'm",
                        style: TextStyle(fontSize: 24,fontWeight: FontWeight.w900),
                        ),
                        Text("ID: ${widget.id}",
                        style: TextStyle(fontSize: 24,fontWeight: FontWeight.w900),
                        ),
                        details("Turar joy", "Yangi qurilgan uylar"),
                        details("Xonalar soni", "${data?.details.numberOfRooms}"),
                        details("Yashash maydoni", "${data?.details.livingSpace} m\u00b2"),
                        details("Qavatliligi", "${data?.details.numberOfStoreys} "),
                        details("Oshxona maydoni", "${data?.details.kitchenSpace} m\u00b2"),
                        details("Qurilgan yili", "${data?.details.year} - yili"),
                        details("Remonti", "Soo on"),
                        details("Blandligi", "${data?.details.ceilingHeight} m"),
                        details("Kvartirada bor", "${data?.details.announceApartementHas.map((e) => "${e.uz} ,").toString()} m"),
                        details("Yaqainiada yoylashgan", "${data?.details.announceNearby.map((e) => "${e.uz} ,").toString()} "),
                      
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(child:InkWell(
                onTap: (){
                  _makePhoneCall("+998958882266");
                },
                child: Container(

                  height: 60,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.green,width: 4),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green
                  ),
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 20,right: 3,bottom: 5),
                  child: Center(child: Icon(Icons.call,size: 40,color: Colors.white,)),

                ),
              ) ),
              Expanded(child:InkWell(
                onTap: ()=>
                  _makePhoneSms("+998958882266")
                ,
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.green,width: 4),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green
                  ),
                  width: double.infinity,
                  margin: EdgeInsets.only(right: 20,left: 3,bottom: 5),
                  child: Center(child: Icon(Icons.email_outlined,size: 40,color: Colors.white,)
                  )

                ),
              ) ),
            ],
          )

          
        ],
      ),
    );
  }
  Widget details(String key,String detail)
  {
    return Container(
      margin: const EdgeInsets.all(3),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.grey)
      ),
      child: Text("$key: $detail",
        style: TextStyle(
            fontSize: 16
        ),
      ),
    );
  }
}
