import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled1/features/users/domain/model/user.dart';
import 'package:untitled1/features/users/presentation/user_presenter.dart';
import 'package:untitled1/features/users/presentation/user_viewmodel.dart';
import 'package:untitled1/generated/locale_keys.g.dart';
import 'package:untitled1/list_item.dart';

class UsersPage extends StatefulWidget {
  final UserPresenter _userPresenter;

  const UsersPage(this._userPresenter, {Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _HomeState();
}

class _HomeState extends State<UsersPage> {
  get onPressed => null;

  @override
  void initState() {
    super.initState();
    widget._userPresenter.getUsers();
  }

  @override
  void dispose() {
    widget._userPresenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(LocaleKeys.user_list).tr(),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: SafeArea(
        child: StreamBuilder<UserViewModel>(
          stream: widget._userPresenter.viewModelStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final state = snapshot.data;
              if (state is UserViewModelLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is UserViewModelError) {
                return Center(
                    child: const Text(LocaleKeys.user_list_error).tr());
              }
              if (state is UserViewModelContent) {
                final List<User> users = state.users;
                if (users.isEmpty) {
                  return Center(
                      child: const Text(LocaleKeys.user_list_no_users).tr());
                } else {
                  return ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        return ListItem(user: users[index], delete: () {});
                      });
                }
              }
            }
            return Center(
                child: const Text(LocaleKeys.user_list_no_users).tr());
          },
        ),
      ),
    );
  }
}
