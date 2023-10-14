// class Products {
//   Products({
//        this.id,
//      this.name,
//      this.description,
//      this.price,
//      this.stars,
//      this.image,
//      this.location,
//      this.createdAt,
//      this.updatedAt,
//      this.typeId,});
//
//   Products.fromJson(dynamic json) {
//     id = json['id'];
//     name = json['name'];
//     description = json['description'];
//     price = json['price'];
//     stars = json['stars'];
//     image = json['image'];
//     location = json['location'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     typeId = json['type_id'];
//   }
//   int? id;
//   String? name;
//   String? description;
//   String? price;
//   String? stars;
//   String? image;
//   String? location;
//   String? createdAt;
//   String? updatedAt;
//   int? typeId;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['name'] = name;
//     map['description'] = description;
//     map['price'] = price;
//     map['stars'] = stars;
//     map['image'] = image;
//     map['location'] = location;
//     map['created_at'] = createdAt;
//     map['updated_at'] = updatedAt;
//     map['type_id'] = typeId;
//     return map;
//   }
//
// }