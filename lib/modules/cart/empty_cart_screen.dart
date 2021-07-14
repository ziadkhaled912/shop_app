import 'package:flutter/material.dart';

class EmptyCartScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text("My Cart"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('assets/images/Untitled-1.png'),
            width: double.infinity,
            height: 170,
          ),
          SizedBox(height: 35),
          Text(
            'Your bag is empty',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Text(
              'Looks like you haven\'t added any items to the bag yet\b'
                  ' Start shopping to fill it in',
              style: TextStyle(
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
