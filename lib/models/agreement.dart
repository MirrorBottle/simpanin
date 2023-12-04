import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:simpanin/models/mailbox.dart';

class AgreementModel {
  String id;
  String accessCode;
  Timestamp startDate;
  Timestamp endDate;
  String note;
  String status;
  int monthlyCost;
  MailboxModel mailbox;

  AgreementModel({
    required this.id,
    required this.accessCode,
    required this.startDate,
    required this.endDate,
    required this.note,
    required this.status,
    required this.monthlyCost,
    required this.mailbox,
  });

  static Future<AgreementModel> fromFirestore(DocumentSnapshot doc) async {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    DocumentSnapshot mailbox = await data['mailbox'].get();
    return AgreementModel(
      id: doc.id,
      accessCode: data['access_code'],
      startDate: data['start_date'],
      endDate: data['end_date'],
      note: data['note'],
      status: data['status'],
      monthlyCost: data['monthly_cost'],
      mailbox: MailboxModel.fromFirestore(mailbox)
    );
  }

  factory AgreementModel.fromFuture(DocumentSnapshot doc, DocumentSnapshot mailbox) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return AgreementModel(
      id: doc.id,
      accessCode: data['access_code'],
      startDate: data['start_date'],
      endDate: data['end_date'],
      note: data['note'],
      status: data['status'],
      monthlyCost: data['monthly_cost'],
      mailbox: MailboxModel.fromFirestore(mailbox)
    );
  }

  String get formattedEndDate {
    return DateFormat('d MMM').format(endDate.toDate());
  }
}