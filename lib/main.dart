import 'package:flutter/material.dart';
import 'note.dart';
import 'note_card.dart';

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
    Note(subject: "ide2 konyol", text: "jika kamu mengukur nilai produktifitas hanya dari berapa kerjaan yang berhasil terselesaikan maka dirimu akan selalu merasa worthless, (ibarat mountain without summit), "),
    Note(subject: "lessons", text: "if you determine your self worth by how much you get done, you will be forever worthless"),
    Note(subject: "whys?", text: "terus menerus mempertanyakan pemikiran kita sendiri pasti sangat melelahkan"),
    Note(subject: "whys?", text: "terus menerus mempertanyakan pemikiran kita sendiri pasti sangat melelahkan"),
    Note(subject: "whys?", text: "terus menerus mempertanyakan pemikiran kita sendiri pasti sangat melelahkan"),
  ];

  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

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
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text that the user has entered by using the
                // TextEditingController.
                content: Text(myController.text),
              );
            },
          );
        },
        tooltip: 'Show me the value!',
        child: const Icon(Icons.text_fields),
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
                        return AlertDialog(
                          title: Text("Edit Note"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                controller: subjectController,
                                decoration: InputDecoration(labelText: "Subject"),
                              ),
                              TextField(
                                controller: textController,
                                decoration: InputDecoration(labelText: "Text"),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Batal"),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  note.subject = subjectController.text;
                                  note.text = textController.text;
                                });
                                Navigator.pop(context);
                              },
                              child: Text("Simpan"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                )).toList(),
              ),
              TextField(
                controller: myController,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


