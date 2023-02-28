import 'package:flutter/material.dart';
import 'package:flutter_provider_1/providers/home_page_provider.dart';
import 'package:flutter_provider_1/screens/nextpage.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController ageController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider"),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider<HomePageProvider>(
        create: (context) => HomePageProvider(),
        child: Consumer<HomePageProvider>(
          builder: (context,provider,child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${provider.msg}",style: TextStyle(color: provider.eligible==true ? Colors.green : Colors.red),),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextField(
                    controller: ageController,
                    decoration: InputDecoration(
                        hintText: "Enter Age",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9)
                        )
                    ),
                    onChanged: (value){
                      provider.CheckEligiblity(int.parse(value));
                    },
                  ),
                ),
                ElevatedButton(onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>NextPage(Age: ageController.text.toString())));
                }, child: Text("Next Page"))
              ],
            );
          }
        ),
      ),
    );
  }
}
