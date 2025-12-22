part of 'working_days_cubit.dart';

class WorkingDaysState extends Equatable {
  final Async<List<WorkingDayModel>> workingDaysState;
  final Async<Unit> createWorkingDayState;
  final Async<Unit> updateWorkingDayState;
  final Async<Unit> deleteWorkingDayState;

  const WorkingDaysState({
    required this.workingDaysState,
    required this.createWorkingDayState,
    required this.updateWorkingDayState,
    required this.deleteWorkingDayState,
  });

  const WorkingDaysState.initial()
      : this(
          workingDaysState: const Async.initial(),
          createWorkingDayState: const Async.initial(),
          updateWorkingDayState: const Async.initial(),
          deleteWorkingDayState: const Async.initial(),
        );

  WorkingDaysState copyWith({
    Async<List<WorkingDayModel>>? workingDaysState,
    Async<Unit>? createWorkingDayState,
    Async<Unit>? updateWorkingDayState,
    Async<Unit>? deleteWorkingDayState,
  }) {
    return WorkingDaysState(
      workingDaysState: workingDaysState ?? this.workingDaysState,
      createWorkingDayState: createWorkingDayState ?? this.createWorkingDayState,
      updateWorkingDayState: updateWorkingDayState ?? this.updateWorkingDayState,
      deleteWorkingDayState: deleteWorkingDayState ?? this.deleteWorkingDayState,
    );
  }

  @override
  List<Object?> get props => [
        workingDaysState,
        createWorkingDayState,
        updateWorkingDayState,
        deleteWorkingDayState,
      ];
}
