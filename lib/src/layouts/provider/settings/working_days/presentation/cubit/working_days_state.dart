part of 'working_days_cubit.dart';

class WorkingDaysState extends Equatable {
  final Async<List<WorkingDayModel>> workingDaysState;
  final Async<Unit> createWorkingDayState;
  final Async<Unit> updateWorkingDayState;
  final Async<Unit> deleteWorkingDayState;
  final String? activeId;

  const WorkingDaysState({
    required this.workingDaysState,
    required this.createWorkingDayState,
    required this.updateWorkingDayState,
    required this.deleteWorkingDayState,
    this.activeId,
  });

  const WorkingDaysState.initial()
      : this(
          workingDaysState: const Async.initial(),
          createWorkingDayState: const Async.initial(),
          updateWorkingDayState: const Async.initial(),
          deleteWorkingDayState: const Async.initial(),
          activeId: null,
        );

  WorkingDaysState copyWith({
    Async<List<WorkingDayModel>>? workingDaysState,
    Async<Unit>? createWorkingDayState,
    Async<Unit>? updateWorkingDayState,
    Async<Unit>? deleteWorkingDayState,
    String? activeId,
    bool resetActiveId = false,
  }) {
    return WorkingDaysState(
      workingDaysState: workingDaysState ?? this.workingDaysState,
      createWorkingDayState: createWorkingDayState ?? this.createWorkingDayState,
      updateWorkingDayState: updateWorkingDayState ?? this.updateWorkingDayState,
      deleteWorkingDayState: deleteWorkingDayState ?? this.deleteWorkingDayState,
      activeId: resetActiveId ? null : (activeId ?? this.activeId),
    );
  }

  @override
  List<Object?> get props => [
        workingDaysState,
        createWorkingDayState,
        updateWorkingDayState,
        deleteWorkingDayState,
        activeId,
      ];
}
