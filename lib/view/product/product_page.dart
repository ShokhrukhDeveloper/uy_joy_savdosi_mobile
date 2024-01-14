import 'package:flutter/material.dart';
import 'package:navoiy_uy_joy/view/product/widgets/image_viewer.dart';
import 'package:url_launcher/url_launcher.dart';
class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(""),actions: [IconButton(onPressed: (){}, icon: Icon(Icons.share))],),
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                      height: 250,
                      child: ImageViewer(),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Kecha 17:48 da"),
                        Text("Maklersiz 2 xonali uy sotiladi oldaginalar bormi?",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                        ),
                        ),
                        Text("435 000 000 so'm",
                        style: TextStyle(fontSize: 24,fontWeight: FontWeight.w900),
                        ),
                        details("Turar joy", "Yangi qurilgan uylar"),
                        details("Xonalar soni", "2"),
                        details("Yashash maydoni", "58 mkv"),
                        details("Yashash maydoni", "58 mkv"),
                        details("Yashash maydoni", "58 mkv"),
                        details("Yashash maydoni", "58 mkv"),
                        details("Yaqainiada yoylashgan", "Maktab uy joy brtk'asn tksadl ajkgd aksjdg asjkg sajdg akjsdf gaskhdf alo battar nimadi kimdir"),
                      
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
                onTap: (){
                  _makePhoneSms("+998958882266");
                },
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
      margin: EdgeInsets.all(3),
      padding: EdgeInsets.all(10),
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
