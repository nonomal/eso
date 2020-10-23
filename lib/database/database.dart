// database.dart

// required package imports
import 'dart:async';
import 'package:path/path.dart';
import 'package:eso/global.dart';
import 'package:eso/utils/cache_util.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'rule.dart';
import 'rule_dao.dart';

part 'database.g.dart'; // the generated code will be there

@Database(version: 7, entities: [Rule])
abstract class AppDatabase extends FloorDatabase {
  RuleDao get ruleDao;
}

final migration4to5 = Migration(4, 5, (database) async {
  await database.execute('ALTER TABLE Rule ADD COLUMN loginUrl TEXT');
  await database.execute('ALTER TABLE Rule ADD COLUMN cookies TEXT');
});

final migration5to6 = Migration(5, 6, (database) async {
  await database.execute('ALTER TABLE Rule ADD COLUMN viewStyle INT');
});

final migration6to7 = Migration(6, 7, (database) async {
  await database.execute('ALTER TABLE Rule ADD COLUMN loginUrl TEXT');
  await database.execute('ALTER TABLE Rule ADD COLUMN cookies TEXT');
});
