import 'package:drive_poc/features/active_symbols/presentation/widgets/active_symbol_dropdown.dart';
import 'package:drive_poc/features/available_contracts/presentation/widgets/availabel_contract_list.dart';
import 'package:drive_poc/features/ticks/presentation/widgets/symbol_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget{
  const DashboardPage({Key? key}) : super(key: key);
  static const String routeName = 'dashboard_page';

  @override
  State<StatefulWidget> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: const [
          ActiveSymbolsDropDown(),
          SizedBox(height: 8,),
          SelectedSymbolDetail(),
          SizedBox(height: 8,),
          Expanded(child: AvailableContractList())
        ],
      )
  );
}


