

import 'package:drive_poc/core/states/selected_active_symbol/selected_symbol_cubit.dart';
import 'package:drive_poc/features/ticks/presentation/widgets/symbol_detail.dart';
import 'package:drive_poc/features/ticks/states/ticks_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deriv_bloc_manager/manager.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Available contract list widget tests', () {
    //Initializes cubits
    setUpAll(() {
      BlocManager.instance
          ..register(SelectSymbolCubit())
          ..register(TicksCubit());
    });

    tearDownAll(() {
      BlocManager.instance.dispose<SelectSymbolCubit>();
      BlocManager.instance.dispose<TicksCubit>();
    });

    testWidgets('Widget exist', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: SelectedSymbolDetail(),
        ),);

      await tester.idle();
      expect(find.text('Loading'), findsOneWidget);
    });
  });
}
