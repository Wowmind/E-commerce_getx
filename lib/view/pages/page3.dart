import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/model6.jpeg')
          )
      ),
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(height: 40,),

            Padding(
              padding: EdgeInsets.only(left: 320),
              child: Icon(
                Icons.search, color: Colors.white, size: 30,
              ),
            ),

            SizedBox(height: 60,),
            Text('Spring Collection',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  fontSize: 14
              ),
            ),

            SizedBox(height: 20,),
            Text('20% OFF',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 50
              ),
            ),

            SizedBox(height: 10,),
            Text('Shopping in style and luxury',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 14
              ),
            )
          ],
        ),
      ),
    );
  }
}
