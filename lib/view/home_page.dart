
import 'package:dolce/model/good.dart';
import 'package:dolce/control/models.dart';
import 'package:dolce/view/pages/detail_page.dart';
import 'package:dolce/view/pages/page1.dart';
import 'package:dolce/view/pages/page2.dart';
import 'package:dolce/view/pages/page3.dart';
import 'package:dolce/view/pages/page4.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);
  final controller = PageController();
  final dolceController = Get.put(DolceController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Stack(
              children: [
                Container(
                  height: 340,
                  width: MediaQuery.of(context).size.width,
                  child:PageView(
                    controller: controller,
                    children: const [
                      Page1(),
                      Page2(),
                      Page3(),
                      Page4(),
                    ],
                  )
                ),


                Positioned(
                  top: 300,
                  left: 20,
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: 4,
                    effect: const WormEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                      type: WormType.thin,
                      dotColor: Colors.white,
                      activeDotColor: Colors.deepPurple,
                      spacing: 20,
                    ),
                  ),
                ),
              ],
            ),
          const SizedBox(height: 10,),


        const Padding(
            padding:  EdgeInsets.only(left: 20),
            child:  Text('Very Popular',
            style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17
            ),
            ),
          ),


          const SizedBox(height: 10,),

          Expanded(
            child: ListView.builder(
              shrinkWrap: false,
              scrollDirection: Axis.horizontal,
                itemCount: Product.product.length,
                itemBuilder: (context, index){
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPge(product: Product.product[index], index: index)));
                },
                child: Container(
                  height: 150,
                  width: 220,
                  margin: EdgeInsets.only(left: 20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 220,
                        margin: EdgeInsets.all(6),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(Product.product[index].img),
                          ),
                        ),
                      ),
                     const SizedBox(height: 2,),

                      Text(Product.product[index].name,
                      style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black
                      ),
                      ),
                      const SizedBox(height: 2,),

                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(Product.product[index].name2,
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold, color: Colors.deepPurple,
                              ),
                            ),

                            Text('\$${Product.product[index].Price}',
                              style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ),
              );
            }),
          ),
          const SizedBox(height: 10,),


        ],
      )
    );
  }
}
