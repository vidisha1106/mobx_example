import 'dart:async';
import 'dart:math';

import 'package:mobx/mobx.dart';

part 'random_stream_store.g.dart';

class RandomStreamStore = _RandomStream with _$RandomStreamStore;

abstract class _RandomStream with Store {
  Timer? timer;
  StreamController<int>? streamController;
  ObservableStream<int>? randomStream;

  _RandomStream() {
    streamController = StreamController<int>();
    timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) => streamController!.add(Random().nextInt(100)),
    );
    randomStream=ObservableStream(streamController!.stream);
  }

  void dispose() async
  {
      timer!.cancel();
      await streamController!.close();
  }
}
