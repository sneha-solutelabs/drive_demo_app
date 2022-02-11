import 'package:drive_poc/core/states/active_symbol/active_symbols_cubit.dart';
import 'package:drive_poc/features/active_symbols/presentation/widgets/drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deriv_api/api/common/active_symbols/active_symbols.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/connection_information.dart';
import 'package:flutter_deriv_api/state/connection/connection_cubit.dart';
import 'package:flutter_deriv_bloc_manager/manager.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../core/state/active_symbol/active_symbol_cubit_data.dart';

void main() {
  group('DropDown active symbol widget tests', () {
    //Initializes cubits
    setUpAll(() {
      BlocManager.instance
        ..register(ConnectionCubit(
            ConnectionInformation(brand: '', appId: '', endpoint: ''),
            isMock: true))
        ..register(ActiveSymbolCubit());
    });

    tearDownAll(() {
      BlocManager.instance.dispose<ConnectionCubit>();
      BlocManager.instance.dispose<ActiveSymbolCubit>();
    });

    testWidgets('Widget work', (WidgetTester tester) async {
      ActiveSymbol activeSymbol = activeSymbols.first;
      await tester.pumpWidget(_TestApp(
          child: DropDownMenu(
              items: activeSymbols,
              initialItem: activeSymbol,
              onItemSelected: (ActiveSymbol item) {
                activeSymbol = item ;
              },
              key: const Key('drop down'))));

      // action checked
      expect(find.byKey(const Key('drop_down_button')), findsOneWidget);

      expect(find.text('Wall Street Index'), findsOneWidget);
      await tester.tap(find.text('Wall Street Index'));
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
      expect(activeSymbol, activeSymbols.first);

      await tester.tap(find.text('USD/CHF').last);
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
      expect(activeSymbol, activeSymbols.last);

      await tester.tap(find.text('USD/CHF').last);
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
      expect(activeSymbol, activeSymbols.last);

      await tester.tap(find.text('USD/MXN').last);
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
      expect(activeSymbol, activeSymbols[1]);

    });
  });
}

class _TestApp extends StatelessWidget {
  const _TestApp({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) =>
      MaterialApp(home: Scaffold(bottomSheet: child));
}