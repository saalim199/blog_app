// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BlogHiveAdapter extends TypeAdapter<BlogHive> {
  @override
  final int typeId = 0;

  @override
  BlogHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BlogHive(
      title: fields[0] as String,
      id: fields[1] as String,
      image: fields[2] as Uint8List,
    );
  }

  @override
  void write(BinaryWriter writer, BlogHive obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is BlogHiveAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
