import 'package:drive_poc/core/presentation/widgets/drop_down.dart';
import 'package:drive_poc/core/states/active_symbol/active_symbols_cubit.dart';
import 'package:drive_poc/core/states/active_symbol/active_symbols_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deriv_bloc_manager/manager.dart';


class ActiveSymbolsDropDown extends StatefulWidget {
  const ActiveSymbolsDropDown({Key? key}) : super(key: key);

  @override
  State<ActiveSymbolsDropDown> createState() => _ActiveSymbolsDropDownState();
}

class _ActiveSymbolsDropDownState extends State<ActiveSymbolsDropDown> {
  late final ActiveSymbolCubit _activeSymbolCubit;
  List<String> labels = ["sneha","Dhyey","jay"];
  @override
  void initState() {
    // BlocManager.instance.register(ActiveSymbolCubit());
    _activeSymbolCubit =
        BlocManager.instance.fetch<ActiveSymbolCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<ActiveSymbolCubit,
    ActiveSymbolState>(
    bloc: _activeSymbolCubit,
      builder: (BuildContext context, ActiveSymbolState state) {
        if (state is ActiveSymbolLoadedState) {
          return Column(
            children: [
              DropDownMenu<String?>(
                items: state.activeSymbols?.map((e) => e.displayName).toList(),
                initialItem: state.activeSymbols?[0].displayName,
                onItemSelected: <String>(dynamic item) {

                },
              ),
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