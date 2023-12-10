import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/ViewModel/apiprovider.dart';

import 'package:e_commerce/Model/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:provider/provider.dart';

import '../ViewModel/hive_provider.dart';


class Detailsscreen extends StatelessWidget {
  final int index;
  int buttonindex = 0;
  IconData? _selectedIcon;
  double? _rating;

  Detailsscreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final getdata = Provider.of<Providerprofile>(context);
    final hive = Provider.of<Hiveprovider>(context);
    getdata.fetchquestion();

    // List<Product> mylist = [];
    // void additeam() {
    //   mylist.add;
    // }

    return Scaffold(
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 760,
                child: Column(children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 370,
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
                                  getdata.datas!.products[index].thumbnail),
                              fit: BoxFit.fill),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 250,
                          child: Text(
                            getdata.datas!.products[index].title,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w800,
                                fontSize: 25),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 200,
                          child: Text(
                            getdata.datas!.products[index].brand,
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w800),
                          ),
                        ),
                        sizedbox[1],
                        Text(
                          'Deal of the Day',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        sizedbox[1],
                        Row(
                          children: [
                            Text(
                              '\-${getdata.datas!.products[index].discountPercentage.toString()}%',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.red),
                            ),
                            sizedboxwidth[2],
                            Text(
                              '\$${getdata.datas!.products[index].price.toString()}',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                                child: RatingBar.builder(
                              initialRating:
                                  getdata.datas!.products[index].rating,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: false,
                              itemCount: 5,
                              itemSize: 25,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 1),
                              itemBuilder: (context, index) => Icon(
                                _selectedIcon ?? Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                _rating = rating;
                              },
                            )),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              getdata.datas!.products[index].rating.toString(),
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        sizedbox[1],
                        Text(
                          getdata.datas!.products[index].description,
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 720),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
              ),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  // onPressed: () async {

                  onPressed: () {
                    // buttonindex = index;
                    // getdata.saveData();
                    // getdata.shoppingsample
                    //     .add(getdata.datas.products[index].id - 1);
                    hive.buttonclicked(
                        getdata.datas!.products[index].title,
                        getdata.datas!.products[index].price,
                        getdata.datas!.products[index].thumbnail);
                  },
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Center(
                      child: Text(
                        'Add to cart',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                  )),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {},
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Center(
                      child: Text(
                        'Buy now',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 20),
                      ),
                    ),
                  ))
            ],
          ),
        ),
        IconButton(
            padding: EdgeInsets.only(top: 50, left: 10),
            color: Colors.grey,
            iconSize: 50,
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_circle_left_outlined))
      ]),
    );

// Future<List<String>> getfavourites() async {
//   final prefs = await SharedPreferences.getInstance();
//   return prefs.getStringList('favourites') ?? [];
// }
  }
}
