// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.tarefa_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TarefaModelAdapter extends TypeAdapter<TarefaModel> {
  @override
  final int typeId = 1;

  @override
  TarefaModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TarefaModel()
      ..description = fields[0] as String
      ..isFinished = fields[1] as bool;
  }

  @override
  void write(BinaryWriter writer, TarefaModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.description)
      ..writeByte(1)
      ..write(obj.isFinished);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TarefaModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
