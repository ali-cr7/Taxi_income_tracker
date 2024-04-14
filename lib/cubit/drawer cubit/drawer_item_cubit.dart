import 'package:bloc/bloc.dart';
//import 'package:meta/meta.dart';

part 'drawer_item_state.dart';

class DrawerItemCubit extends Cubit<DrawerItemState> {
  DrawerItemCubit() : super( DrawerItemInitial(activeIndex: 0));
  void onItemTapped(int index) {
   
    if (state.activeIndex != index) {
      emit(state.copyWith(activeIndex: index));
    }
   
  }
}


// class DrawerItemCubit extends Cubit<DrawerItemState> {
//   DrawerItemCubit() : super( DrawerItemInitial(activeIndex: 0));
//   void onItemTapped(int index) {
   
//     if (state.activeIndex != index) {
//       emit(state.copyWith(activeIndex: index));
//     }
   
//   }
// }