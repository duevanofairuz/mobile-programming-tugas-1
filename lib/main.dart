import 'package:flutter/material.dart';
import 'note.dart';
import 'note_card.dart';
import 'alert_dialog_card.dart';

void main() {
  runApp(const MaterialApp(
    home: HomeStateful(),
  ));
}

class HomeStateful extends StatefulWidget {
  const HomeStateful({super.key});

  @override
  State<HomeStateful> createState() => _HomeStatefulState();
}

class _HomeStatefulState extends State<HomeStateful> {
  int count = 0;

  List<Note> notes = [
    Note(subject: "produktivitas?", text: "jika kamu mengukur nilai produktifitas hanya dari berapa kerjaan yang berhasil terselesaikan maka dirimu akan selalu merasa worthless, (ibarat mountain without summit), "),
    Note(subject: "lessons", text: "if you determine your self worth by how much you get done, you will be forever worthless"),
    Note(subject: "whys?", text: "terus menerus mempertanyakan pemikiran kita sendiri pasti sangat melelahkan"),
    Note(subject: "malas", text: "ada yang namanya fase produktif dan fase kreatif/malas, dengan menerima fase kreatif kita bisa lebih tenang dan berpikir lebih jernih ketika kembali ke fase produktif"),
    Note(subject: "gila kerja", text: "kerja keras itu tidak ada artinya jika kita kehilangan diri kita di dalam proses nya"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        // title: Text('Keepnote', style: TextStyle(color: Colors.white),),
        title: TextButton.icon(
          onPressed: () {},
          label: Text('Keepnote', style: TextStyle(color: Colors.white, fontSize: 24),),
          icon: Icon(Icons.note_add, size: 24, color: Colors.amber,),
        ),
        backgroundColor: Colors.grey[800],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        foregroundColor: Colors.white,
        shape: CircleBorder(),
        onPressed: () {
          final subjectController = TextEditingController(text: "");
          final textController = TextEditingController(text: "");

          showDialog(
            context: context,
            builder: (context){
              return AlertDialogCard(
                title: "Add Note",
                subjectController: subjectController,
                textController: textController,
                confirmText: "Save",
                cancelText: "Cancel",
                onConfirm: () {
                  setState(() {
                    notes.add(Note(subject: subjectController.text, text: textController.text));
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Note Added!'),
                      action: SnackBarAction(
                        label: 'Ok',
                        onPressed: () {
                          // Code to execute.
                        },
                      ),
                    ),
                  );
                }
              );
            }
          );
        },
        tooltip: "tambahkan notes",
        child: Icon(Icons.note_add_outlined),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: notes.map((note) => NoteCard(
                  note: note,
                  delete: () {
                    setState(() {
                      notes.remove(note);
                    });
                  },
                  edit: () {
                    // Buat controller yang diisi dengan data awal
                    final subjectController = TextEditingController(text: note.subject);
                    final textController = TextEditingController(text: note.text);

                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialogCard(
                          title: "Edit Note",
                          subjectController: subjectController,
                          textController: textController,
                          confirmText: "Save",
                          cancelText: "Cancel",
                          onConfirm: () {
                            setState(() {
                              note.subject = subjectController.text;
                              note.text = textController.text;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text('Changes Saved!'),
                                action: SnackBarAction(
                                  label: 'Ok',
                                  onPressed: () {
                                    // Code to execute.
                                  },
                                ),
                              ),
                            );
                          }
                        );
                      },
                    );
                  },
                )).toList(),
              ),
              SizedBox(height: 60,)
            ],
          ),
        ),
      ),
    );
  }
}


