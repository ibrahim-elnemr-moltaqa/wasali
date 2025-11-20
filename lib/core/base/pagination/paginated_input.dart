part of core;

/// baes input for any pagination request data
///
/// @Author: Moltaqa's Flutter Team
class PaginatedInput extends NoParams {
  final int page;

  PaginatedInput({
    this.page = 1,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
        'page': page,
      };

  @override
  List<Object?> get props => [page];
}
