/*
To the list of the attendee list for the particular show.
*/
class DataModel {
  int? primaryId;
  int? id;
  String? firstName;
  String? lastName;
  String? organization;
  String? barcode; // Barcode of the particular order purchase by the attendee
  int? sectionId;
  int? showId; // Use to scan the ticket by swiping attendee into it.
  int?  timeId; // Use to scan the ticket by swiping attendee if only it from the multiple time event.
  String? admittedOn;
  dynamic admitted; // To get is attendee admitted to the event or not.
  String? sectionTitle;
  String? rowTitle;
  String? seatTitle;
  String? buyerFirstName;
  String? buyerLastName;
  String? promoCode;
  int? orderId;
  String? orderNumber;
  dynamic isDocumentSigned; // If the SmartWaiver is signed by attendee.
  String? attendeeImage;
  int? scanCount; // If multiple time scan available total count is shown.
  dynamic isSquareMerchandise; // If attendee has brought any product into the order.
  int? maxUses; // If multiple time scan available total count is shown.
  String?
      orderIdentifier; // Use to get if attendee has brought any product into.

  DataModel(
      {this.id,
      this.primaryId,
      this.firstName,
      this.lastName,
      this.organization,
      this.barcode,
      this.sectionId,
      this.showId,
      this.timeId,
      this.admittedOn,
      this.admitted,
      this.sectionTitle,
      this.rowTitle,
      this.seatTitle,
      this.buyerFirstName,
      this.buyerLastName,
      this.promoCode,
      this.orderId,
      this.orderNumber,
      this.isDocumentSigned,
      this.attendeeImage,
      this.scanCount,
      this.isSquareMerchandise,
      this.maxUses,
      this.orderIdentifier});

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    primaryId = json['primaryId'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    organization = json['Organization'];
    barcode = json['Barcode'];
    sectionId = json['SectionId'];
    showId = json['ShowId'];
    timeId = json['TimeId'];
    admittedOn = json['AdmittedOn'];
    admitted = json['Admitted'] == 'true' ? true : false;
    sectionTitle = json['SectionTitle'];
    rowTitle = json['RowTitle'];
    seatTitle = json['SeatTitle'];
    buyerFirstName = json['BuyerFirstName'] ?? '';
    buyerLastName = json['BuyerLastName'] ?? '';
    promoCode = json['PromoCode'];
    orderId = json['OrderId'];
    orderNumber = json['OrderNumber'];
    isDocumentSigned = json['IsDocumentSigned'];
    attendeeImage = json['AttendeeImage'];
    scanCount = json['ScanCount'];
    isSquareMerchandise = json['IsSquareMerchandise'];
    maxUses = json['MaxUses'];
    orderIdentifier = json['OrderIdentifier'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['primaryId'] = primaryId;
    data['FirstName'] = firstName;
    data['LastName'] = lastName;
    data['Organization'] = organization;
    data['Barcode'] = barcode;
    data['SectionId'] = sectionId;
    data['ShowId'] = showId;
    data['TimeId'] = timeId;
    data['AdmittedOn'] = admittedOn;
    data['Admitted'] = admitted;
    data['SectionTitle'] = sectionTitle;
    data['RowTitle'] = rowTitle;
    data['SeatTitle'] = seatTitle;
    data['BuyerFirstName'] = buyerFirstName;
    data['BuyerLastName'] = buyerLastName;
    data['PromoCode'] = promoCode;
    data['OrderId'] = orderId;
    data['OrderNumber'] = orderNumber;
    data['IsDocumentSigned'] = isDocumentSigned;
    data['AttendeeImage'] = attendeeImage;
    data['ScanCount'] = scanCount;
    data['IsSquareMerchandise'] = isSquareMerchandise;
    data['MaxUses'] = maxUses;
    data['OrderIdentifier'] = orderIdentifier;
    return data;
  }
}

// class DataModel {
//   int? id;
//   String? firstName;
//   String? lastName;
//   String? organization;
//   String? barcode;
//   int? sectionId;
//   int? showId;
//   int? timeId;
//   String? admittedOn;
//   bool? admitted;
//   String? sectionTitle;
//   String? rowTitle;
//   String? seatTitle;
//   String? buyerFirstName;
//   String? buyerLastName;
//   String? promoCode;
//   int? orderId;
//   String? orderNumber;
//   bool? isDocumentSigned;
//   String? attendeeImage;
//   int? scanCount;
//   bool? isSquareMerchandise;
//   int? maxUses;
//   String? orderIdentifier;
//
//   DataModel(
//       {this.id,
//         this.firstName,
//         this.lastName,
//         this.organization,
//         this.barcode,
//         this.sectionId,
//         this.showId,
//         this.timeId,
//         this.admittedOn,
//         this.admitted,
//         this.sectionTitle,
//         this.rowTitle,
//         this.seatTitle,
//         this.buyerFirstName,
//         this.buyerLastName,
//         this.promoCode,
//         this.orderId,
//         this.orderNumber,
//         this.isDocumentSigned,
//         this.attendeeImage,
//         this.scanCount,
//         this.isSquareMerchandise,
//         this.maxUses,
//         this.orderIdentifier});
//
//   DataModel.fromJson(Map<String, dynamic> json) {
//     id = json['Id'];
//     firstName = json['FirstName'];
//     lastName = json['LastName'];
//     organization = json['Organization'];
//     barcode = json['Barcode'];
//     sectionId = json['SectionId'];
//     showId = json['ShowId'];
//     timeId = json['TimeId'];
//     admittedOn = json['AdmittedOn'];
//     admitted = json['Admitted'];
//     sectionTitle = json['SectionTitle'];
//     rowTitle = json['RowTitle'];
//     seatTitle = json['SeatTitle'];
//     buyerFirstName = json['BuyerFirstName'];
//     buyerLastName = json['BuyerLastName'];
//     promoCode = json['PromoCode'];
//     orderId = json['OrderId'];
//     orderNumber = json['OrderNumber'];
//     isDocumentSigned = json['IsDocumentSigned'];
//     attendeeImage = json['AttendeeImage'];
//     scanCount = json['ScanCount'];
//     isSquareMerchandise = json['IsSquareMerchandise'];
//     maxUses = json['MaxUses'];
//     orderIdentifier = json['OrderIdentifier'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['Id'] = id;
//     data['FirstName'] = firstName;
//     data['LastName'] = lastName;
//     data['Organization'] = organization;
//     data['Barcode'] = barcode;
//     data['SectionId'] = sectionId;
//     data['ShowId'] = showId;
//     data['TimeId'] = timeId;
//     data['AdmittedOn'] = admittedOn;
//     data['Admitted'] = admitted;
//     data['SectionTitle'] = sectionTitle;
//     data['RowTitle'] = rowTitle;
//     data['SeatTitle'] = seatTitle;
//     data['BuyerFirstName'] = buyerFirstName;
//     data['BuyerLastName'] = buyerLastName;
//     data['PromoCode'] = promoCode;
//     data['OrderId'] = orderId;
//     data['OrderNumber'] = orderNumber;
//     data['IsDocumentSigned'] = isDocumentSigned;
//     data['AttendeeImage'] = attendeeImage;
//     data['ScanCount'] = scanCount;
//     data['IsSquareMerchandise'] = isSquareMerchandise;
//     data['MaxUses'] = maxUses;
//     data['OrderIdentifier'] = orderIdentifier;
//     return data;
//   }
// }

// class DataModel {
//   int? id;
//   String? firstName;
//   String? lastName;
//   String? organization;
//   String? barcode;
//   int? sectionId;
//   int? showId;
//   int? timeId;
//   String? admittedOn;
//   bool? admitted;
//   String? sectionTitle;
//   String? rowTitle;
//   String? seatTitle;
//   String? buyerFirstName;
//   String? buyerLastName;
//   String? promoCode;
//   int? orderId;
//   String? orderNumber;
//   bool? isDocumentSigned;
//   String? attendeeImage;
//   int? scanCount;
//   bool? isSquareMerchandise;
//   int? maxUses;
//   String? orderIdentifier;
//
//   DataModel(
//       {this.id,
//         this.firstName,
//         this.lastName,
//         this.organization,
//         this.barcode,
//         this.sectionId,
//         this.showId,
//         this.timeId,
//         this.admittedOn,
//         this.admitted,
//         this.sectionTitle,
//         this.rowTitle,
//         this.seatTitle,
//         this.buyerFirstName,
//         this.buyerLastName,
//         this.promoCode,
//         this.orderId,
//         this.orderNumber,
//         this.isDocumentSigned,
//         this.attendeeImage,
//         this.scanCount,
//         this.isSquareMerchandise,
//         this.maxUses,
//         this.orderIdentifier});
//
//
//   DataModel.fromMap(Map<String, dynamic> json) :
//     id = json['Id'],
//     firstName = json['FirstName'],
//     lastName = json['LastName'],
//     organization = json['Organization'],
//     barcode = json['Barcode'],
//     sectionId = json['SectionId'],
//     showId = json['ShowId'],
//     timeId = json['TimeId'],
//     admittedOn = json['AdmittedOn'],
//     admitted = json['Admitted'],
//     sectionTitle = json['SectionTitle'],
//     rowTitle = json['RowTitle'],
//     seatTitle = json['SeatTitle'],
//     buyerFirstName = json['BuyerFirstName'],
//     buyerLastName = json['BuyerLastName'],
//     promoCode = json['PromoCode'],
//     orderId = json['OrderId'],
//     orderNumber = json['OrderNumber'],
//     isDocumentSigned = json['IsDocumentSigned'],
//     attendeeImage = json['AttendeeImage'],
//     scanCount = json['ScanCount'],
//     isSquareMerchandise = json['IsSquareMerchandise'],
//     maxUses = json['MaxUses'],
//     orderIdentifier = json['OrderIdentifier'];
//
//
//   Map<String, dynamic> toMap() {
//     //final Map<String, dynamic> data = Map<String, dynamic>();
//     return {
//     'Id' : id,
//     'FirstName' : firstName,
//     'LastName' : lastName,
//     'Organization' : organization,
//     'Barcode' : barcode,
//     'SectionId' : sectionId,
//     'ShowId' : showId,
//     'TimeId' : timeId,
//     'AdmittedOn' : admittedOn,
//     'Admitted' : admitted,
//     'SectionTitle' : sectionTitle,
//    'RowTitle' : rowTitle,
//     'SeatTitle' : seatTitle,
//     'BuyerFirstName' : buyerFirstName,
//     'BuyerLastName' : buyerLastName,
//     'PromoCode' : promoCode,
//     'OrderId' : orderId,
//     'OrderNumber' : orderNumber,
//     'IsDocumentSigned' : isDocumentSigned,
//     'AttendeeImage' : attendeeImage,
//     'ScanCount' : scanCount,
//     'IsSquareMerchandise' : isSquareMerchandise,
//     'MaxUses' : maxUses,
//     'OrderIdentifier' : orderIdentifier,
//   };
//   }
// }
