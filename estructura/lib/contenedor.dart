import 'package:flutter/material.dart';

class ContainerExample
    extends
        StatelessWidget {
  const ContainerExample({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 80,
          color: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children:[
              Text('AppData',
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(width:80,height:80,color:Colors.black),
            Container(width:80,height:80,color:Colors.red),
            Container(width:80,height:80,color:Colors.blue),
            ],
        ),
        SizedBox(
          height: 40,
        ),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(width:100,height:80,color:Colors.black),
            Container(width:200,height:90,color:Colors.black),
            ],
        ),SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(width:100,height:200,color:Colors.black),
            Container(width:80,height:90,color:Colors.black),
            Container(width:100,height:200,color:Colors.black),
          ],
        ),
      ],
    );
  }
}
