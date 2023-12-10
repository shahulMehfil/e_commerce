import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/ViewModel/apiprovider.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Model/firebase.dart';
import 'cartscreen.dart';
import 'detailscreen.dart';
import 'drawer.dart';

class Homepage extends StatelessWidget {
  int buttonindex = 0;
  Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Providerprofile>(builder: (context, getdata, child) {
      getdata.fetchquestion();
      if (getdata.status == providerstatus.COMPLETE) {
        return Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.black),
              backgroundColor: Colors.white,
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Mycart(),
                    ));
                  },
                  icon: Icon(Icons.shopping_cart),
                ),
              ],
            ),
            drawer: StreamBuilder<Map<String, dynamic>>(
                stream: getUserData(),
                builder: (context, snapshot) {
                  User? user = FirebaseAuth.instance.currentUser;
                  if (snapshot.hasData) {
                    final data = snapshot.data!;
                    return Drawerscreen(
                      // age: '${data['age']}',
                      // address: '${data['address']}',
                      name: '${data['name']}',
                      email: '${data['Email']}',
                      phonenumber: '${data['phonenumber']}',

                      // phone: '${data['Phone number']}');
                    );
                  } else {
                    return Drawerscreen(
                      // age: '${data['age']}',
                      // address: '${data['address']}',
                      name: '${user?.displayName}',
                      email: '${user?.email}',
                      phonenumber: '${user?.phoneNumber}',

                      // phone: '${data['Phone number']}');
                    );
                  }
                }),
            backgroundColor: Color.fromARGB(255, 208, 207, 208),
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(
                      //   height: 15,
                      // ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10.0,
                            )
                          ],
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20)),
                            hintText: 'Search',
                            prefixIcon: Icon(Icons.search_rounded),
                            suffixIcon: IconButton(
                                onPressed: (() {}),
                                icon: Icon(Icons.qr_code_scanner_rounded)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 160,
                          aspectRatio: 16 / 9,
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
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://gizchina.it/wp-content/uploads/2023/01/Samsung-galaxy-s23-plus-s23-ultra.jpg'),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Text(
                        'Categories',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 25,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      DefaultTabController(
                        length: 5,
                        child: Column(
                          children: [
                            TabBar(
                                isScrollable: true,
                                unselectedLabelColor: Colors.black,
                                splashBorderRadius: BorderRadius.circular(40),
                                labelColor: Colors.black,
                                indicator: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 210, 210, 210),
                                        spreadRadius: 5,
                                        blurRadius: 5,
                                        offset: Offset(2, 2),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white),
                                tabs: [
                                  Tab(text: "headphone"),
                                  Tab(text: 'speakers'),
                                  Tab(text: 'mobile phone'),
                                  Tab(text: 'hot deals'),
                                  Tab(text: 'hot deals')
                                ]),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                          height: 353,
                          child: GridView.builder(
                            itemCount: getdata.datas!.products.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10.0,
                                    mainAxisSpacing: 10.0),
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  buttonindex = index;
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        Detailsscreen(index: index),
                                  ));
                                },
                                child: Container(
                                  // height: 170,
                                  // width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      image: DecorationImage(
                                          image: NetworkImage(getdata.datas!
                                              .products[index].thumbnail),
                                          fit: BoxFit.fill)),
                                ),
                              );
                            },
                          ))
                    ]),
              ),
            ));
      } else {
        return Center(child: CircularProgressIndicator());
      }
    });
  }
}
