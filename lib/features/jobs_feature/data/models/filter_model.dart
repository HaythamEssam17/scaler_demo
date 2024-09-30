class FiltersModel {
  num? test;

  FiltersModel({
    this.test,
  });

  factory FiltersModel.fromJson(Map<String, dynamic> json) => FiltersModel(
        test: json["test"],
      );

  Map<String, dynamic> toJson() => {
        "test": test,
      };
}
