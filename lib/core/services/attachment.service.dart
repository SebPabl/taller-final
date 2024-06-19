import 'dart:convert';
import 'package:taller_final/core/classes/attachment.class.dart';
import 'package:taller_final/core/client/http_custom.client.dart';

class AttachmentService {
  final String apiUrl = "https://stslab.qhanati.com/websda/api";
  final HttpClient httpClient = HttpClient();

  Future<List<Attachment>> getAttachments(int categoryId) async {
    var url = Uri.parse('$apiUrl/sda/getAttachment/$categoryId');

    final response = await httpClient.post(url);
    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      List<Attachment> attachments = jsonData.map((json) => Attachment.fromJson(json)).toList();
      return attachments;
    } else {
      throw Exception('Failed to load attachments');
    }
  }
}
