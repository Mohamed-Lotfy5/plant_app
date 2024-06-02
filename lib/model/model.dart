class plantmodel {
  List<Data>? data;

  plantmodel({this.data});

  plantmodel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? title;
  String? image;
  String? description;
  int? quantity;
  double? rating;
  bool? isFav;
  String? price;

  Data(
      {this.title,
      this.image,
      this.description,
      this.quantity,
      this.rating,
      this.isFav,
      this.price});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    description = json['description'];
    quantity = json['quantity'];
    rating = json['rating'];
    isFav = json['isFav'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image'] = this.image;
    data['description'] = this.description;
    data['quantity'] = this.quantity;
    data['rating'] = this.rating;
    data['isFav'] = this.isFav;
    data['price'] = this.price;
    return data;
  }
}
