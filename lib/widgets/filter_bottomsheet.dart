import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist_contact_app/blocs/users_bloc.dart';
import 'package:watchlist_contact_app/blocs/users_event.dart';

class FilterBottomSheet extends StatelessWidget {

  int selectedTabIndex;

  FilterBottomSheet({required this.selectedTabIndex, super.key});

  //final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Sorting',
                  style: TextStyle(fontSize: 20),
                ),
                ElevatedButton(
                    onPressed: () {
                      //  context.read<NotesBloc>().add(SaveEvent(noteModel: NoteModel(note: _titleController.text),),);
                      Navigator.pop(context);
                    },
                    child: const Text('Done')),
              ],
            ),

            const SizedBox(
              height: 10,
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Alphabetically', style: TextStyle(fontSize: 18),),
                GestureDetector(
                  onTap: () {
                     print('A -> Z...');
                  },
                  child: const Row(
                    children: [
                      Text('A',style: TextStyle(fontSize: 18)),
                      Icon(Icons.arrow_downward),
                      Text('Z',style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                     print('Z -> A...');
                  },
                  child: const Row(
                    children: [
                      Text('Z', style: TextStyle(fontSize: 18),),
                      Icon(Icons.arrow_downward),
                      Text('A', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox( height: 10, ),
            const Divider(color: Colors.black, height: 20, thickness: 0.8,), //indent: 10, endIndent: 20,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('User Id', style: TextStyle(fontSize: 18),),
                SizedBox(
                
                  width: 50,
                  child: GestureDetector(
                    onTap: () {
                      print('0 -> 9...');
                       context.read<UsersBloc>().add(SortEvent(selectedTabIndex: selectedTabIndex, sortType: 'asc'));
                       Navigator.pop(context);
                    },
                    child: const Row(
                      children: [
                        Text('0',style: TextStyle(fontSize: 18)),
                        Icon(Icons.arrow_downward),
                        Text('9',style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                     print('9 -> 0...');
                     context.read<UsersBloc>().add(SortEvent(selectedTabIndex: selectedTabIndex, sortType: 'dsc'));
                     Navigator.pop(context);
                  },
                  child: const Row(
                    children: [
                    
                      Text('9', style: TextStyle(fontSize: 18),),
                      Icon(Icons.arrow_downward),
                      Text('0', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox( height: 15),
            const Divider(color: Colors.black, height: 20, thickness: 0.8,), 
          ],
        ),
      ),
    );
  }
}
