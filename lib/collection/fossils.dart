import 'package:isar/isar.dart';

part 'fossils.g.dart';

@Collection()
class Fossil {
  Id id = Isar.autoIncrement;

  late String name;
  late String imagePath;
  late String description;
}
