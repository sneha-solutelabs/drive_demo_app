

import 'package:bloc_test/bloc_test.dart';
import 'package:drive_poc/core/states/selected_active_symbol/selected_symbol_cubit.dart';
import 'package:drive_poc/core/states/selected_active_symbol/selected_symbol_state.dart';
import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/common/active_symbols/active_symbols.dart';
import 'package:flutter_deriv_bloc_manager/bloc_managers/bloc_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../sunc_time/sync_time_cubit.dart';
import 'selected_active_symbol_data.dart';

class MockSelectedSymbolCubit extends MockCubit<SelectedSymbolState>
    implements SelectSymbolCubit {}

class MockSyncTimeCubit extends MockCubit<SyncTimeState>
    implements SyncTimeCubit {
  @override
  DateTime get now => DateTime.now();
}

class FakeSelectedSymbolState extends Fake implements SelectedSymbolState {}

class FakeSyncTimeState extends Fake implements SyncTimeState {}


void main() {
  setUpAll(() {
    registerFallbackValue(FakeSelectedSymbolState());
    registerFallbackValue(FakeSyncTimeState());

    BlocManager.instance.register<SyncTimeCubit>(MockSyncTimeCubit());
    APIInitializer().initialize(isMock: true);
  });

  group('Selected symbols cubit test =>', () {
    test('selected symbols. change', () async {
      final MockSelectedSymbolCubit activeSymbolCubit = MockSelectedSymbolCubit();

      whenListen(
          activeSymbolCubit,
          Stream<SelectedSymbolState>.fromIterable(<SelectedSymbolState>[
            SelectedSymbolInitialState(),
            SelectSymbolChangeState(selectedActiveSymbol: selectedActiveSymbol),
          ]));

      await expectLater(
          activeSymbolCubit.stream,
          emitsInOrder(<dynamic>[
            isA<SelectedSymbolInitialState>(),
            isA<SelectSymbolChangeState>(),
          ]));

      expect((activeSymbolCubit.state as SelectSymbolChangeState), isA<SelectSymbolChangeState>());

      expect((activeSymbolCubit.state as SelectSymbolChangeState).selectedActiveSymbol, isA<ActiveSymbol>());
    });
  });
}