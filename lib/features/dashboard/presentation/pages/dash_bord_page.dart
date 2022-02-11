import 'package:drive_poc/features/active_symbols/presentation/widgets/active_symbol_dropdown.dart';
import 'package:drive_poc/features/available_contracts/presentation/widgets/availabel_contract_list.dart';
import 'package:drive_poc/features/ticks/presentation/widgets/symbol_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Home page where all component are integrate [ActiveSymbolsDropDown],
///[SelectedSymbolDetail],[AvailableContractList]
class DashboardPage extends StatefulWidget{
  /// Dashboard Page route name.
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
        children: const<Widget> [
          ActiveSymbolsDropDown(),
          SizedBox(height: 8,),
          SelectedSymbolDetail(),
          SizedBox(height: 8,),
          Expanded(child: AvailableContractList())
        ],
      )
  );
}


