import 'package:flutter/material.dart';
import 'package:flutter_provider_1/providers/home_page_provider.dart';
import 'package:provider/provider.dart';
class NextPage extends StatefulWidget {
  final Age;
  const NextPage({Key? key,required this.Age}) : super(key: key);

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Next Page"),
      ),
      body: ChangeNotifierProvider<HomePageProvider>(
        create: (context) => HomePageProvider(),
        child: Consumer<HomePageProvider>(
          builder: (context,provider,child){
            return Column(
              children: [
                Text("Your Age is= ${widget.Age}")
              ],
            );
          },
        ),
      ),
    );
  }
}
