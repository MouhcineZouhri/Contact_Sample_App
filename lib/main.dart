import 'package:contact_app/bloc/contact/contact.bloc.dart';
import 'package:contact_app/bloc/message/message.bloc.dart';
import 'package:contact_app/repository/contact.repos.dart';
import 'package:contact_app/repository/message.repos.dart';
import 'package:contact_app/ui/screens/contacts/contacts.screen.dart';
import 'package:contact_app/ui/screens/message/message.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';


void setup(){
  GetIt.instance.registerLazySingleton(() => ContactRepos());
  GetIt.instance.registerLazySingleton(() => MessageRepos());
}


void main() {
  setup();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ContactBloc(contactRepos:GetIt.instance.get<ContactRepos>())),
        BlocProvider(create: (_) => MessageBloc(messageRepos: GetIt.instance.get<MessageRepos>()))
      ],
      child: MaterialApp(
        routes:  {
          "/" : (_) => ContactScreen(),
          "/message" :(_) => MessageScreen()
        },
        theme: ThemeData(
          primarySwatch: Colors.amber
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
