// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieItemAdapter extends TypeAdapter<MovieItem> {
  @override
  final int typeId = 1;

  @override
  MovieItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieItem(
      id: fields[0] as int,
      judul: fields[1] as String,
      image: fields[2] as String,
      deskripsi: fields[3] as String,
      ratting: fields[4] as double?,
      realeseData: fields[5] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, MovieItem obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.judul)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.deskripsi)
      ..writeByte(4)
      ..write(obj.ratting)
      ..writeByte(5)
      ..write(obj.realeseData);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
