import 'package:drive_poc/features/available_contracts/states/available_contracts_cubit.dart';
import 'package:drive_poc/features/available_contracts/states/available_contracts_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deriv_api/api/contract/models/available_contract_model.dart';
import 'package:flutter_deriv_bloc_manager/manager.dart';

///Available contract list widget
class AvailableContractList extends StatefulWidget {
  ///Initializes
  const AvailableContractList({Key? key}) : super(key: key);

  @override
  State<AvailableContractList> createState() => _AvailableContractList();
}

class _AvailableContractList extends State<AvailableContractList> {
  late final AvailableContractCubit _availableContractCubit;

  @override
  void initState() {
    BlocManager.instance.register(AvailableContractCubit());
    _availableContractCubit =
        BlocManager.instance.fetch<AvailableContractCubit>();
    super.initState();
  }

  @override
  void dispose() {
    BlocManager.instance.dispose<AvailableContractCubit>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget _listWidget(AvailableContractModel? contract)=> Container(
        padding: const EdgeInsets.all(12) ,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8)
        ),
        child: Column(
          children:<Widget> [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Expanded(child: Text('Category')),
                Expanded(child: Text(contract!.contractCategory??''))
              ],
            ),
            const SizedBox(height: 4,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Expanded(child: Text('Name')),
                Expanded(child: Text(contract.exchangeName??''))
              ],
            ),
            const SizedBox(height: 4,),
            Row(
              children: <Widget>[
                const Expanded(child: Text('Market')),
                Expanded(child: Text(contract.market??''))
              ],
            ),
            const SizedBox(height: 4,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const Expanded(child: Text('SubMarket')),
                Expanded(child: Text(contract.submarket??''))
              ],
            )
          ],
        ),
      );
    
    return BlocBuilder<AvailableContractCubit,
        AvailableContractsState>(
        bloc: _availableContractCubit,
        builder: (BuildContext context, AvailableContractsState state) {
          if (state is AvailableContractsLoaded) {
            final List<AvailableContractModel?>? contracts =
                state.contracts?.availableContracts ??[];
            return ListView.builder(
              itemCount: contracts?.length,
              itemBuilder: (BuildContext context, int index) =>Padding(
                padding: const EdgeInsets.fromLTRB(0,0,0,8),
                child: _listWidget(contracts?[index]),
              ),
            );
          }else if(state is AvailableContractsError){
            return Center(child: Text(state.errorMessage));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }
    );
  }

}