import 'package:flutter/material.dart';
import 'package:navoiy_uy_joy/view/product/product_page.dart';
import 'widgets/home_item_widget.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const FlutterLogo(),
        title: Text("Navoiy uy joy"),
        centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffE2E8F0),width: 2),
              borderRadius: BorderRadius.circular(8)
            ),
            child: Icon(Icons.search_rounded),
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
                      Navigator.push(context as BuildContext, MaterialPageRoute(builder: (context)=>ProductPage()));
                    },
                    child: HomeItemWidget()),
              );
            }
        ),
      ),
    );
  }
}
