import 'package:isar/isar.dart';

part 'fossils.g.dart';

@Collection()
class FossilData {
  Id id = Isar.autoIncrement;

  late String name;
  late String imagePath;
  late String description;

  FossilData({required this.name, required this.imagePath, required this.description});
}