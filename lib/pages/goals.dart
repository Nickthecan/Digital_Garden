import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Goals extends StatefulWidget {
  const Goals({super.key});

  @override
  State<Goals> createState() => _GoalsState();
}

class _GoalsState extends State<Goals> {
  late bool isAnnual;

  @override
  void initState() {
    super.initState();
    isAnnual = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD3D3D3),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                child: Text("Goals", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32, color: Colors.white),),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
              child: Container(
                height: 650,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Text("Let's get started", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Color(0xF22F2F2F)),),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                      child: Text("Choose your goals", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Retirement", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Color(0xF22F2F2F)),),
                          CheckBox(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 70, 0),
                      child: Text("Be ready for retirement with a plan for future assets and expenses.", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Color(0xF22F2F2F)),),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Education", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Color(0xF22F2F2F)),),
                          CheckBox(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 70, 0),
                      child: Text("Be ready to tackle the rising education costs.", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Color(0xF22F2F2F)),),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Home", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Color(0xF22F2F2F)),),
                          CheckBox(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 70, 0),
                      child: Text("Save for primary residence, secondary residence or an investment property.", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Color(0xF22F2F2F)),),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Major Purchase", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Color(0xF22F2F2F)),),
                          CheckBox(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 70, 0),
                      child: Text("Make a significant one-time purchase, such as a car.", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Color(0xF22F2F2F)),),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Travel", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Color(0xF22F2F2F)),),
                          CheckBox(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 70, 0),
                      child: Text("Set aside money for that big trip that you are planning.", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Color(0xF22F2F2F)),),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
              child: Container(
                height: 525,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Text("Check your info", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Color(0xF22F2F2F)),),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                      child: Text("update your info to create a better goal estimate", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
                      child: Text("Marital status", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: DropdownMenu(
                        width: 325,
                        dropdownMenuEntries: [
                          DropdownMenuEntry(value: 'single', label: 'Single'),
                          DropdownMenuEntry(value: 'married', label: 'Married'),
                          DropdownMenuEntry(value: '', label: ''),
                        ],
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Text("Employment status", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                        child: DropdownMenu(
                          width: 325,
                          dropdownMenuEntries: [
                            DropdownMenuEntry(value: 'employed', label: 'Employed'),
                            DropdownMenuEntry(value: 'unemployed', label: 'Unemployed'),
                            DropdownMenuEntry(value: '', label: ''),
                          ],
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Text("Annual income", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Container(
                        width: 325,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'^[0-9]*(\.[0-9]{0,2})?$')),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 30),
              child: Container(
                height: isAnnual ? 750 : 650,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Text("Tell us the details", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Color(0xF22F2F2F)),),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Text("Goal name", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: SizedBox(
                        width: 325,
                        child: TextField(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Text("Spending frequency", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                  isAnnual = false;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isAnnual ? Colors.white : Color(0xFF58E47F),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 8,
                            ),
                            child: Text('One-time', style: TextStyle(color: isAnnual ? Color(0xFF58E47F) : Colors.white)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  isAnnual = true;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: isAnnual ? Color(0xFF58E47F) : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                elevation: 8, // No elevation
                              ),
                              child: Text('Annual', style: TextStyle(color: isAnnual ? Colors.white : Color(0xFF58E47F)),),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Text("Spending ${isAnnual ? 'years' : 'year'}", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: SizedBox(
                        width: 325,
                        child: TextField(),
                      ),
                    ),
                    Visibility(
                        visible: isAnnual,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Number of years", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                              SizedBox(
                                width: 325,
                                child: TextField(),
                              ),
                            ]
                          ),
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Text("${isAnnual ? 'Annual' : 'One-time'} amount", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xF22F2F2F)),),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: SizedBox(
                        width: 325,
                        child: TextField(),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8), // Adjust the borderRadius as needed
                              ),
                              elevation: 8,
                              foregroundColor: Colors.white, backgroundColor: Color(0xFF58E47F),
                            ),
                            child: Text("Create Goal", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CheckBox extends StatefulWidget {
  const CheckBox({super.key});

  @override
  State<CheckBox> createState() => CheckBoxState();
}

class CheckBoxState extends State<CheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Color(0xFF58E47F);
      }
      return Color(0xFFD3D3D3);
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: isChecked ? MaterialStateProperty.all(Color(0xFF58E47F)) : MaterialStateProperty.all(Color(0xFFD3D3D3)),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
