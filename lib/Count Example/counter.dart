import 'package:mobx/mobx.dart';
part 'counter.g.dart';
class Counter = _Counter with _$Counter;
abstract class _Counter with Store
{
  @observable
  int count1=0;

  @observable
  int count2=0;

  @computed
  int get total => count1 + count2 ;

  @action
  void increment()
  {
    count1++;
  }

  @action
  void decrement()
  {
    count2--;
  }
}