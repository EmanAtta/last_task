import 'package:application_2/models/user_model.dart';
import 'package:application_2/services/user_service.dart';
import 'package:application_2/views/users_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class main_screen extends StatefulWidget {
  const main_screen({super.key});

  @override
  State<main_screen> createState() => _main_screenState();
}

class _main_screenState extends State<main_screen> {
  @override
  /*void initState() {
    super.initState();
    getAllData();
  }*/

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersCubit(),
      child: BlocConsumer<UsersCubit, UsersState>(
        builder: (context, state) {
          if (state is UsersLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UsersSuccess) {
            return ListView.builder(
              itemCount: context.watch<UsersCubit>().AllData.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Text(
                      context.watch<UsersCubit>().AllData[index].id.toString()),
                  title: Text(
                      context.watch<UsersCubit>().AllData[index].title ?? '--'),
                  subtitle: Text(context
                      .watch<UsersCubit>()
                      .AllData[index]
                      .completed
                      .toString()),
                );
              },
            );
          } else {
            return Center(
              child: Text('Error in this page'),
            );
          }
        },
        listener: (context, state) {
          if (state is UsersError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('hellow we have error'),
            ));
          }
        },
      ),
    );
  }
}
/*
isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: AllData.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Text(AllData[index].id.toString()),
                title: Text(AllData[index].title ?? '--'),
                subtitle: Text(AllData[index].completed.toString()),
              );
            },
          );
 */
