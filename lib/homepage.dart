import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/provider.dart';
import 'package:provider/provider.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Consumer<DataProvider>(builder: (context, getdata, child) {
              getdata.fetchQuestion();
              return Container(
                width: double.infinity,
                height: 300,
                color: Colors.white,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 170,
                    aspectRatio: 1 / 2,
                    viewportFraction: 1.0,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: [
                    Container(
                      height: 100,
                      width: 300,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://bd.gaadicdn.com/processedimages/kawasaki/ninja-400/640X309/ninja-40062b2b760470d9.jpg"))),
                    ),
                    Container(
                      height: 100,
                      width: 300,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://cdn.shopify.com/s/files/1/0608/7819/2888/files/bmw-2023.jpg?v=1674124793"))),
                    ),
                    Container(
                      height: 100,
                      width: 300,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://cdni.autocarindia.com/Utils/ImageResizer.ashx?n=https://cms.haymarketindia.net/model/uploads/modelimages/Kawasaki-Ninja-650-061220221542.jpg&w=386&h=256&q=75&c=1"))),
                    ),
                    Container(
                      height: 100,
                      width: 300,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://i.ndtvimg.com/i/2018-01/kawasaki-ninja-650-blue_827x510_41515758102.jpg"))),
                    )
                  ],
                ),
              );
            }),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 600,
              child: Consumer<DataProvider>(builder: (context, getdata, child) {
                return GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 150,
                      childAspectRatio: 2 / 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 20),
                  itemCount: getdata.Datas.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 40,
                            backgroundImage: NetworkImage(
                                getdata.Datas[index].categoryImage)),
                        Text(
                          getdata.Datas[index].categoryName,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    );
                  },
                );
              }),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        backgroundColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.business,
              color: Colors.black54,
            ),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.school,
              color: Colors.black54,
            ),
            label: 'School',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: Colors.black54,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
