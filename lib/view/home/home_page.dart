import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:navoiy_uy_joy/urls/Urls.dart';
import 'package:navoiy_uy_joy/view/product/product_page.dart';
import 'widgets/home_item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<dynamic> homes = [];
  bool isSearch = false;
  bool loading = false;
  static const limit = 10;
  Future<void> getData(int page) async {
    loading = true;
    setState(() {});
    var response =
        await http.get(Uri.parse("${Urls.announce}?Limit=$limit&Page=$page"));

    if (response.statusCode == 200) {
      print(response.body);
      await Future.delayed(const Duration(seconds: 3));
      homes = jsonDecode(response.body)["data"];

      setState(() {
        loading = false;
      });
    }
  }

  @override
  void initState() {


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.send),

          onPressed: (){},
        ),
        title:!isSearch?const Text("Navoiy uy joy"):
        TextField(
          onSubmitted: (text){
          },
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15.0),
            border: OutlineInputBorder(
              gapPadding: 0,
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.white38)
            ),
            focusedBorder: OutlineInputBorder(
                gapPadding: 0,
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.black26)
            ),
          ),


        ),

        centerTitle: true,
        actions: [

          if(!isSearch)InkWell(
            onTap: (){
              isSearch=true;
              setState(() {

              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffE2E8F0),width: 2),
                borderRadius: BorderRadius.circular(8)
              ),
              child: const Icon(Icons.search_rounded),
            ),
          ),
          if(isSearch)InkWell(
            onTap: (){
              isSearch=false;
              setState(() {});
            },
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffE2E8F0),width: 2),
                  borderRadius: BorderRadius.circular(8)
              ),
              child: const Icon(Icons.clear),

            ),)

        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : GridView.builder(
                itemCount: homes.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 156 / 264),
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.white,
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductPage(
                                        id: homes[index]["id"],
                                      )));
                        },
                        child: HomeItemWidget(
                          data: homes[index],
                        )),
                  );
                }),
      ),
    );
  }


}
