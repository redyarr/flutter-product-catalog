import 'package:equatable/equatable.dart';

/// Base sealed class for all catalog events.
sealed class CatalogEvent extends Equatable {
  const CatalogEvent();

  @override
  List<Object?> get props => <Object?>[];
}

/// Requests initial load or retry of the product catalog.
final class CatalogLoadRequested extends CatalogEvent {
  const CatalogLoadRequested();
}

/// Dispatched when the user updates the search input text.
final class CatalogSearchQueryChanged extends CatalogEvent {
  const CatalogSearchQueryChanged(this.query);

  final String query;

  @override
  List<Object?> get props => <Object?>[query];
}

/// Dispatched when the user taps a category filter pill (`null` means All).
final class CatalogCategorySelected extends CatalogEvent {
  const CatalogCategorySelected(this.category);

  final String? category;

  @override
  List<Object?> get props => <Object?>[category];
}

/// Resets active search query and category filter back to defaults.
final class CatalogFiltersReset extends CatalogEvent {
  const CatalogFiltersReset();
}
