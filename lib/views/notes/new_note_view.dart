import 'package:flutter/material.dart';
import 'package:mynotes/services/crud/notes_services.dart';

class NewNoteView extends StatefulWidget {
  const NewNoteView({super.key});

  @override
  State<NewNoteView> createState() => _NewNoteViewState();
}

class _NewNoteViewState extends State<NewNoteView> {

DatabaseNote? _note;
late final NotesService _notesService;
late final TextEditingController _textController;

Future<DatabaseNote> createNewNote() async{
  final existingNote = _note;
  if (existingNote != null) {
    return existingNote;
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Note')
      ),
      body: const Text('Write your note here')
    );
  }
}