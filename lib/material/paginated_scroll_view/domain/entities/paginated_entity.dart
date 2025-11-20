class PaginationMeta {
  final int currentPage;
  final int lastPage;

  PaginationMeta({required this.currentPage, required this.lastPage});

  factory PaginationMeta.fromJson(Map<String, dynamic> json) {
    return PaginationMeta(
      currentPage: json['current_page'] ?? 1,
      lastPage: json['last_page'] ?? 1,
    );
  }

  bool get hasNextPage => currentPage < lastPage;
}

class PagedResponse<T> {
  final List<T> data;
  final PaginationMeta meta;

  PagedResponse({required this.data, required this.meta});

  factory PagedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    return PagedResponse<T>(
      data: List<T>.from(json['data'].map(fromJson)),
      meta: PaginationMeta.fromJson(json['meta']),
    );
  }
}
