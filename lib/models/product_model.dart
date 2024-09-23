class ProductModel {
  final dynamic id;
  final String? title;
  final dynamic price;
  final String? description;
  final String? categoryName;
  final String? image;
  // final RatingModel? rating;

  ProductModel({
    required this.id,
    this.title,
    this.price,
    this.description,
    this.categoryName,
    this.image,
    // this.rating
  });
  factory ProductModel.fromJson(json) {
    return ProductModel(
      id: json["id"],
      title: json["title"],
      price: json["price"],
      description: json["description"],
      categoryName: json["category"],
      image: json["image"],
      // rating: RatingModel.fromJson(json["rating"])
    );
  }
}

// class RatingModel {
//   final dynamic rate;
//   final int? count;

//   RatingModel({this.rate, this.count});
//   factory RatingModel.fromJson(json) {
//     return RatingModel(rate: json["rate"], count: json["count"]);
//   }
// }
