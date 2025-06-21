import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'feed_model.g.dart';

@JsonSerializable()
class FeedModel extends Equatable {
  final int? id;
  final String? title;
  final String? content;
  final int? price;

  const FeedModel({this.id, this.title, this.content, this.price});

  factory FeedModel.fromJson(Map<String, dynamic> json) =>
      _$FeedModelFromJson(json);

  Map<String, dynamic> toJson() => _$FeedModelToJson(this);

  @override
  List<Object?> get props => [id, title, content, price];
}
