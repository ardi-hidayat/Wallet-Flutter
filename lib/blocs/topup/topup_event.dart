part of 'topup_bloc.dart';

abstract class TopupEvent extends Equatable {
  const TopupEvent();

  @override
  List<Object> get props => [];
}

class TopUpPost extends TopupEvent {
  final TopUpFormModel data;

  const TopUpPost(this.data);

  @override
  List<Object> get props => [data];
}
