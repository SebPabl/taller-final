import 'package:flutter/material.dart';
import 'package:taller_final/core/classes/attachment.class.dart';
import 'package:taller_final/core/services/attachment.service.dart';

class AttachmentListPage extends StatefulWidget {
  final int categoryId;

  const AttachmentListPage({Key? key, required this.categoryId}) : super(key: key);

  @override
  State<AttachmentListPage> createState() => _AttachmentListPageState();
}

class _AttachmentListPageState extends State<AttachmentListPage> {
  final AttachmentService _attachmentService = AttachmentService();
  late Future<List<Attachment>> _futureAttachments;

  @override
  void initState() {
    super.initState();
    _futureAttachments = _attachmentService.getAttachments(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attachments'),
      ),
      body: Center(
        child: FutureBuilder<List<Attachment>>(
          future: _futureAttachments,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text('No attachments found');
            } else {
              List<Attachment> attachments = snapshot.data!;
              return ListView.builder(
                itemCount: attachments.length,
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    onPressed: () {
                      // Acción al presionar el botón
                      print('Button ${attachments[index].name} pressed');
                    },
                    child: Text(attachments[index].name),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
