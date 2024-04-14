part of 'drawer_item_cubit.dart';

abstract class DrawerItemState {
  final int activeIndex;

  const DrawerItemState({required this.activeIndex});

DrawerItemState copyWith({int? activeIndex}) {
  return DrawerItemInitial(activeIndex: activeIndex ?? this.activeIndex);
}
}

class DrawerItemInitial extends DrawerItemState {
  DrawerItemInitial({required int activeIndex}) : super(activeIndex: activeIndex);
}