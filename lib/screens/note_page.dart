import 'package:flutter/material.dart';


class NotePage extends StatefulWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final List<String> _savedNotes = [];
  String _currentNote = '';

  void _saveNote() {
    if (_currentNote.isNotEmpty) {
      setState(() {
        _savedNotes.add(_currentNote);
        _currentNote = '';
      });
    }
  }

  void _deleteNoteAt(int index) {
    setState(() {
      _savedNotes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.primaryColor;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your note here...',
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              style: theme.textTheme.headline6,
              maxLines: null,
              onChanged: (text) {
                setState(() {
                  _currentNote = text;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _saveNote,
              child: Text('Save Note'),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
            SizedBox(height: 8),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text(
            'Swipe left to delete',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
             ),
            ),
            ],
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: _savedNotes.length,
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                    key: Key(_savedNotes[index]),
                    onDismissed: (direction) {
                      _deleteNoteAt(index);
                    },
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      color: Colors.red,
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(_savedNotes[index]),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
