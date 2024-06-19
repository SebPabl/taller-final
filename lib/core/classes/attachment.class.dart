import 'package:taller_final/core/interfaces/attachment.interface.dart';

class Attachment implements IAttachment {
  final int id;
  final String name;

  Attachment({
    required this.id,
    required this.name,
  });

  factory Attachment.fromJson(Map<String, dynamic> json) {
    return Attachment(
      id: json['Id'] ?? 0,
      name: json['Name'] ?? '',
    );
  }

  @override
  String toString() {
    return 'Attachment{id: $id, name: $name}';
  }
}
