import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              width: double.infinity,
              child: Image.network("https://i.imgur.com/v3rpKR0.png", fit: BoxFit.cover,)),
          Container(
            padding: EdgeInsets.all(30),
            child: Expanded(
              child: Column(
                children: [
                  Text('Basic Yoga',style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
                  SizedBox(height: 10),
                  Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry.',style: TextStyle(fontSize: 15), textAlign: TextAlign.center,),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text('15 minutes', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                          Text('Duration'),
                        ],
                      ),
                      Column(
                        children: [
                          Text('Begginer 1', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                          Text('Level'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 35),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () => {},
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 15),
              margin: EdgeInsets.symmetric(horizontal: 50),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.black
              ),
              child: Text("Enviar", textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
            ),
          )
        ],
      ),
    );
  }
}
