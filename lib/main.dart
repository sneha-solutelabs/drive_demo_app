import 'package:drive_poc/app.dart';
import 'package:drive_poc/core/bloc_manager/state_emitters/active_symbols_state_emitter.dart';
import 'package:drive_poc/core/bloc_manager/state_emitters/connection_state_emitter.dart';
import 'package:drive_poc/core/states/active_symbol/active_symbols_cubit.dart';
import 'package:flutter/material.dart';

import 'package:flutter_deriv_api/services/connection/api_manager/connection_information.dart';
import 'package:flutter_deriv_api/state/connection/connection_cubit.dart';
import 'package:flutter_deriv_bloc_manager/manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CubitObserver();
  registerCoreBlocs();
  initializeEventDispatcher();
  runApp(const App());
}

void registerCoreBlocs() {
  BlocManager.instance
    ..register(
      ConnectionCubit(
        ConnectionInformation(
          appId: '1089',
          brand: 'binary',
          endpoint: 'frontend.binaryws.com',
        ),
      ),
    )
    ..register(ActiveSymbolCubit());
}

/// Initializes event dispatcher.
void initializeEventDispatcher() => EventDispatcher(BlocManager.instance)
  ..register<ConnectionCubit, ConnectionStateEmitter>(
        (BaseBlocManager blocManager) => ConnectionStateEmitter(blocManager),
  )
  ..register<ActiveSymbolCubit, ActiveSymbolsStateEmitter>(
        (BaseBlocManager blocManager) => ActiveSymbolsStateEmitter(blocManager),
  );





