// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dados_cadastrais.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DadosCadastraisAdapter extends TypeAdapter<DadosCadastrais> {
  @override
  final int typeId = 0;

  @override
  DadosCadastrais read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DadosCadastrais(
      fields[0] as String?,
      fields[1] as DateTime?,
      fields[2] as String?,
      (fields[3] as List).cast<String>(),
      fields[4] as int?,
      fields[5] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, DadosCadastrais obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.birthday)
      ..writeByte(2)
      ..write(obj.experienceLevel)
      ..writeByte(3)
      ..write(obj.langs)
      ..writeByte(4)
      ..write(obj.experienceTime)
      ..writeByte(5)
      ..write(obj.wageExpectation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DadosCadastraisAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
