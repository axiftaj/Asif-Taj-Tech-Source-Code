import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffects extends StatefulWidget {
  const ShimmerEffects({Key? key}) : super(key: key);

  @override
  _ShimmerEffectsState createState() => _ShimmerEffectsState();
}

class _ShimmerEffectsState extends State<ShimmerEffects> {

  bool _enabled = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  Future loadData() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      _enabled = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat List'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _enabled == true ? 4 : 6,
              itemBuilder: (_, __) {
                if(_enabled){
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    enabled: _enabled,
                    child: Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            radius: 28,
                            backgroundImage: NetworkImage('https://flutter.dev/docs/cookbook/img-files/effects/split-check/Avatar1.jpg'),
                          ),
                          title:  Container(
                            width: 100,
                            height: 8.0,
                            color: Colors.white,
                          ),
                          subtitle:  Container(
                            width: double.infinity,
                            height: 8.0,
                            color: Colors.white,
                          ),
                        ),

                      ],
                    ),
                  ) ;
                }else {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            radius: 28,
                            backgroundImage: NetworkImage('https://flutter.dev/docs/cookbook/img-files/effects/split-check/Avatar1.jpg'),
                          ),
                          title:  Text('John wick'),
                          subtitle:  Text("Who kill John's dog "),
                        ),
                      ],
                    ),
                  ) ;
                }

              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: FlatButton(
                onPressed: () {
                  setState(() {
                    _enabled = !_enabled;
                  });
                },
                child: Text(
                  _enabled ? 'Stop' : 'Play',
                  style: Theme.of(context).textTheme.button!.copyWith(
                      fontSize: 18.0,
                      color: _enabled ? Colors.redAccent : Colors.green),
                )),
          )

        ],
      ),
    );
  }
}
