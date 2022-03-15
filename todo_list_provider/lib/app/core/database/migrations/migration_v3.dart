import 'package:sqflite_common/sqlite_api.dart';

import 'migration.dart';

class MigrationV3 implements Migration {
  @override
  void create(Batch batch) {
    batch.execute('''
create table todo2(
  id Integer primary key autoincrement,
  descricao varchar(500) not null,
  data_hora datetime,
  finalizado  integer
)

''');
  }

  @override
  void upDate(Batch batch) {
    batch.execute('''
create table todo2(
  id Integer primary key autoincrement,
  descricao varchar(500) not null,
  data_hora datetime,
  finalizado  integer
)

''');
  }
}
