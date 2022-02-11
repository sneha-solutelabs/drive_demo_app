import 'package:drive_poc/features/available_contracts/presentation/widgets/availabel_contract_list.dart';
import 'package:drive_poc/features/available_contracts/states/available_contracts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deriv_bloc_manager/manager.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Available contract list widget tests', () {
    //Initializes cubits
    setUpAll(() {
      BlocManager.instance
          .register(AvailableContractCubit());
    });

    tearDownAll(() {
      BlocManager.instance.dispose<AvailableContractCubit>();
    });

    testWidgets('Widget work', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AvailableContractList(),
        ),);

      await tester.idle();
      expect(find.byKey(const Key('builder')), findsOneWidget);
      expect(find.byKey(const Key('progress')), findsOneWidget);
    });
  });
}

