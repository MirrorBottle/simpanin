import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class MailboxModel {
  String id;
  String code;
  int price;
  String size;
  bool availability;

  MailboxModel({
    required this.id,
    required this.code,
    required this.price,
    required this.size,
    required this.availability,
  });

  factory MailboxModel.fromJson(Map<String, dynamic> _json) {
    return MailboxModel(
      id: _json['id'],
      code: _json['code'],
      price: _json['price'],
      size: _json['size'],
      availability: _json['availability'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'code': code,
      'price': price,
      'size': size,
      'availability': availability,
    };
  }

  factory MailboxModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return MailboxModel(
      id: doc.id,
      code: data['code'],
      price: data['price'],
      size: data['size'],
      availability: data['availability'] ?? false,
    );
  }

  String get formattedPrice {
    final currencyFormat = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');
    return currencyFormat.format(price);
  }
}
