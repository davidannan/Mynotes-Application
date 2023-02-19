import 'package:flutter/material.dart';
import 'package:mynotes/services/crud/notes_services.dart';

typedef DeleteNoteCallback = void Function(DatabaseNote note);

class NotesListView extends StatelessWidget {

final List<DatabaseNote> notes;

  const NotesListView({super.key, required this.notes, required this.onDeleteNote});
final DeleteNoteCallback onDeleteNote;
  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}