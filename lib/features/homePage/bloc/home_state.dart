part of 'home_bloc.dart';

@immutable
abstract class HomeState {}
abstract class HomeActionState extends HomeState{}


class HomeInitial extends HomeState {}
class HomeLoadedState extends HomeState{
final List<CoffeeModel>coffeeModel = coffeeList.map((e) =>
    CoffeeModel(name:e ['name'], description: e['description'], rating: e['rating'],
        price: e['price'], categories: e['categories'], about: e['about'], image: e['image'])).toList();
}

class AddNavigateActionState extends HomeActionState{}