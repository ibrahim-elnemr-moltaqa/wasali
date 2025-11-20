part of core;

/// A custom PagingController that works well with most of the cases.
///
/// The biggest advantage of this class is that it automatically handles
/// the next page key for you, so you don't need to worry about it.
///
/// By default, it will consider the last page key as the last key that
/// was received from the server, and it will consider the first page key
/// as the first key that was received from the server.
///
/// The [getNextPageKey] callback is a function that takes the current state
/// of the [PagingController] and returns the next page key. The default
/// implementation of this function is to return the last key that was
/// received from the server plus one.
///
/// This class is useful because it eliminates the need to manually handle
/// the next page key, which can be a source of complexity and errors.
/// 
/// @Author: Moltaqa's Flutter Team
class MyPagingController<T> extends PagingController<int, T> {
  MyPagingController({required super.fetchPage})
      : super(
          getNextPageKey: (state) {
            if (state.pages?.lastOrNull?.isEmpty ?? false) return null;
            return (state.keys?.lastOrNull ?? 0) + 1;
          },
        );

  PagingStatus get pagingStatus => super.value.status;
}
