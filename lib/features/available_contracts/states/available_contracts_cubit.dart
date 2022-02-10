import 'package:bloc/bloc.dart';
import 'package:drive_poc/core/bloc_manager/event_listener_contracts/selected_symbol_event_listener.dart';
import 'package:drive_poc/features/available_contracts/states/available_contracts_state.dart';
import 'package:flutter_deriv_api/api/common/active_symbols/active_symbols.dart';
import 'package:flutter_deriv_api/api/contract/contracts_for/contracts_for_symbol.dart';
import 'package:flutter_deriv_api/basic_api/generated/contracts_for_send.dart';

class AvailableContractCubit extends Cubit<AvailableContractsState> implements SelectedSymbolEventListener {
  AvailableContractCubit() : super(AvailableContractsLoading()){}

  Future<void> fetchAvailableContract({bool showLoadingIndicator = true,required ActiveSymbol selectedSymbol}) async {
    try {
      if (showLoadingIndicator) {
        emit(AvailableContractsLoading());
      }

      final ContractsForSymbol contracts =
      await _fetchAvailableContracts(selectedSymbol);
      emit(
        AvailableContractsLoaded(
            contracts: contracts
        ),
      );
    } on Exception catch (e) {
      emit(AvailableContractsError('$e'));
    }
  }


  Future<ContractsForSymbol> _fetchAvailableContracts(
      ActiveSymbol selectedSymbol,
      ) async =>
      ContractsForSymbol.fetchContractsForSymbol(
        ContractsForRequest(contractsFor: selectedSymbol.symbol),
      );

  @override
  void onActiveSymbolsSelected(ActiveSymbol selectedSymbol) {
    fetchAvailableContract(selectedSymbol: selectedSymbol);
  }
}