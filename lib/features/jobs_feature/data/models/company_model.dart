class CompanyModel {
  String? name;
  String? logo;

  CompanyModel({
    this.name,
    this.logo,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
        name: json["name"],
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "logo": logo,
      };
}
