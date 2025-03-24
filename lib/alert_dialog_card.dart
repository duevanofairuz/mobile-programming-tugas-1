import 'package:flutter/material.dart';

class AlertDialogCard extends StatelessWidget {
  final String title;
  final TextEditingController subjectController;
  final TextEditingController textController;
  final VoidCallback onConfirm;
  final String confirmText;
  final String cancelText;

  const AlertDialogCard({
    super.key,
    required this.title,
    required this.subjectController,
    required this.textController,
    required this.onConfirm,
    this.confirmText = "Simpan",
    this.cancelText = "Batal",
  });

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title: Text(title, style: TextStyle(color: Colors.white),),
      backgroundColor: Colors.grey[900],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: subjectController,
            cursorColor: Colors.amber,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: "Subject",
              labelStyle: TextStyle(color: Colors.white),
              hintStyle: TextStyle(color: Colors.white),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          SizedBox(height: 12,),
          TextField(
            controller: textController,
            cursorColor: Colors.amber,
            style: TextStyle(color: Colors.white),
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            minLines: 2,
            maxLines: 10,
            decoration: InputDecoration(
              labelText: "Text",
              labelStyle: TextStyle(color: Colors.white,),

              hintStyle: TextStyle(color: Colors.white),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(cancelText, style: TextStyle(color: Colors.amber),),
        ),
        TextButton(
          onPressed: () {
            onConfirm.call();
            Navigator.pop(context);
          },
          child: Text(confirmText, style: TextStyle(color: Colors.amber),),
        ),
      ],
    );
  }
}
