import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'fossils.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = _initIsar();
  }

  Future<Isar> _initIsar() async {
    final dir = await getApplicationDocumentsDirectory();
    return Isar.open([FossilDataSchema], directory: dir.path);
  }

  Future<void> addFossil(FossilData fossil) async {
    final isar = await db;
    isar.writeTxn(() => isar.fossilDatas.put(fossil));
  }

  Future<List<FossilData>> getFossils() async {
    final isar = await db;
    return isar.fossilDatas.where().findAll();
  }
}
