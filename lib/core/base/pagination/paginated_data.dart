part of core;



class ApiPaginatedData<T> extends PaginatedData<T> {
  const ApiPaginatedData.noDataFound() : super.noDataFound();

  const ApiPaginatedData({required super.items, required super.pageInfo});

  factory ApiPaginatedData.fromJson(
    Map<String, dynamic> json, {
    required List<T> Function(List<dynamic> dataList) getData,
  }) {
    final Map<String, dynamic> pageInfoMap = json["meta"] ?? {};
    final PageInfo pageInfo = PageInfo(
      currentPage: pageInfoMap["current_page"] ?? 0,
      countPerPage: pageInfoMap["per_page"] ?? 0,
      lastPage: pageInfoMap["last_page"] ?? 0,
      totalItemsCount: pageInfoMap["total"] ?? 0,
      totalPages: pageInfoMap["to"] ?? 0,
    );
    return ApiPaginatedData(
      pageInfo: pageInfo,
      items: getData(json["data"] ?? []),
    );
  }
}

/// A class that represents a pagination data
///
/// It holds the information about the current page and the total pages
/// and the total items count
///
/// It also holds the list of items for the current page
///
/// You can use the [map] method to map the items to another type
///
/// You can use the [mapApiData] method to map the items to another type
///
/// @Author: Moltaqa's Flutter Team
class PaginatedData<T> extends Equatable {
  final List<T> items;
  final PageInfo pageInfo;

  const PaginatedData({required this.items, required this.pageInfo});

  const PaginatedData.noDataFound()
      : this(
          items: const [],
          pageInfo: PageInfo.empty,
        );

  /// Maps the items of the current `PaginatedData` to another type and returns a new `PaginatedData` with the mapped items.
  ///
  /// This method applies the provided [mapApiData] function to each item in the `items` list, transforming it to a new type [E].
  /// It is useful when you need to convert the data contained within a `PaginatedData` object to a different type while preserving
  /// pagination information, such as when converting API response data models to UI models.
  ///
  /// Example:
  /// ```dart
  /// final paginatedData = PaginatedData(items: [1, 2, 3], pageInfo: somePageInfo);
  /// final mappedData = paginatedData.map<String>((item) => 'Item $item');
  /// // mappedData.items will be ['Item 1', 'Item 2', 'Item 3']
  /// ```
  PaginatedData<E> map<E>(E Function(T data) mapApiData) {
    return PaginatedData<E>(
        items: items.map<E>((item) => mapApiData(item)).toList(),
        pageInfo: pageInfo);
  }

  @override
  List<Object?> get props => [
        items,
        pageInfo,
      ];
}

/// A class that represents the pagination information of a data set.
///
/// The [PageInfo] class holds details about the pagination state
/// such as the current page, the last page, the total number of items,
/// and the number of items per page. It provides utility to determine
/// if there are more pages to fetch with the [hasNext] getter.
///
/// This class is used in conjunction with paginated data structures
/// to manage and access pagination-related information.
///
/// Example usage:
/// ```dart
/// final pageInfo = PageInfo(
///   currentPage: 1,
///   countPerPage: 20,
///   totalPages: 10,
///   lastPage: 10,
///   totalItemsCount: 200,
/// );
///
/// if (pageInfo.hasNext) {
///   // Fetch next page
/// }
/// ```
///
/// @Author: Moltaqa's Flutter Team

class PageInfo extends Equatable {
  final int currentPage;
  final int lastPage;
  final int totalPages;
  final int countPerPage;
  final int totalItemsCount;

  const PageInfo({
    required this.currentPage,
    required this.countPerPage,
    required this.totalPages,
    required this.lastPage,
    required this.totalItemsCount,
  });

  static const PageInfo empty = PageInfo(
      currentPage: 0,
      lastPage: 0,
      countPerPage: 0,
      totalPages: 0,
      totalItemsCount: 0);

  bool get hasNext => !(currentPage >= lastPage);

  @override
  List<Object?> get props => [currentPage, lastPage, totalItemsCount];
}
