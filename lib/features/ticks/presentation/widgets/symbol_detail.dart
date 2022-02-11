import 'package:drive_poc/core/states/selected_active_symbol/selected_symbol_cubit.dart';
import 'package:drive_poc/core/states/selected_active_symbol/selected_symbol_state.dart';
import 'package:drive_poc/features/ticks/states/ticks_cubit.dart';
import 'package:drive_poc/features/ticks/states/ticks_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deriv_bloc_manager/manager.dart';

///name and price for selected symbol widget
class SelectedSymbolDetail extends StatefulWidget {
  /// Initializes
  const SelectedSymbolDetail({Key? key}) : super(key: key);

  @override
  State<SelectedSymbolDetail> createState() => _SelectedSymbolDetailState();
}

class _SelectedSymbolDetailState extends State<SelectedSymbolDetail> {
  late final SelectSymbolCubit _selectedSymbolCubit;
  late final TicksCubit _ticksCubit;

  @override
  void initState() {
    BlocManager.instance.register(TicksCubit());
    _selectedSymbolCubit = BlocManager.instance.fetch<SelectSymbolCubit>();
    _ticksCubit = BlocManager.instance.fetch<TicksCubit>();
    super.initState();
  }
  @override
  void dispose() {
    BlocManager.instance.dispose<TicksCubit>();
    BlocManager.instance.dispose<SelectSymbolCubit>();
    super.dispose();
  }

  Widget _priceWidget()=> BlocBuilder<TicksCubit,
        TicksState>(
      bloc: _ticksCubit,
      builder:  (BuildContext context, TicksState state){
        if(state is TicksLoaded){
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Expanded(child: Text('Price')),
              Expanded(child: Text('${state.tick?.quote??0.0}'))
            ],
          );
        }else {
          return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget> [
                Expanded(child: Text('Price')),
              ]
          );
        }
      },
    );
  @override
  Widget build(BuildContext context) => BlocBuilder<SelectSymbolCubit,
        SelectedSymbolState>(
      bloc: _selectedSymbolCubit,
      builder: (BuildContext context, SelectedSymbolState state) {
        if(state is SelectSymbolChangeState){
          return Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Expanded(child: Text('Symbol Name')),
                  Expanded(child: Text(state.selectedActiveSymbol.symbol??''))
                ],
              ),
              const SizedBox(height: 8),
              _priceWidget()
            ],
          );
        }else{
          return const Text('Loading');
        }
      },
    );
}