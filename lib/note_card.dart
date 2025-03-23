import 'package:flutter/material.dart';
import 'note.dart';

class NoteCard extends StatelessWidget {
  // const QuoteCard({
  //   super.key,
  // });

  final Note note;
  final VoidCallback? delete;
  const NoteCard({super.key, required this.note, required this.delete});

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      // margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
      color: Colors.grey[900],
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SelectableText(
              note.subject,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6.0,),
            SelectableText(
              note.text,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8.0,),
            TextButton.icon(
              onPressed: delete,
              icon: Icon(Icons.delete, color: Colors.red,),
              label: Text("Hapus", style: TextStyle(fontSize: 18, color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}