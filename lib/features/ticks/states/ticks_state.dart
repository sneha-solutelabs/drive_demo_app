

import 'package:flutter_deriv_api/api/common/tick/tick.dart';

abstract class TicksState {}

class TicksLoadingState extends TicksState {}

class TicksLoaded extends TicksState {
  TicksLoaded({
    this.tick,
  });

  final Tick? tick;

}

class TicksError extends TicksState {
  TicksError(this.errorMessage);

  final String errorMessage;
}



