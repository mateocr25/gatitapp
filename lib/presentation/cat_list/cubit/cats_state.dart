part of 'cats_cubit.dart';

class CatsState extends Equatable {
  final CatsStatus status;
  final List<Cat>? cats;
  final String? errorMessage;

  const CatsState({
    required this.status,
    this.cats,
    this.errorMessage,
  });

  factory CatsState.initialState() =>
      const CatsState(status: CatsStatus.initial);

  CatsState copyWith({
    CatsStatus? status,
    List<Cat>? cats,
    String? errorMessage,
  }) =>
      CatsState(
        status: status ?? this.status,
        cats: cats ?? this.cats,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  List<Object?> get props => [
        status,
        cats,
        errorMessage,
      ];

  @override
  String toString() => '''
  status: $status,
  ------------------------------------------------------------------------------
  cats: $cats,
  ''';
}
