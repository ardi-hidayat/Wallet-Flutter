part of 'transaction_bloc.dart';

abstract class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object> get props => [];
}

class TransactionGet extends TransactionEvent {
  final String limit;
  const TransactionGet(this.limit);

  @override
  List<Object> get props => [limit];
}
