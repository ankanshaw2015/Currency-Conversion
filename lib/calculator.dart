import 'package:flutter/material.dart';


/*void main() {
  runApp(const MyCalc());
}
*/
class MyCalc extends StatefulWidget {
  const MyCalc({super.key});
  
  @override
  State createState() => _MyCalc();
}

class _MyCalc extends State {
  
  double result = 0;
  TextEditingController control = TextEditingController();

  List<String> list= <String>['usd','yen','euro','rupee'];
  String s1='usd';
  String s2='usd';
  String s3='0';
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(88, 127, 156, 1),
        
        title: Container(
          height: 30,
          width: 800,
          color: const Color.fromARGB(255, 81, 118, 141),
          
          child: const Center(
            child:  Text('Currency  Calculator',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 251, 250, 250),
                  fontWeight: FontWeight.bold,
                  
                )),
          ),
        ),
      ),
      backgroundColor: const Color.fromRGBO(117, 209, 240, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              s3,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                controller: control,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                ),
                decoration: const InputDecoration(
                  hintText: 'Enter Amount',
                  hintStyle: TextStyle(
                    color: Color.fromARGB(179, 255, 251, 251),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 8,
                        style: BorderStyle.solid,
                        color: Color.fromARGB(137, 110, 148, 180),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  filled: true,
                  fillColor: Color.fromARGB(255, 33, 61, 71),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                const Text('From   ',style: TextStyle(color: Color.fromARGB(255, 24, 23, 23), fontSize: 30,fontWeight: FontWeight.w600),),
                 DropdownButton(
                  dropdownColor: const Color.fromRGBO(88, 127, 156, 1),
                  iconEnabledColor: Colors.green,
                  value: s1,
                  items: list.map((e)=>DropdownMenuItem(value: e,child: Text(e,style: const TextStyle(backgroundColor: Color.fromRGBO(117, 209, 240, 1),),),)).toList(), onChanged: (val){
                  setState(() {
                    s1=val.toString();
                  });
                 }),
                 const Text('    To   ',style: TextStyle(color: Color.fromARGB(255, 24, 23, 23), fontSize: 30,fontWeight: FontWeight.w600),),
                  DropdownButton(
                    dropdownColor: const Color.fromRGBO(88, 127, 156, 1),
                  value: s2,
                  items: list.map((e)=>DropdownMenuItem(value: e,child: Text(e,style: const TextStyle(backgroundColor: Color.fromRGBO(117, 209, 240, 1),),),)).toList(), onChanged: (val){
                  setState(() {
                    s2=val.toString();
                  });
                 }),
              ],
            ),
           
            Container(
              child: ElevatedButton(
                
                onPressed: check,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(88, 127, 156, 1),
                  elevation: 15,
                ),
                child: const Text('Generate',
                    style: TextStyle(
                     // backgroundColor: Colors.yellowAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromARGB(255, 253, 253, 253),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
  void check() {
    Map<String, double?> conversionRates = {
      'usd-usd': 1.0,
      'usd-rupee': 83.7,
      'usd-yen': 149.12,
      'usd-euro': 0.93,
      'rupee-usd': 1 / 83.7,
      'rupee-rupee': 1.0,
      'rupee-yen': 1.78,
      'yen-usd': 1 / 149,
      'yen-rupee': 1 / 1.78,
      'yen-yen': 1.0,
      'yen-euro': 0.006,
      'euro-usd': 1 / 1.08,
      'euro-rupee': 90.38,
      'euro-yen': 169.0,
      'euro-euro': 1.0,
    };

    String key = '$s1-$s2';

    if (conversionRates.containsKey(key)) {
     
      double result =
          double.parse(control.text) * conversionRates[key]!;

      setState(() {
        control.text = '';
        s3 = '${result.toStringAsFixed(2)} $s2';
      });
    } else {
      print('Invalid conversion');
    }
  }
}

/*class myCalc extends StatelessWidget {
  const myCalc({super.key});

  @override
  Widget build(BuildContext context) {
   
    return   Scaffold(
      appBar: AppBar(backgroundColor: Colors.yellowAccent,
      title: const Text('Currency Calculator',style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        backgroundColor: Colors.white,
      )),
      ),
      backgroundColor: Colors.black,
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
const Text(
              '0',
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
           const Padding(
              padding: EdgeInsets.all(8),
              child: TextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  hintText: 'Enter Amount',
                  hintStyle: TextStyle(
                    color: Color.fromARGB(179, 52, 44, 44),
                  ),
                   focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 8,
                        style: BorderStyle.solid,
                        color: Colors.black54,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  filled: true,
                  fillColor: Colors.yellow,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
            ),
            Container(
              child: ElevatedButton(
                
                onPressed: () {
                print("object");
                
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
               child: const Text('Generate',style: TextStyle(backgroundColor: Colors.yellowAccent,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.blue,
              )),
              
              ),
            )
          ],
        ),
      ),
    );
  }
}*/
