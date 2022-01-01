const String tableContact = 'contact';

/// Basic Info is stored for the task
class ContactFields {
  static const String id = '_id';
  static const String name = 'name';
  static const String number = 'number';
}

class ContactLocal {
  final int? id;
  final String name;
  final String number;

  const ContactLocal({this.id, required this.name, required this.number});

  Map<String, Object?> toJson() => {
        ContactFields.id: id,
        ContactFields.number: number,
        ContactFields.name: name,
      };

  ContactLocal copy({int? id, String? name, String? number}) => ContactLocal(
      id: id ?? this.id,
      name: name ?? this.name,
      number: number ?? this.number);
}
