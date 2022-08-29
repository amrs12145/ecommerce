class Product {
  //final String id;
  final String mainImgUrl;
  final String title;
  final double newPrice;
  final List<String>? images;
  final String? subtitle;
  final String? description;
  final double? oldPrice;
  final double? rating;
  final int? numOfRating;
  final String? size;
  final String? color;
  final int? numOfReviews;
  final int? discount;
  //final List<Review> reviews;
  //final Cateogry category;
  //final List<Tags> tags;

  const Product({
    required this.mainImgUrl,
    required this.title,
    required this.newPrice,
    this.images,
    this.subtitle,
    this.description,
    this.oldPrice,
    this.rating,
    this.numOfRating,
    this.size,
    this.color,
    this.numOfReviews,
    this.discount,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      mainImgUrl: json["main_img_url"],
      title: json["title"],
      newPrice: double.parse(
          json["new_price"].toString()), //TODO:To find a diffrent approach
      images: json["images"],
      subtitle: json["subtitle"],
      description: json["description"],
      oldPrice: double.tryParse(json["old_price"].toString()),
      rating: double.tryParse(json["rating"].toString()),
      numOfRating: json["num_of_rating"],
      size: json["size"],
      color: json["color"],
      numOfReviews: json["num_of_reviews"],
      discount: json["discount"],
    );
  }

  toJson() {
    return {
      "main_img_url": mainImgUrl,
      "title": title,
      "new_price": newPrice,
      "images": images,
      "subtitle": subtitle,
      "description": description,
      "old_price": oldPrice,
      "rating": rating,
      "num_of_rating": numOfRating,
      "size": size,
      "color": color,
      "num_of_reviews": numOfReviews,
      "discount": discount,
    };
  }
}
