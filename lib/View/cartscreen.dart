import 'package:e_commerce/ViewModel/apiprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Model/hive.dart';
import '../ViewModel/hive_provider.dart';

class Mycart extends StatelessWidget {
  Mycart({super.key});

  @override
  Widget build(BuildContext context) {
    final getdata = Provider.of<Providerprofile>(context);

    final hive = Provider.of<Hiveprovider>(context);
    hive.getalldata();
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete),
              iconSize: 25,
            )
          ],
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ValueListenableBuilder(
              valueListenable: hive.details,
              builder: (context, List<Model> dlist, child) {
                return ListView.builder(
                  itemCount: dlist.length,
                  itemBuilder: (context, index) {
                    final data = dlist[index];

                    return Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 16, right: 16),
                      child: Stack(children: [
                        Container(
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border:
                                  Border.all(color: Colors.black, width: 2)),
                        ),
                        Row(
                          children: [
                            Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(data.image),
                                      fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            Text("${data.name}"),
                            IconButton(
                                onPressed: () {
                                  hive.delete(index);
                                },
                                icon: Icon(Icons.delete))
                          ],
                        )
                      ]),
                    );
                  },
                );
              }),
        ));
  }
}
