// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'dart:convert';

Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));

String cartToJson(Cart data) => json.encode(data.toJson());

class Cart {
  String message;
  int status;
  Data data;

  Cart({
    required this.message,
    required this.status,
    required this.data,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    message: json["message"],
    status: json["status"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "data": data.toJson(),
  };
}

class Data {
  String id;
  RId userId;
  List<Product> products;
  int totalAmount;
  int discountPrice;
  int paidAmount;
  int totalItem;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Data({
    required this.id,
    required this.userId,
    required this.products,
    required this.totalAmount,
    required this.discountPrice,
    required this.paidAmount,
    required this.totalItem,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    userId: RId.fromJson(json["userId"]),
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    totalAmount: json["totalAmount"],
    discountPrice: json["discountPrice"],
    paidAmount: json["paidAmount"],
    totalItem: json["totalItem"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "userId": userId.toJson(),
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "totalAmount": totalAmount,
    "discountPrice": discountPrice,
    "paidAmount": paidAmount,
    "totalItem": totalItem,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}

class Product {
  RId vendorId;
  Category category;
  ProductId productId;
  DiscountId discountId;
  int productPrice;
  double cGst;
  double sGst;
  int quantity;
  int discountPrice;
  int total;
  String id;

  Product({
    required this.vendorId,
    required this.category,
    required this.productId,
    required this.discountId,
    required this.productPrice,
    required this.cGst,
    required this.sGst,
    required this.quantity,
    required this.discountPrice,
    required this.total,
    required this.id,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    vendorId: RId.fromJson(json["vendorId"]),
    category: Category.fromJson(json["category"]),
    productId: ProductId.fromJson(json["productId"]),
    discountId: DiscountId.fromJson(json["discountId"]),
    productPrice: json["productPrice"],
    cGst: json["cGst"]?.toDouble(),
    sGst: json["sGst"]?.toDouble(),
    quantity: json["quantity"],
    discountPrice: json["discountPrice"],
    total: json["total"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "vendorId": vendorId.toJson(),
    "category": category.toJson(),
    "productId": productId.toJson(),
    "discountId": discountId.toJson(),
    "productPrice": productPrice,
    "cGst": cGst,
    "sGst": sGst,
    "quantity": quantity,
    "discountPrice": discountPrice,
    "total": total,
    "_id": id,
  };
}

class Category {
  String id;
  String name;
  String status;
  int v;

  Category({
    required this.id,
    required this.name,
    required this.status,
    required this.v,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["_id"],
    name: json["name"],
    status: json["status"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "status": status,
    "__v": v,
  };
}

class DiscountId {
  String id;
  String vendorId;
  String productId;
  int discountPrice;
  int minOrder;
  DateTime expireDate;
  String toTime;
  String fromTime;
  String typeofCustomer;
  String type;
  DateTime createdAt;
  int v;

  DiscountId({
    required this.id,
    required this.vendorId,
    required this.productId,
    required this.discountPrice,
    required this.minOrder,
    required this.expireDate,
    required this.toTime,
    required this.fromTime,
    required this.typeofCustomer,
    required this.type,
    required this.createdAt,
    required this.v,
  });

  factory DiscountId.fromJson(Map<String, dynamic> json) => DiscountId(
    id: json["_id"],
    vendorId: json["vendorId"],
    productId: json["productId"],
    discountPrice: json["discountPrice"],
    minOrder: json["minOrder"],
    expireDate: DateTime.parse(json["expireDate"]),
    toTime: json["toTime"],
    fromTime: json["fromTime"],
    typeofCustomer: json["typeofCustomer"],
    type: json["type"],
    createdAt: DateTime.parse(json["createdAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "vendorId": vendorId,
    "productId": productId,
    "discountPrice": discountPrice,
    "minOrder": minOrder,
    "expireDate": expireDate.toIso8601String(),
    "toTime": toTime,
    "fromTime": fromTime,
    "typeofCustomer": typeofCustomer,
    "type": type,
    "createdAt": createdAt.toIso8601String(),
    "__v": v,
  };
}

class ProductId {
  String id;
  String vendorId;
  String category;
  String vegNonVeg;
  String status;
  String name;
  String description;
  int price;
  int packageCharges;
  int gst;
  double cGst;
  double sGst;
  int ratings;
  int stock;
  int numOfReviews;
  List<dynamic> images;
  List<Review> reviews;
  DateTime createdAt;
  int v;
  bool available;

  ProductId({
    required this.id,
    required this.vendorId,
    required this.category,
    required this.vegNonVeg,
    required this.status,
    required this.name,
    required this.description,
    required this.price,
    required this.packageCharges,
    required this.gst,
    required this.cGst,
    required this.sGst,
    required this.ratings,
    required this.stock,
    required this.numOfReviews,
    required this.images,
    required this.reviews,
    required this.createdAt,
    required this.v,
    required this.available,
  });

  factory ProductId.fromJson(Map<String, dynamic> json) => ProductId(
    id: json["_id"],
    vendorId: json["vendorId"],
    category: json["category"],
    vegNonVeg: json["vegNonVeg"],
    status: json["status"],
    name: json["name"],
    description: json["description"],
    price: json["price"],
    packageCharges: json["packageCharges"],
    gst: json["gst"],
    cGst: json["cGst"]?.toDouble(),
    sGst: json["sGst"]?.toDouble(),
    ratings: json["ratings"],
    stock: json["Stock"],
    numOfReviews: json["numOfReviews"],
    images: List<dynamic>.from(json["images"].map((x) => x)),
    reviews: List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
    createdAt: DateTime.parse(json["createdAt"]),
    v: json["__v"],
    available: json["available"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "vendorId": vendorId,
    "category": category,
    "vegNonVeg": vegNonVeg,
    "status": status,
    "name": name,
    "description": description,
    "price": price,
    "packageCharges": packageCharges,
    "gst": gst,
    "cGst": cGst,
    "sGst": sGst,
    "ratings": ratings,
    "Stock": stock,
    "numOfReviews": numOfReviews,
    "images": List<dynamic>.from(images.map((x) => x)),
    "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
    "createdAt": createdAt.toIso8601String(),
    "__v": v,
    "available": available,
  };
}

class Review {
  String user;
  int rating;
  String comment;
  String id;

  Review({
    required this.user,
    required this.rating,
    required this.comment,
    required this.id,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    user: json["user"],
    rating: json["rating"],
    comment: json["comment"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "user": user,
    "rating": rating,
    "comment": comment,
    "_id": id,
  };
}

class RId {
  String id;
  String fullName;
  String? language;
  String phone;
  String email;
  String password;
  String? city;
  bool accountVerification;
  String userType;
  String? status;
  int wallet;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String otp;
  DateTime otpExpiration;

  RId({
    required this.id,
    required this.fullName,
    this.language,
    required this.phone,
    required this.email,
    required this.password,
    this.city,
    required this.accountVerification,
    required this.userType,
    this.status,
    required this.wallet,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.otp,
    required this.otpExpiration,
  });

  factory RId.fromJson(Map<String, dynamic> json) => RId(
    id: json["_id"],
    fullName: json["fullName"],
    language: json["language"],
    phone: json["phone"],
    email: json["email"],
    password: json["password"],
    city: json["city"],
    accountVerification: json["accountVerification"],
    userType: json["userType"],
    status: json["status"],
    wallet: json["wallet"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    otp: json["otp"],
    otpExpiration: DateTime.parse(json["otpExpiration"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "fullName": fullName,
    "language": language,
    "phone": phone,
    "email": email,
    "password": password,
    "city": city,
    "accountVerification": accountVerification,
    "userType": userType,
    "status": status,
    "wallet": wallet,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "otp": otp,
    "otpExpiration": otpExpiration.toIso8601String(),
  };
}
