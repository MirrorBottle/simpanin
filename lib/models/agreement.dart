import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:simpanin/models/mailbox.dart';

class AgreementModel {
  String id;
  String accessCode;
  Timestamp startDate;
  Timestamp endDate;
  String note;
  String status;
  int totalCost;
  MailboxModel? mailbox;

  AgreementModel({
    required this.id,
    required this.accessCode,
    required this.startDate,
    required this.endDate,
    required this.note,
    required this.status,
    required this.totalCost,
    this.mailbox,
  });

  factory AgreementModel.fromFirestore(DocumentSnapshot doc) {

    return AgreementModel(
      id: doc.id,
      accessCode: doc['accessCode'],
      startDate: doc['startDate'],
      endDate: doc['endDate'],
      note: doc['note'],
      status: doc['status'],
      totalCost: doc['totalCost'],
      // other fields
    );
  }
}
