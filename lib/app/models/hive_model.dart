
import 'package:hive_flutter/adapters.dart';
part 'hive_model.g.dart';

@HiveType(typeId: 0)
class MovieHive{
  @HiveField(0)
  final String title;

  MovieHive(this.title);
}