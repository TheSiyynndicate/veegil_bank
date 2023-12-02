import 'package:equatable/equatable.dart';

/// A type structure for every useCase in the domain layer
abstract class UseCase<ReturnType, Params> {
  /// The [call] method allows an instance
  /// of any class that defines it to
  /// emulate a function.
  Future<ReturnType?> call({required Params? params});
}


class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object?> get props => [];
}

class Params extends Equatable {
  final Map<String, dynamic> data;

  const Params({required this.data});

  @override
  List<Object?> get props => [data];
}
