import 'package:hive/hive.dart';

part 'hive.g.dart';

@HiveType(typeId: 1)
class Model {
  @HiveField(0)
 final String name;

  @HiveField(1)
 final String image;

  @HiveField(2)
final String price;

 
  

  Model({required this.name, required this.image,required this. price});
}
