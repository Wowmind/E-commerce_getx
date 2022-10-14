import 'dart:io';

import 'package:dolce/control/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:image_picker/image_picker.dart';


class Profile extends StatelessWidget {

  final DolceController controller = Get.find();
  File ? pickedFile;
  ImagePicker imagePicker = ImagePicker();

   Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 100,),
          Center(
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/model2.jpeg'),
                ),

                Positioned(
                  right: 20,
                  bottom: 20,
                  child: IconButton(onPressed: (){
                    showModalBottomSheet(context: context, builder: (context)=>bottomSheet());
                  },
                      icon: Icon(Icons.camera_alt, color: Colors.teal, size: 28,)),
                ),
              ],
            ),
          ),

          Divider()
        ],
      ),

    );
  }
  Widget bottomSheet(){
    return Container(
      height: 150,
      width: 400,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Choose a profile picture',
          style: TextStyle(
            fontSize: 20,
          ),
          ),
          const SizedBox(height: 20,),
           Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    IconButton(onPressed: () {
                      takePhoto(ImageSource.camera);

                      },
                          icon: Icon(Icons.camera,)),
                    const Text('Camera',
                    style: TextStyle(
                      fontSize: 14, color: Colors.black,
                    ),
                    )
                  ],
                ),
                const SizedBox(width: 25,),

                Column(
                  children: [
                    IconButton(onPressed: () {
                     takePhoto(ImageSource.gallery);
                    },
                        icon: Icon(Icons.image,)),

                    const Text('Gallery',
                      style: TextStyle(
                        fontSize: 14, color: Colors.black,
                      ),
                    )
                  ],
                ),

              ],
            ),

        ],
      ),
    );
  }

  Future <void> takePhoto(ImageSource source) async{
    final pickedImage = await imagePicker.pickImage(source: source, imageQuality: 100);

    pickedFile = File(pickedImage!.path);
    print(pickedFile);

  }

}
