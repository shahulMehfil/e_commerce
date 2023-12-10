import 'package:e_commerce/Model/hive.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Hiveprovider with ChangeNotifier {
  ValueNotifier<List<Model>> details = ValueNotifier([]);
  Future<void> addtocart(Model value) async {
    final modeldb = await Hive.openBox<Model>('model_db');
    await modeldb.add(value);
    notifyListeners();
  }

  Future<void> getalldata() async {
    final modeldb = await Hive.openBox<Model>('model_db');
    details.value.clear();
    details.value.addAll(modeldb.values);
    notifyListeners();
  }

  buttonclicked(
    String name,
    int price,
    String image,
  ) async {
    final model1 = Model(name: name, image: image, price: price.toString());
    if (name.isEmpty || image.isEmpty) {
    
      return;
    }
    addtocart(model1);
    notifyListeners();
  }

  Future<void> delete(int index) async {
    final modeldb = await Hive.openBox<Model>('model_db');
    await modeldb.deleteAt(index);
    getalldata();
    notifyListeners();
  }
}
