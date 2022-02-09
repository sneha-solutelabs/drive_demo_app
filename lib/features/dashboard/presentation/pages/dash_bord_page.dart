import 'package:drive_poc/features/active_symbols/presentation/widgets/active_symbol_dropdown.dart';
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
        ActiveSymbolsDropDown()
      ],
    )
  );
}


