import 'package:flutter/material.dart';
import 'note.dart';

class NoteCard extends StatelessWidget {
  // const QuoteCard({
  //   super.key,
  // });

  final Note note;
  final VoidCallback? delete;
  final VoidCallback? edit;
  const NoteCard({super.key, required this.note, required this.delete, required this.edit});

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
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
              minLines: 1,
              maxLines: 8,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8.0,),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: Text("Delete this note?", style: TextStyle(color: Colors.white),),
                          backgroundColor: Colors.grey[900],
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("No", style: TextStyle(color: Colors.amber),),
                            ),
                            TextButton(
                              onPressed: () {
                                delete?.call();
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text('Note deleted!'),
                                    action: SnackBarAction(
                                      label: 'Ok',
                                      onPressed: () {
                                        // Code to execute.
                                      },
                                    ),
                                  ),
                                );
                              },
                              child: Text("Yes", style: TextStyle(color: Colors.amber),),
                            ),
                          ],
                        );
                      }
                    );
                  },
                  icon: Icon(Icons.delete, color: Colors.redAccent,),
                  label: Text("Hapus", style: TextStyle(fontSize: 18, color: Colors.white),),
                ),
                TextButton.icon(
                  onPressed: edit,
                  icon: Icon(Icons.edit, color: Colors.amber,),
                  label: Text("Edit", style: TextStyle(fontSize: 18, color: Colors.white),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}