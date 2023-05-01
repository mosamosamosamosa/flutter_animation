import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DraggbleSample extends StatefulWidget {
  const DraggbleSample({super.key});

  @override
  State<DraggbleSample> createState() => _DraggbleSampleState();
}

class _DraggbleSampleState extends State<DraggbleSample> {
  bool union = false;
  bool union2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Drag & Drop"),
        ),
        body: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(24.0),
                child: union && union2
                    ? Image.asset('assets/panda_pink.png')
                    : buildDragTarget()),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: union && union2
                  ? Container()
                  : union && !union2
                      ? buildDraggable2("Draggable", Icons.filter_1)
                      : !union && union2
                          ? buildDraggable("Draggable", Icons.filter_1)
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                buildDraggable("Draggable", Icons.filter_1),
                                buildDraggable2("Draggable", Icons.filter_1),
                              ],
                            ),
            ),
          ],
        )));
  }

  //動かす側
  Draggable buildDraggable(String name, IconData childIcon) => Draggable(
      data: "I'm $name!",
      //ドラッグが始まった時
      onDragStarted: () {
        print("ドラッグ開始");
      },
      //ドラッグ先がターゲットの中じゃない時
      onDraggableCanceled: (velocity, offset) {
        print("ドラッグ失敗");
      },
      //ドラッグ先がターゲットに入った時
      onDragCompleted: () {
        setState(() {
          union = true;
        });
        print("ドラッグ成功");
      },
      //ドラッグを話したとき
      onDragEnd: (details) {
        print("ドラッグ終了");
      },
      //child：ドラッグする対象
      child: SizedBox(
        width: 90,
        height: 90,
        child: Image.asset('assets/panda.png'),
      ),

      //feedback：ドラッグ中対に表示する対象
      feedback: SizedBox(
        width: 90,
        height: 90,
        child: Image.asset('assets/panda.png'),
      ),
      //childWhenDragging：必須ではない ドラッグ中に元あった場所に表示される
      childWhenDragging: Container());

  Draggable buildDraggable2(String name, IconData childIcon) => Draggable(
      data: "I'm $name!",
      //ドラッグが始まった時
      onDragStarted: () {
        print("ドラッグ開始");
      },
      //ドラッグ先がターゲットの中じゃない時
      onDraggableCanceled: (velocity, offset) {
        print("ドラッグ失敗");
      },
      //ドラッグ先がターゲットに入った時
      onDragCompleted: () {
        setState(() {
          union2 = true;
        });
        print("ドラッグ成功");
      },
      //ドラッグを話したとき
      onDragEnd: (details) {
        print("ドラッグ終了");
      },
      //child：ドラッグする対象
      child: SizedBox(
        width: 90,
        height: 90,
        child: Image.asset('assets/panda.png'),
      ),

      //feedback：ドラッグ中対に表示する対象
      feedback: SizedBox(
        width: 90,
        height: 90,
        child: Image.asset('assets/panda.png'),
      ),
      //childWhenDragging：必須ではない ドラッグ中に元あった場所に表示される
      childWhenDragging: Container());

  //ドラッグの目標地点
  DragTarget buildDragTarget() => DragTarget(
        builder: (context, candidateData, rejectedData) {
          return SizedBox(
            width: 90,
            height: 90,
            child: Image.asset('assets/present.png'),
          );
        },
      );
}
