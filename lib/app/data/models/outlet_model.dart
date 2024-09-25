import 'dart:convert';

Outlets outletsFromJson(String str) => Outlets.fromJson(json.decode(str));

String outletsToJson(Outlets data) => json.encode(data.toJson());

class Outlets {
    List<Datum> data;
    Paging paging;

    Outlets({
        required this.data,
        required this.paging,
    });

    factory Outlets.fromJson(Map<String, dynamic> json) => Outlets(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        paging: Paging.fromJson(json["paging"]),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "paging": paging.toJson(),
    };
}

class Datum {
    int id;
    String name;
    String address;
    String rating;
    int reviews;
    String estimateIncome;
    int totalOrders;
    int ownerId;

    Datum({
        required this.id,
        required this.name,
        required this.address,
        required this.rating,
        required this.reviews,
        required this.estimateIncome,
        required this.totalOrders,
        required this.ownerId,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        rating: json["rating"],
        reviews: json["reviews"],
        estimateIncome: json["estimate_income"],
        totalOrders: json["total_orders"],
        ownerId: json["owner_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "rating": rating,
        "reviews": reviews,
        "estimate_income": estimateIncome,
        "total_orders": totalOrders,
        "owner_id": ownerId,
    };
}

class Paging {
    int page;
    int totalItem;
    int totalPage;

    Paging({
        required this.page,
        required this.totalItem,
        required this.totalPage,
    });

    factory Paging.fromJson(Map<String, dynamic> json) => Paging(
        page: json["page"],
        totalItem: json["total_item"],
        totalPage: json["total_page"],
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "total_item": totalItem,
        "total_page": totalPage,
    };
}
