import 'package:drive_poc/features/dashboard/presentation/pages/dash_bord_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deriv_api/state/connection/connection_cubit.dart'
as connection_cubit;
import 'package:flutter_deriv_bloc_manager/manager.dart';

///Connection checking screen
class AppScreen extends StatefulWidget {
  ///App screen key define
  const AppScreen({Key? key}) : super(key: key);

  ///App screen route name
  static const String routeName = 'app_screen_page';
  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  late final connection_cubit.ConnectionCubit _connectionCubit;
  @override
  void initState() {
    super.initState();
    _initializeBlocs();
  }

  @override
  void dispose() {
    BlocManager.instance.dispose<connection_cubit.ConnectionCubit>();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Drive Demo'),
    ),
    body:  BlocBuilder<connection_cubit.ConnectionCubit,
        connection_cubit.ConnectionState>(
      bloc: _connectionCubit,
      builder:  (BuildContext context,
          connection_cubit.ConnectionState state){
        if (state is connection_cubit.ConnectionConnectedState) {
          return DashboardPage();
        }else if(state is connection_cubit.ConnectionConnectingState){
          return _buildCenterText('Connecting...');
        }else if(state is connection_cubit.ConnectionErrorState){
          return _buildCenterText(state.error);
        }else{
          return _buildCenterText('Connection lost');
        }
      },
    ),
  );
  Widget _buildCenterText(String text) => Center(
    child: Text(text),
  );

  void _initializeBlocs() {
    _connectionCubit =
        BlocManager.instance.fetch<connection_cubit.ConnectionCubit>();
  }
}

