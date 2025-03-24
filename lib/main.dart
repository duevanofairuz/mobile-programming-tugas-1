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
              return AlertDialog(
                title: Text("Add Note", style: TextStyle(color: Colors.white),),
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
                    child: Text("Batal", style: TextStyle(color: Colors.amber),),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        notes.add(Note(subject: subjectController.text, text: textController.text));
                      });
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Note added!'),
                          action: SnackBarAction(
                            label: 'Ok',
                            onPressed: () {
                              // Code to execute.
                            },
                          ),
                        ),
                      );
                    },
                    child: Text("Simpan", style: TextStyle(color: Colors.amber),),
                  ),
                ],
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
                        return AlertDialog(
                          title: Text("Edit Note", style: TextStyle(color: Colors.white),),
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
                              child: Text("Batal", style: TextStyle(color: Colors.amber),),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  note.subject = subjectController.text;
                                  note.text = textController.text;
                                });
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text('Change saved!'),
                                    action: SnackBarAction(
                                      label: 'Ok',
                                      onPressed: () {
                                        // Code to execute.
                                      },
                                    ),
                                  ),
                                );
                              },
                              child: Text("Simpan", style: TextStyle(color: Colors.amber),),
                            ),
                          ],
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


