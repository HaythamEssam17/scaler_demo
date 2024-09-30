import 'dart:convert';

// class BaseModel {
//   BaseModel({this.code, this.message, this.data, this.otp});

//   num?? code;

//   String? message;
//   String? otp;
//   dynamic data;

//   factory BaseModel.fromJson(Map<String, dynamic> json) {
//     try {
//       return BaseModel(
//         code: json["code"],
//         message: json["message"],
//         data: json["data"],
//       );
//     } catch (ex) {
//       throw CustomException(CustomStatusCodeErrorType.parsing, 'cant pars base model');
//     }
//   }

//   Map<String, dynamic> toJson() => {
//         "code": code,
//         "message": message,
//         "data": data,
//       };

//   String baseModelToJson(BaseModel data) => json.encode(data.toJson());

//   @override
//   String toString() {
//     return 'BaseModel{code: $code, message: $message, data: $data}';
//   }
// }

BaseModel baseModelFromJson(String str) => BaseModel.fromJson(json.decode(str));

String baseModelToJson(BaseModel data) => json.encode(data.toJson());

class BaseModel {
  dynamic data;
  num? count;
  String? nextLink;
  String? prevLink;

  BaseModel({
    this.data,
    this.count,
    this.nextLink,
    this.prevLink,
  });

  factory BaseModel.fromJson(Map<String, dynamic> json) => BaseModel(
        data: json['data'],
        count: json["count"] ?? 0,
        nextLink: json["next_link"] ?? '',
        prevLink: json["prev_link"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "count": count,
        "next_link": nextLink,
        "prev_link": prevLink,
      };
}
