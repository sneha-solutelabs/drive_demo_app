import 'package:drive_poc/app.dart';
import 'package:drive_poc/core/bloc_manager/state_emitters/active_symbols_state_emitter.dart';
import 'package:drive_poc/core/bloc_manager/state_emitters/connection_state_emitter.dart';
import 'package:drive_poc/core/bloc_manager/state_emitters/selected_symbol_state_emitter.dart';
import 'package:drive_poc/core/states/active_symbol/active_symbols_cubit.dart';
import 'package:drive_poc/core/states/selected_active_symbol/selected_symbol_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/connection_information.dart';
import 'package:flutter_deriv_api/state/connection/connection_cubit.dart';
import 'package:flutter_deriv_bloc_manager/manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CubitObserver();
  registerCoreBlocs();
  initializeEventDispatcher();
  runApp(App());
}

/// Registers common bloc and cubit to BlocManager
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
    ..register(ActiveSymbolCubit())
    ..register(SelectSymbolCubit());

}

/// Initializes event dispatcher.
void initializeEventDispatcher() => EventDispatcher(BlocManager.instance)
  ..register<ConnectionCubit, ConnectionStateEmitter>(
        (BaseBlocManager blocManager) => ConnectionStateEmitter(blocManager),
  )
  ..register<ActiveSymbolCubit, ActiveSymbolsStateEmitter>(
        (BaseBlocManager blocManager) => ActiveSymbolsStateEmitter(blocManager),
  )
  ..register<SelectSymbolCubit, SelectSymbolsStateEmitter>(
        (BaseBlocManager blocManager) => SelectSymbolsStateEmitter(blocManager),
  );





