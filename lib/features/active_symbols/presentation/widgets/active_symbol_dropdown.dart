import 'package:drive_poc/core/states/active_symbol/active_symbols_cubit.dart';
import 'package:drive_poc/core/states/active_symbol/active_symbols_state.dart';
import 'package:drive_poc/core/states/selected_active_symbol/selected_symbol_cubit.dart';
import 'package:drive_poc/features/active_symbols/presentation/widgets/drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deriv_bloc_manager/manager.dart';

///Active symbol drop-down widget
class ActiveSymbolsDropDown extends StatefulWidget {
  ///Initializes  active symbols dropDown
  const ActiveSymbolsDropDown({Key? key}) : super(key: key);

  @override
  State<ActiveSymbolsDropDown> createState() => _ActiveSymbolsDropDownState();
}

class _ActiveSymbolsDropDownState extends State<ActiveSymbolsDropDown> {
  late final ActiveSymbolCubit _activeSymbolCubit;
  late final SelectSymbolCubit _selectedSymbolCubit;

  @override
  void initState() {
    _activeSymbolCubit =
        BlocManager.instance.fetch<ActiveSymbolCubit>();
    _selectedSymbolCubit = BlocManager.instance.fetch<SelectSymbolCubit>();
    _activeSymbolCubit.fetchActiveSymbols();
    super.initState();
  }

  @override
  void dispose() {
    BlocManager.instance.dispose<ActiveSymbolCubit>();
    BlocManager.instance.dispose<SelectSymbolCubit>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<ActiveSymbolCubit,
      ActiveSymbolState>(
      bloc: _activeSymbolCubit,
      builder: (BuildContext context, ActiveSymbolState state) {
        if (state is ActiveSymbolLoadedState) {
          return Column(
            key: const Key('active_symbol'),
            children: <Widget>[
              DropDownMenu(
                key: const Key('drop_down'),
                items: state.activeSymbols,
                initialItem: state.activeSymbols[0],
                onItemSelected: <ActiveSymbol>(dynamic item) {
                  _selectedSymbolCubit.selectActiveSymbol(item);
                },
              )
            ],
          );
        }else if(state is ActiveSymbolErrorState){
          return Center(child: Text(state.errorMessage));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }
  );
}