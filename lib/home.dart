import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int rad = 0;
int colorHex = 0xffB1001C;
int _counter = 0;
int _time = 0;
int _goal = 0;

class _HomeScreenState extends State<HomeScreen> {

  resetToZero(){
    setCount(_counter=0);
    setTime(_time=0);
    setGoal(_goal=0);
  }
  setCount(int value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt('counter', value);
  }

  setTime(int value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt('time', value);
  }

  setGoal(int value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt('goal', value);
  }

  getCount() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _counter = pref.getInt('counter') ?? 0;
      _time = pref.getInt('time') ?? 0;
      _goal = pref.getInt('goal') ?? 0;
    });
  }

  @override
  void initState() {
    getCount();
    super.initState();
  }

  TextDirection textDirection = TextDirection.rtl;
  @override
  Widget build(BuildContext context) {
    Color mainColor = Color(colorHex);
    return Directionality(
      textDirection: textDirection,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            resetToZero();
            setState(() {
              
            });
          },
          backgroundColor: mainColor,
          child: const Icon(
            Icons.refresh,
            color: Colors.white,
          ),
        ),
        appBar: AppBar(
          backgroundColor: mainColor,
          elevation: 0.0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.color_lens,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: mainColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Center(
                      child: Text(
                    'الهدف',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            setGoal(_goal -= 1);
                          });
                        },
                        icon: const Icon(
                          Icons.remove_circle,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '$_goal',
                          style:
                              const TextStyle(color: Colors.white, fontSize: 28),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                         setState(() {
                            setGoal(_goal +=1);
                         });
                        },
                        icon: const Icon(Icons.add_circle, color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          '0',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          '33',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          '100',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          '+100',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          '+1000',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "الاستغفار",
                  style: TextStyle(color: mainColor, fontSize: 22),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "$_counter",
                  style: TextStyle(color: mainColor, fontSize: 22),
                ),
                const SizedBox(
                  height: 20,
                ),
                CircularPercentIndicator(
                  radius: 80.0,
                  lineWidth: 5.0,
                  percent: _counter / 33,
                  center: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_counter == 30) {
                          setTime(_time+=1);
                          setCount(_counter = 0);
                        }
                        setCount(_counter += 1);
                      });
                    },
                    child: Icon(
                      Icons.touch_app,
                      size: 50.0,
                      color: mainColor,
                    ),
                  ),
                  backgroundColor: mainColor.withOpacity(0.2),
                  progressColor: mainColor,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "مرات التكرار : $_time",
                  style: TextStyle(color: mainColor, fontSize: 22),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "المجموع : ${_time * _goal + _counter}",
                  style: TextStyle(color: mainColor, fontSize: 22),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Radio(
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => const Color(0xffB1001C)),
                      value: 0xffB1001C,
                      groupValue: colorHex,
                      onChanged: (val) {
                        setState(() {
                          // setColor(val!);
                          colorHex = val!;
                        });
                      }),
                  Radio(
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => const Color(0xff14212A)),
                      value: 0xff14212A,
                      groupValue: colorHex,
                      onChanged: (val) {
                        setState(() {
                          // setColor(val!);
                          colorHex = val!;
                        });
                      }),
                  Radio(
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Color(0xff62249F)),
                      value: 0xff62249F,
                      groupValue: colorHex,
                      onChanged: (val) {
                        setState(() {
                          // setColor(val!);
                          colorHex = val!;
                        });
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
