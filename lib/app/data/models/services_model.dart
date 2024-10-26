// To parse this JSON data, do
//
//     final services = servicesFromJson(jsonString);

import 'dart:convert';

Services servicesFromJson(String str) => Services.fromJson(json.decode(str));

String servicesToJson(Services data) => json.encode(data.toJson());

class Services {
    List<Service> data;

    Services({
        required this.data,
    });

    factory Services.fromJson(Map<String, dynamic> json) => Services(
        data: List<Service>.from(json["data"].map((x) => Service.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Service {
    int id;
    int outletId;
    bool serviceEnable;
    String serviceItemFormat;
    String title;
    String description;
    dynamic notes;
    int priceItem;
    List<ItemsAllowed> itemsAllowed;

    Service({
        required this.id,
        required this.outletId,
        required this.serviceEnable,
        required this.serviceItemFormat,
        required this.title,
        required this.description,
        required this.notes,
        required this.priceItem,
        required this.itemsAllowed,
    });

    factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        outletId: json["outlet_id"],
        serviceEnable: json["service_enable"],
        serviceItemFormat: json["service_item_format"],
        title: json["title"],
        description: json["description"],
        notes: json["notes"],
        priceItem: json["price_item"],
        itemsAllowed: List<ItemsAllowed>.from(json["items_allowed"].map((x) => ItemsAllowed.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "outlet_id": outletId,
        "service_enable": serviceEnable,
        "service_item_format": serviceItemFormat,
        "title": title,
        "description": description,
        "notes": notes,
        "price_item": priceItem,
        "items_allowed": List<dynamic>.from(itemsAllowed.map((x) => x.toJson())),
    };
}

class ItemsAllowed {
    String itemName;
    int maxQuantity;

    ItemsAllowed({
        required this.itemName,
        required this.maxQuantity,
    });

    factory ItemsAllowed.fromJson(Map<String, dynamic> json) => ItemsAllowed(
        itemName: json["item_name"],
        maxQuantity: json["max_quantity"],
    );

    Map<String, dynamic> toJson() => {
        "item_name": itemName,
        "max_quantity": maxQuantity,
    };
}
