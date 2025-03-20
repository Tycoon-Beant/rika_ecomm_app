class PaginationResponse<T> {
  final List<T> data;
  final int page;
  final int totalPages;

  PaginationResponse({required this.data, this.page = 1, this.totalPages = 1});

  bool get hasNextPage => page <= totalPages;

  PaginationResponse<T> copyWith({int? page, int? totalPages, List<T>? data}) {
    return PaginationResponse(
      data: data ?? this.data,
      page: page ?? this.page,
      totalPages: totalPages ?? this.totalPages,
    );
  }
}


