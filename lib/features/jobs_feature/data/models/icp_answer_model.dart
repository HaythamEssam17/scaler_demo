import 'package:scalers_demo/core/helpers/shared_texts.dart';
import 'package:scalers_demo/core/model/lookup_model.dart';

class IcpAnswersModel {
  List<LookupModel>? jobRole;
  List<LookupModel>? typeOfSales;
  LookupModel? commissionOffered;
  bool? relocationAllowance;

  IcpAnswersModel({
    this.jobRole,
    this.typeOfSales,
    this.commissionOffered,
    this.relocationAllowance,
  });

  factory IcpAnswersModel.fromJson(Map<String, dynamic> json) => IcpAnswersModel(
        jobRole: List<LookupModel>.from(json["job-role"].map((x) => LookupModel.fromJson(x))),
        typeOfSales: List<LookupModel>.from(json["type-of-sales"].map((x) => LookupModel.fromJson(x))),
        commissionOffered: json["commission-offered"] == null ? null : LookupModel.fromJson(json["commission-offered"]),
        relocationAllowance: json["relocation-allowance"],
      );

  Map<String, dynamic> toJson() => {
        "job-role": List<dynamic>.from(jobRole!.map((x) => x.toJson())),
        "type-of-sales": List<dynamic>.from(typeOfSales!.map((x) => x.toJson())),
        "commission-offered": commissionOffered?.toJson(),
        "relocation-allowance": relocationAllowance,
      };

  String getFullJobDescription = '';

  void getFullDescriptionFromJobRole() {
    getFullJobDescription = '';

    for (var i in jobRole!) {
      getFullJobDescription += '- ${SharedText.isARLocal() ? i.descriptionAr! : i.descriptionEn!}';
    }

    for (var i in typeOfSales!) {
      getFullJobDescription += '\n- ${SharedText.isARLocal() ? i.descriptionAr! : i.descriptionEn!}';
    }
  }
}
