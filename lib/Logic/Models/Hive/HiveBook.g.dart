// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HiveBook.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveBookAdapter extends TypeAdapter<HiveBook> {
  @override
  final int typeId = 0;

  @override
  HiveBook read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveBook(
      author: (fields[4] as List?)?.cast<dynamic>(),
      contributor: (fields[7] as List?)?.cast<dynamic>(),
      description: fields[9] as String?,
      editioncount: fields[2] as int?,
      firtspublicyear: fields[5] as int?,
      numberofpagemediam: fields[6] as int?,
      time: (fields[8] as List?)?.cast<dynamic>(),
      title: fields[0] as String?,
      urlImg: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveBook obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.editioncount)
      ..writeByte(3)
      ..write(obj.urlImg)
      ..writeByte(4)
      ..write(obj.author)
      ..writeByte(5)
      ..write(obj.firtspublicyear)
      ..writeByte(6)
      ..write(obj.numberofpagemediam)
      ..writeByte(7)
      ..write(obj.contributor)
      ..writeByte(8)
      ..write(obj.time)
      ..writeByte(9)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveBookAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
