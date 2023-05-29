import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist_contact_app/blocs/users_event.dart';
import 'package:watchlist_contact_app/blocs/users_state.dart';
import 'package:watchlist_contact_app/model/user_model.dart';
import 'package:watchlist_contact_app/repo/repositories.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UserRepository _userRepository;
  List<List<UserModel>>? _splitedUsers;
  
  UsersBloc(this._userRepository) : super(UserLoadingState()) {
    on<LoadUsersEvent>((event, emit) async {
      emit(UserLoadingState());

      try {
        final users = await _userRepository.getUsers();

        _splitedUsers = seperateUsers(users);
        emit(UserLoadedState(_splitedUsers ?? []));
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }
    });

    on<SortEvent>((event, emit) {
      sortUsers(event.selectedTabIndex, event.sortType);
      emit(UserLoadedState(_splitedUsers ?? []));
      emit(SortState(_splitedUsers ?? []));
    });
  }

  void sortUsers(int selectedTabIndex, String sortType) {

    // someObjects.sort((a, b) => a.someProperty.compareTo(b.someProperty));
    if (_splitedUsers != null) {
       if (sortType == 'asc') {
           List<UserModel> sortedSingleTabList = _splitedUsers![selectedTabIndex];
          // sortedSingleTabList.sort((a, b) => a.id.compareTo(b.id));
          sortedSingleTabList.sort((a, b) => int.parse(a.id).compareTo(int.parse(b.id)));
          _splitedUsers![selectedTabIndex] = sortedSingleTabList;
      }
      else if (sortType == 'dsc') {
           List<UserModel> sortedSingleTabList = _splitedUsers![selectedTabIndex];
          // sortedSingleTabList.sort((b, a) => a.id.compareTo(b.id));
           sortedSingleTabList.sort((b, a) => int.parse(a.id).compareTo(int.parse(b.id)));

          _splitedUsers![selectedTabIndex] = sortedSingleTabList;

      }
   
    }
  }

  List<List<UserModel>> seperateUsers(List<UserModel> users) {
    final List<List<UserModel>> splitedUsers = [];
    for (int i = 0; i < users.length; i = i + 30) {
      // print(i);

      final start = i;
      var end = i + 30;
      if (end > users.length) {
        end = users.length;
      }
      print('start: $i');
      print('end: $end');
      print('----------');
      final sublist = users.sublist(start, end);
      splitedUsers.add(sublist);
    }

    return splitedUsers;
  }
}
