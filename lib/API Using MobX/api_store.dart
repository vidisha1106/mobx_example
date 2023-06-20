import 'package:mobx/mobx.dart';
import 'package:mobx_example/API%20Using%20MobX/api_class.dart';
import 'package:mobx_example/API%20Using%20MobX/api_model.dart';

part 'api_store.g.dart';

class ApiStore = _ApiStore with _$ApiStore;

abstract class _ApiStore with Store {

  final PostApi postApi = PostApi();

  @observable
  ObservableFuture<List<Post>>? postListFuture;

  @action
  Future fetchData() =>
      postListFuture = ObservableFuture(postApi.getDataFromApi()).then(
        (posts) => posts,
      );

  void getData()
  {
    fetchData();
  }
}
