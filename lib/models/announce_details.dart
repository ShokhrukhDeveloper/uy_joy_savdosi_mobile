class AnnounceDetails {
  AnnounceDetails({
      required this.details,
      this.errorMessage,});

  factory AnnounceDetails.fromJson(dynamic json) {
    return AnnounceDetails(
     details : Details.fromJson(json['data']),errorMessage: json['errorMessage']);
  }
  final Details details;

  final dynamic errorMessage;


}

class Details {
  Details({
      required this.isActive,
      required this.images,
      required this.priceType,
      required this.price,
      required this.photo,
      required this.title,
      required this.description,
      required this.typeOfBuildingId,
      this.typeOfBuilding, 
      this.regionId, 
      this.region, 
      required this.repairId,
      this.repair, 
      required this.layoutId,
      this.layout, 
      required this.totalSpace,
      required this.numberOfStoreys,
      required this.numberOfRooms,
      required this.livingSpace,
      this.kitchenSpace, 
      this.year, 
      this.ceilingHeight, 
      required this.maklerPrice,
      this.isFurnished, 
      this.isNegotiable, 
      this.isNewBuilding, 
      this.contactId, 
      this.contact, 
      required this.announceApartementHas,
      required this.announceNearby,});

 factory Details.fromJson(dynamic json)
 {
  return  Details(
       isActive : json['isActive'],
       images : json['images'] != null ? json['images'].cast<String>() : [],
       priceType : json['priceType'],
       price : json['price'],
       photo : json['photo'],
       title : json['title'],
       description : json['description'],
       typeOfBuildingId : json['typeOfBuildingId'],
       typeOfBuilding : json['typeOfBuilding'],
       regionId : json['regionId'],
       region : json['region'],
       repairId : json['repairId'],
       repair : json['repair'],
       layoutId : json['layoutId'],
       layout : json['layout'],
       totalSpace : json['totalSpace'],
       numberOfStoreys : json['numberOfStoreys'],
       numberOfRooms : json['numberOfRooms'],
       livingSpace : json['livingSpace'],
       kitchenSpace : json['kitchenSpace'],
       year : json['year'],
       ceilingHeight : json['ceilingHeight'],
       maklerPrice : json['maklerPrice'],
       isFurnished : json['isFurnished'],
   isNegotiable : json['isNegotiable'],
   isNewBuilding : json['isNewBuilding'],
   contactId : json['contactId'],
   contact : json['contact'],
     announceApartementHas: json['announceApartementHas'].map<AnnounceInfo>((v)=>AnnounceInfo.fromJson(v)).toList(),
     announceNearby: json['announceNearby'].map<AnnounceInfo>((v)=>AnnounceInfo.fromJson(v)).toList(),

   );
 }
 final bool isActive;
 final List<String> images;
 final bool priceType;
 final num price;
 final String photo;
 final String title;
 final String description;
 final num typeOfBuildingId;
  dynamic typeOfBuilding;
  num? regionId;
  dynamic region;
 final num repairId;
  dynamic repair;
  final num layoutId;
  dynamic layout;
  final num totalSpace;
  final num numberOfStoreys;
  final num numberOfRooms;
  final num livingSpace;
  num? kitchenSpace;
  num? year;
  num?  ceilingHeight;
  bool maklerPrice;
  bool? isFurnished;
  bool? isNegotiable;
  bool? isNewBuilding;
  num? contactId;
  dynamic contact;
  List<AnnounceInfo> announceApartementHas=[];
  List<AnnounceInfo> announceNearby=[];


}

class AnnounceInfo {
  AnnounceInfo({
      required this.id,
      required this.uz,
      required this.ru,});

  factory AnnounceInfo.fromJson(dynamic json) {
   return AnnounceInfo(
        id : json['id'],
        uz : json['uz'],
        ru : json['ru']);
  }
  final num id;
  final String uz;
  final String ru;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['uz'] = uz;
    map['ru'] = ru;
    return map;
  }

}

