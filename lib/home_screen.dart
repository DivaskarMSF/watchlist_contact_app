import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:watchlist_contact_app/blocs/users_bloc.dart';
import 'package:watchlist_contact_app/blocs/users_event.dart';
import 'package:watchlist_contact_app/blocs/users_state.dart';
import 'package:watchlist_contact_app/model/user_model.dart';
import 'package:watchlist_contact_app/repo/repositories.dart';
import 'package:watchlist_contact_app/widgets/filter_bottomsheet.dart';

class HomeScreen extends StatefulWidget {
 int selectedTabIndex;

 HomeScreen({required this.selectedTabIndex, super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          
          title: const Row(
            children: [
              Icon(Icons.person),
              SizedBox(width: 10,),
               Text(
                'Contact List',
              ),
            ],
          ),
          automaticallyImplyLeading: false,
          bottom:  TabBar(
            onTap: (index) {
              widget.selectedTabIndex = index;
            
              print('selected tab: ${widget.selectedTabIndex}');
            },
            tabs: const [
            Tab(text: 'Tab1'),
            Tab(text: 'Tab2'),
            Tab(text: 'Tab3'),
            Tab(text: 'Tab4'),
          ]),
        ),
        body: BlocBuilder<UsersBloc, UsersState>(
          builder: (context, state) {
            if (state is UserLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is UserLoadedState) {
              List<List<UserModel>> splittedUser = state.splittedUser;

              var listOfWidgets = blocBody(splittedUser);
              return TabBarView(children: listOfWidgets);
            }

              if (state is SortState) {
              List<List<UserModel>> splittedUser = state.splittedUser;

              var listOfWidgets = blocBody(splittedUser);
              return TabBarView(children: listOfWidgets);
            }
            
            return Container();
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.filter,
            size: 32,
          ),
          onPressed: () async {
            showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                builder: (ctx) => FilterBottomSheet(selectedTabIndex: widget.selectedTabIndex,));
            //controller.animateTo(2);
          },
        ),
      ),
    );
  }



  List<Widget> blocBody(List<List<UserModel>> splittedUser) {
  
    return splittedUser.map((element) {

       return ListView.builder(
        itemCount: element.length,
        shrinkWrap: true,
        itemBuilder: (_, index) {

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Card(
              color: Colors.white, //Theme.of(context).primaryColor,
              child: ListTile(
                title: Text(
                  '${element[index].name}', // name
                  style: const TextStyle(color: Colors.black),
                ),
                subtitle: Row(
                  children: [
                    const Icon(Icons.phone, size: 25),
                    Text('${element[index].contacts}', style: const TextStyle(color: Colors.black)),
                  ],
                ),

                trailing: Text('${element[index].id}', style: const TextStyle(color: Colors.black), ),
               // trailing: CircleAvatar(backgroundImage: NetworkImage(element[index].iconUrl ?? ''),),
              ),
            ),
          );
        });

    }).toList();

  }
}


