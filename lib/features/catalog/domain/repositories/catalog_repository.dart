import 'package:equatable/equatable.dart';
import 'package:flutter_testapp/core/error/failures.dart';
import 'package:flutter_testapp/features/catalog/domain/entities/product.dart';

/// Strongly typed outcome wrapper for domain repository operations.
sealed class CatalogResult<T> extends Equatable {
  const CatalogResult();
}

/// Successful repository response wrapping [data].
final class CatalogSuccess<T> extends CatalogResult<T> {
  const CatalogSuccess(this.data);

  final T data;

  @override
  List<Object?> get props => <Object?>[data];
}

/// Failed repository response wrapping a domain [Failure].
final class CatalogFailure<T> extends CatalogResult<T> {
  const CatalogFailure(this.failure);

  final Failure failure;

  @override
  List<Object?> get props => <Object?>[failure];
}

/// Contract for fetching catalog products.
abstract interface class CatalogRepository {
  /// Loads the catalog of products, mapping transport/parsing errors to [Failure].
  Future<CatalogResult<List<Product>>> getProducts();
}
