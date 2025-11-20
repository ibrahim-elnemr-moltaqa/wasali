part of core;

/// Base class for a Use Case in the Clean Architecture.
/// This abstraction represents an execution unit of a domain logic.
/// 
/// @Author: Moltaqa's Flutter Team
abstract class IUseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// No params use case
/// 
/// @Author: Moltaqa's Flutter Team
class NoParams extends Equatable {
  Map<String, dynamic> get toMap => {};

  @override
  List<Object?> get props => <Object?>[];
}
