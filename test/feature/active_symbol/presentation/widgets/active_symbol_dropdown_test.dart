import 'package:drive_poc/core/states/active_symbol/active_symbols_cubit.dart';
import 'package:drive_poc/core/states/selected_active_symbol/selected_symbol_cubit.dart';
import 'package:drive_poc/features/active_symbols/presentation/widgets/active_symbol_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/connection_information.dart';
import 'package:flutter_deriv_api/state/connection/connection_cubit.dart';
import 'package:flutter_deriv_bloc_manager/manager.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Active symbol widget tests', () {
    //Initializes cubits
    setUpAll(() {
      BlocManager.instance
        ..register(ConnectionCubit(
            ConnectionInformation(brand: '', appId: '', endpoint: ''),
            isMock: true))
        ..register(ActiveSymbolCubit())
        ..register(SelectSymbolCubit());
    });

    tearDownAll(() {
      BlocManager.instance.dispose<ConnectionCubit>();
      BlocManager.instance.dispose<ActiveSymbolCubit>();
      BlocManager.instance.dispose<SelectSymbolCubit>();

    });
    testWidgets('Widget exist', (WidgetTester tester) async {
      await tester.pumpWidget(const _TestApp(
          child: ActiveSymbolsDropDown()
      ));
      await tester.idle();
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('active_symbol')), findsOneWidget);
      expect(find.byKey(const Key('drop_down')), findsOneWidget);
    });
  });

}


class _TestApp extends StatelessWidget {
  const _TestApp({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) =>
      MaterialApp(home: Scaffold(body: child));
}