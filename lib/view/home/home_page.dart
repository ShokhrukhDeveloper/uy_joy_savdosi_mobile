import 'package:flutter/material.dart';
import 'package:navoiy_uy_joy/view/product/product_page.dart';
import 'widgets/home_item_widget.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSearch=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const FlutterLogo(),
        title:!isSearch?const Text("Navoiy uy joy"):
        TextField(
          onSubmitted: (text){
            print(text);
            print("---------------------------------------------------------------------------");
          },
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15.0),
            border: OutlineInputBorder(
              gapPadding: 0,
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.white38)
            ),
            focusedBorder: OutlineInputBorder(
                gapPadding: 0,
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.black26)
            ),
          ),
        ),
        // ,
        centerTitle: true,
        actions: [
          if(!isSearch)InkWell(
            onTap: (){
              isSearch=true;
              setState(() {

              });
            },
            child: Container(
              margin: EdgeInsets.only(right: 10),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffE2E8F0),width: 2),
                borderRadius: BorderRadius.circular(8)
              ),
              child: Icon(Icons.search_rounded),
            ),
          ),
          if(isSearch)InkWell(
            onTap: (){
              isSearch=false;
              setState(() {

              });
            },
            child: Container(
              margin: EdgeInsets.only(right: 10),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffE2E8F0),width: 2),
                  borderRadius: BorderRadius.circular(8)
              ),
              child: Icon(Icons.clear),
            ),
          ),

          Container(
            margin: EdgeInsets.only(right: 10),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffE2E8F0),width: 2),
              borderRadius: BorderRadius.circular(8)
            ),
            child: Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: 11,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio:156/264
            ),
            itemBuilder: (context, index){
              return Container(
                color: Colors.white,
                child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const ProductPage()));
                    },
                    child: HomeItemWidget()),
              );
            }
        ),
      ),
    );
  }
}
