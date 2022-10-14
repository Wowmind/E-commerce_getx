
import 'package:dolce/model/good.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DolceController extends GetxController{

  var _product = {}.obs;
 // var selectedImagePath = ''.obs;

  int get count => _product.length ;

/*
  void getImage(ImageSource imageSource) async{
    final pickedFile = await ImagePicker().getImage(source: imageSource);
    if (pickedFile != null){
      selectedImagePath.value = pickedFile.path;
    }
  }
*/


  void addProduct(Product product){
    if(_product.containsKey(product)){
      _product[product] +=1;
    } else{
      _product[product] =1;

    }
    Get.snackbar('Product added', 'You have added the${product.name} to the cart',
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
      backgroundColor: Colors.amber,

    );

  }

  get product => _product;

  void removeProduct(Product product){
    if (_product.containsKey(product) && _product[product]==1) {
      _product.removeWhere((key, value) => key == product);
    }else {
      _product[product] -=1;
    }

    Get.snackbar('Product removed', 'You have removed the${product.name} to the cart',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2)

    );
  }
  get productSubTotal => _product.entries
      .map((product) => product.key.price * product.value)
      .toList();

  get total => _product.entries
      .map((product) => product.key.price * product.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

}