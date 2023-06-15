import 'dart:math';

import 'package:mobx/mobx.dart';

part 'dice.g.dart';

class Dice = _Dice with _$Dice;

abstract class _Dice with Store
{
  @observable
  int left=Random().nextInt(6)+1;

  @observable
  int right=Random().nextInt(6)+1;

  @computed
  int get total => left+right;

  @action
  void roll()
  {
    left=Random().nextInt(6)+1;
    right=Random().nextInt(6)+1;
  }
}