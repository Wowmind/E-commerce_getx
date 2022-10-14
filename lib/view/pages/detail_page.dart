import 'package:dolce/model/good.dart';
import 'package:dolce/control/models.dart';
import 'package:dolce/view/pages/alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class DetailPge extends StatelessWidget {
   DetailPge({Key? key, required this.product, required this.index}) : super(key: key);

  final dolceController = Get.put(DolceController());
  final Product product;
  final int index;

   List<String> size = [
     "S",
     "M",
     "L",
     "XL",
   ];

   List<Color> colors = [
     Colors.black,
     Colors.red,
     Colors.orange.shade200,
     Colors.amber,
     Colors.green,
   ];

   int _selectedColor = 0;
   int _selectedSize = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: MediaQuery.of(context).size.height * 0.6,
                  elevation: 0,
                  snap: true,
                  floating: true,
                  stretch: true,
                  backgroundColor: Colors.grey.shade50,
                  flexibleSpace: FlexibleSpaceBar(
                      stretchModes: [
                        StretchMode.zoomBackground,
                      ],
                      background: Image.asset(Product.product[index].img, fit: BoxFit.cover,)
                  ),
                  bottom: PreferredSize(
                      preferredSize: Size.fromHeight(45),
                      child: Transform.translate(
                        offset: Offset(0, 1),
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          child: Center(
                              child: Container(
                                width: 50,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              )
                          ),
                        ),
                      )
                  ),
                ),
                SliverList(
                    delegate: SliverChildListDelegate([
                      Container(
                          height: MediaQuery.of(context).size.height * 0.65,
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(Product.product[index].name,
                                        style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold,),
                                      ),
                                      SizedBox(height: 5,),
                                      Text(Product.product[index].name2, style: TextStyle(color: Colors.orange.shade400, fontSize: 14,),),
                                    ],
                                  ),
                                  Text('\$${Product.product[index].Price}',
                                    style: TextStyle(color: Colors.black, fontSize: 16),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20,),
                              Text("Get the best fashionable wears and design easily and affordable for the styles that suit you best.",
                                style: TextStyle(height: 1.5, color: Colors.grey.shade800, fontSize: 15,),
                              ),
                              SizedBox(height: 30,),
                              Text("Color", style: TextStyle(color: Colors.grey.shade400, fontSize: 18),),
                              SizedBox(height: 10,),
                              Container(
                                height: 60,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: colors.length,
                                  itemBuilder: (context, index) {
                                    return  GestureDetector(
                                        onTap: () {
                                          _selectedColor = index;
                                        },
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 300),
                                          margin: EdgeInsets.only(right: 10),
                                          decoration: BoxDecoration(
                                              color: _selectedColor == index ? colors[index] : colors[index].withOpacity(0.5),
                                              shape: BoxShape.circle
                                          ),
                                          width: 40,
                                          height: 40,
                                          child: Center(
                                            child: _selectedColor == index ? Icon(Icons.check, color: Colors.white,) : Container(),
                                          ),
                                        ),
                                      );

                                  },
                                ),
                              ),
                              SizedBox(height: 20,),
                              Text('Size', style: TextStyle(color: Colors.grey.shade400, fontSize: 18),),
                              SizedBox(height: 10,),
                              Container(
                                height: 60,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: size.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                        onTap: () {
                                          _selectedSize = index;
                                        },
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 500),
                                          margin: EdgeInsets.only(right: 10),
                                          decoration: BoxDecoration(
                                              color: _selectedSize == index ? Colors.deepPurple : Colors.grey.shade200,
                                              shape: BoxShape.circle
                                          ),
                                          width: 40,
                                          height: 40,
                                          child: Center(
                                            child: Text(size[index], style: TextStyle(color: _selectedSize == index ? Colors.white : Colors.black, fontSize: 15),),
                                          ),
                                        ),
                                      );
                                  },
                                ),
                              ),
                              SizedBox(height: 20,),
                              MaterialButton(
                                onPressed: () {
                                  dolceController.addProduct(Product.product[index]);
                                  Navigator.pop(context);
                                },
                                height: 50,
                                elevation: 0,
                                splashColor: Colors.yellow[700],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                color: Colors.yellow[800],
                                child: Center(
                                  child: Text("Add to Cart", style: TextStyle(color: Colors.white, fontSize: 18),),
                                ),
                              )
                            ],
                          )
                      )
                    ])
                ),
              ]
          ),

          Positioned(
            top: 20,
            right: 7,
            child: FloatingActionButton.extended(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Alertt()));
            },
                backgroundColor: Colors.white30,
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors. black, size: 22,),
                label: Obx( ()=> Text(dolceController.count.toString(), style: TextStyle(color: Colors.red),))),
          )
        ],
      ),
    );
  }
}
