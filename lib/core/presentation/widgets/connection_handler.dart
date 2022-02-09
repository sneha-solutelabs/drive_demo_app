import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_deriv_api/state/connection/connection_cubit.dart'
as connection_cubit;

import 'package:flutter_deriv_bloc_manager/manager.dart';


class ConnectionHandler extends StatefulWidget {
  /// Initializes the [ConnectionHandler] class.
  const ConnectionHandler({required this.child, Key? key}) : super(key: key);

  /// The [child] that is being wrapped by the [ConnectionHandler].
  final Widget child;

  @override
  State<ConnectionHandler> createState() => _ConnectionHandlerState();
}
class _ConnectionHandlerState extends State<ConnectionHandler> {
  late final connection_cubit.ConnectionCubit _connectionCubit;

  Future<void>? _connectionDialogState;

  @override
  void initState() {
    super.initState();

    _initializeBlocs();
  }

  @override
  Widget build(BuildContext context) => BlocListener<
      connection_cubit.ConnectionCubit, connection_cubit.ConnectionState>(
    bloc: _connectionCubit,
    listener: (_, connection_cubit.ConnectionState state) =>
        _handleConnectionState(state),
    child: widget.child,
  );

  void _handleConnectionState(connection_cubit.ConnectionState state) =>
      state is connection_cubit.ConnectionConnectedState
          ?  Container()
          : _buildCenterText('Connecting...');

  Widget _buildCenterText(String text) => Center(
    child: Text(text),
  );

  void _initializeBlocs() {
    _connectionCubit =
        BlocManager.instance.fetch<connection_cubit.ConnectionCubit>();
  }
}