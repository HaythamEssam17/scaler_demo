import 'package:scalers_demo/core/helpers/shared_texts.dart';

class LookupModel {
  num? id;
  String? titleAr;
  String? titleEn;
  String? nameAr;
  String? nameEn;
  String? descriptionAr;
  String? descriptionEn;
  num? listOrder;
  num? order;
  List<String>? nextQuestion;

  LookupModel({
    this.id,
    this.titleAr,
    this.titleEn,
    this.nameAr,
    this.nameEn,
    this.descriptionAr,
    this.descriptionEn,
    this.listOrder,
    this.order,
    this.nextQuestion,
  });

  factory LookupModel.fromJson(Map<String, dynamic> json) => LookupModel(
        id: json["id"],
        titleAr: json["title_ar"] ?? '',
        titleEn: json["title_en"] ?? '',
        nameAr: json["name_ar"] ?? '',
        nameEn: json["name_en"] ?? '',
        descriptionAr: json["description_ar"] ?? '',
        descriptionEn: json["description_en"] ?? '',
        listOrder: json["list_order"] ?? 0,
        order: json["order"] ?? 0,
        nextQuestion: json["next_question"] == null ? [] : List<String>.from(json["next_question"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title_ar": titleAr,
        "title_en": titleEn,
        "name_ar": nameAr,
        "name_en": nameEn,
        "description_ar": descriptionAr,
        "description_en": descriptionEn,
        "list_order": listOrder,
        "order": order,
        "next_question": List<dynamic>.from(nextQuestion!.map((x) => x)),
      };

  String get getTitle => SharedText.isARLocal() ? titleAr! : titleEn!;
}
