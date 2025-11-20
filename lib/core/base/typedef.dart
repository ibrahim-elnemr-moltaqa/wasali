part of core;

/// typedef
/// @Author: Moltaqa's Flutter Team

typedef DomainServiceType<T> = Future<Either<Failure, T>>;

typedef GenericVoidCallback<T> = void Function(
    T value); //hint: ! use ValueChanged<> instead as it is same and from flutter
