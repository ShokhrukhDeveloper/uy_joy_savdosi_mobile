class AnnouncementList {
  AnnouncementList({
      required this.announcement,
      required this.isSuccess,
      required this.currentPageIndex,
      required this.pageCount,
      this.errorMessage,});

  AnnouncementList.fromJson(dynamic json) {
    if (json['data'] != null) {
      announcement = [];
      json['data'].forEach((v) {
        announcement.add(Announcement.fromJson(v));
      });
    }
    isSuccess = json['isSuccess'];
    currentPageIndex = json['currentPageIndex'];
    pageCount = json['pageCount'];
    errorMessage = json['errorMessage'];
  }
  List<Announcement> announcement = [];
  bool? isSuccess;
  num? currentPageIndex;
  num? pageCount;
  dynamic errorMessage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (announcement != null) {
      map['data'] = announcement.map((v) => v.toJson()).toList();
    }
    map['isSuccess'] = isSuccess;
    map['currentPageIndex'] = currentPageIndex;
    map['pageCount'] = pageCount;
    map['errorMessage'] = errorMessage;
    return map;
  }

}

class Announcement {
  Announcement({
      required this.id,
      required this.price,
      required this.photo,
      required this.title,
      required this.roomQuantity,
      required this.totalSpace,
      required this.maklerPrice,
      required this.repair,});

  factory Announcement.fromJson(
      dynamic json
      ){
    return Announcement(
        id: json['id'],
        price: json['price'],
        photo: json['photo'],
        title: json['title'],
        roomQuantity: json['roomQuantity'],
        totalSpace: json['totalSpace'],
        maklerPrice: json['maklerPrice'],
        repair: json['repair']);
  }

  final num id;
  final num price;
  final String photo;
  final String title;
  final num roomQuantity;
  final num totalSpace;
  final bool maklerPrice;
  final dynamic repair;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['price'] = price;
    map['photo'] = photo;
    map['title'] = title;
    map['roomQuantity'] = roomQuantity;
    map['totalSpace'] = totalSpace;
    map['maklerPrice'] = maklerPrice;
    map['repair'] = repair;
    return map;
  }

}