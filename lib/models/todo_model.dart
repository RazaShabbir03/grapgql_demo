// To parse this JSON data, do
//
//     final todosModel = todosModelFromMap(jsonString);

import 'dart:convert';

TodosModel todosModelFromMap(String str) =>
    TodosModel.fromMap(json.decode(str));

String todosModelToMap(TodosModel data) => json.encode(data.toMap());

class TodosModel {
  TodosModel({
    this.typename,
    this.todos,
  });

  String? typename;
  List<Todo>? todos;

  TodosModel copyWith({
    String? typename,
    List<Todo>? todos,
  }) =>
      TodosModel(
        typename: typename ?? this.typename,
        todos: todos ?? this.todos,
      );

  factory TodosModel.fromMap(Map<String, dynamic> json) => TodosModel(
        typename: json["__typename"] == null ? null : json["__typename"],
        todos: json["todos"] == null
            ? null
            : List<Todo>.from(json["todos"].map((x) => Todo.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "__typename": typename == null ? null : typename,
        "todos": todos == null
            ? null
            : List<dynamic>.from(todos!.map((x) => x.toMap())),
      };
}

class Todo {
  Todo({
    this.typename,
    this.id,
    this.description,
  });

  String? typename;
  String? id;
  String? description;

  Todo copyWith({
    String? typename,
    String? id,
    String? description,
  }) =>
      Todo(
        typename: typename ?? this.typename,
        id: id ?? this.id,
        description: description ?? this.description,
      );

  factory Todo.fromMap(Map<String, dynamic> json) => Todo(
        typename: json["__typename"] == null ? null : json["__typename"],
        id: json["id"] == null ? null : json["id"],
        description: json["description"] == null ? null : json["description"],
      );

  Map<String, dynamic> toMap() => {
        "__typename": typename == null ? null : typename,
        "id": id == null ? null : id,
        "description": description == null ? null : description,
      };
}
