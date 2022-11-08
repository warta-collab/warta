part of '../app_data.dart';

class Source {
  String? id;
  String? name;

  Source({this.id = '0', this.name});

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json['id'],
        name: json['name'],
      );
}
