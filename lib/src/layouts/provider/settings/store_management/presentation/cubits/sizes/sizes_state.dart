part of 'sizes_cubit.dart';

class SizesState extends Equatable {
  final Async<List<SizeEntity>> sizesState;
  final Async<SizeEntity> getSizeState;
  final Async<SizeEntity> createSizeState;
  final Async<SizeEntity> updateSizeState;
  final Async<Unit> deleteSizeState;
  final Async<Unit> changeSizeStatusState;
  final Async<int> selectedSizeIdState;
  final int? activeFilter;

  const SizesState({
    required this.sizesState,
    this.getSizeState = const Async.initial(),
    this.createSizeState = const Async.initial(),
    this.updateSizeState = const Async.initial(),
    this.deleteSizeState = const Async.initial(),
    this.changeSizeStatusState = const Async.initial(),
    this.selectedSizeIdState = const Async.initial(),
    this.activeFilter,
  });

  const SizesState.initial()
      : this(
          sizesState: const Async.initial(),
        );

  SizesState copyWith({
    Async<List<SizeEntity>>? sizesState,
    Async<SizeEntity>? getSizeState,
    Async<SizeEntity>? createSizeState,
    Async<SizeEntity>? updateSizeState,
    Async<Unit>? deleteSizeState,
    Async<Unit>? changeSizeStatusState,
    Async<int>? selectedSizeIdState,
    int? activeFilter,
  }) {
    return SizesState(
      sizesState: sizesState ?? this.sizesState,
      getSizeState: getSizeState ?? this.getSizeState,
      createSizeState: createSizeState ?? this.createSizeState,
      updateSizeState: updateSizeState ?? this.updateSizeState,
      deleteSizeState: deleteSizeState ?? this.deleteSizeState,
      changeSizeStatusState: changeSizeStatusState ?? this.changeSizeStatusState,
      selectedSizeIdState: selectedSizeIdState ?? this.selectedSizeIdState,
      activeFilter: activeFilter ?? this.activeFilter,
    );
  }

  @override
  List<Object?> get props => [
        sizesState,
        getSizeState,
        createSizeState,
        updateSizeState,
        deleteSizeState,
        changeSizeStatusState,
        selectedSizeIdState,
        activeFilter,
      ];
}