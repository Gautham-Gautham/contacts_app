import 'package:fpdart/fpdart.dart';
import 'Error&Failure/failure.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef Futurevoid = FutureEither<void>;
