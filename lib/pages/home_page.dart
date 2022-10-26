import 'package:flutter/material.dart';
import 'package:pdm/pages/detail_page.dart';
import 'package:pdm/model/list_cache.dart';
import 'package:provider/provider.dart';

import '../routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<ListCache>(
      builder: (context, cache, child) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Bem Vindo",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold)),
                      Image.network("https://i.imgur.com/g2yY2tL.png")
                    ],
                  ),
                  SizedBox(height: 30),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(cache.list.length, (index) {
                        return InkWell(
                          onTap: () => Navigator.of(context)
                              .pushNamed(RouteGenerator.detailPage),
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            child: Column(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Image.asset(
                                      cache.list[index].picture,
                                      width: 100,
                                      fit: BoxFit.cover,
                                    )),
                                SizedBox(height: 5),
                                Text(cache.list[index].name),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Aulas de Yoga",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(cache.list.length, (index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                cache.list[index].picture,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: 5),
                              Text(
                                cache.list[index].name,
                                textAlign: TextAlign.start,
                              ),
                              Text(
                                cache.list[index].description,
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Aulas Passadas",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(cache.list.length, (index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            children: [
                              Image.asset(
                                cache.list[index].picture,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: 5),
                              Text(cache.list[index].name),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}
