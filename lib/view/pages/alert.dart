import 'package:dolce/control/models.dart';
import 'package:dolce/model/good.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class Alertt extends StatelessWidget {
   Alertt({Key? key}) : super(key: key);
  final DolceController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.1),
      appBar: AppBar(
        backgroundColor: Colors.grey.withOpacity(0.1),
        title: const Text('My Cart',
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Obx(
        ()=> ListView.builder(
            itemCount: controller.product.length,
              itemBuilder: (context, index){
            return Cart(
              controller: controller,
              product: controller.product.keys.toList()[index],
              quantity: controller.product.values.toList()[index],
              index: index,

            );
          }),
      ),

    );
  }
}

class Cart extends StatelessWidget {
  DolceController controller;
  final Product product;
  final quantity;
  final index;
   Cart({Key? key,
     required this.controller,
     required this.product,
     required this.quantity,
     required this.index,

   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 15),
      height: 150,
      width: MediaQuery .of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            width: 170,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(Product.product[index].img),
              )
            ),
          ),
          const SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Product.product[index].name2,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              ),
              const SizedBox(height: 20,),
              Text(Product.product[index].name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.teal,
              ),
              ),

              const SizedBox(height: 30,),
              Text('\$${Product.product[index].Price}',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 23,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(width: 40,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             IconButton(onPressed: (){
               controller.addProduct(product);
             },
                 icon: const Icon(
                     Icons.add_circle_outline
                 ),
               color: Colors.black,
               iconSize: 16,
             ),
              const SizedBox(height: 5,),

              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text('${quantity}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),),
              ),

              const SizedBox(height: 5,),

              IconButton(onPressed: (){
                controller.removeProduct(product);
              },
                icon: const Icon(
                    Icons.remove_circle_outline
                ),
                color: Colors.black,
                iconSize: 16,
              ),

            ],
          )
        ],
      ),
    );
  }
}

