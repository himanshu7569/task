const String tableSMS = 'sms';

class SMSFields {
  static const String id = '_id';
  static const String phone = 'phone';
  static const String sms = 'sms';
}

class SMS {
  final int? id;
  final String phone;
  final String sms;

  const SMS({this.id, required this.phone, required this.sms});

  Map<String, Object?> toJson() => {
        SMSFields.id: id,
        SMSFields.phone: phone,
        SMSFields.sms: sms,
      };

  SMS copy({int? id, String? phone, String? sms}) =>
      SMS(id: id ?? this.id, phone: phone ?? this.phone, sms: sms ?? this.sms);
}
