import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky/customWidgets/custom_text_style.dart';
import 'package:tasky/provider/motivation_quote_controller.dart';
import 'package:tasky/provider/user_name_controller.dart';


class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  GlobalKey<FormState> motivationQuoteKey = GlobalKey();
  final _motivationQuoteController = TextEditingController();
  String _hintText = "One task at a time. One step closer.";

  @override
  void initState() {          //دا عشان يبدأ يحمل القيم لما الويدجت تشتغل
    super.initState();
    _loadSavedQuote();        //بتنادي ال saved quote عشان تجيب اخر quote محفوظ 
  }

  Future<void> _loadSavedQuote() async {          // فانكشن عشان نحمل فيها ال quote المحفوظ
    final preference = await SharedPreferences.getInstance();          //يجيب الـ singleton الخاص بالـ SharedPreferences للتعامل مع التخزين الي هو عبارة عن ماب.
    final lastQuote = preference.getString('motivation_quote');       //يحاول يقرأ القيمة المخزنة تحت 'motivation_quote'.
    if (lastQuote != null && lastQuote.isNotEmpty) {        //لو فيه قيمة فعلا هيحدث الstate بالقيمة الجديدة 
      setState(() {
        _hintText = lastQuote;
      });
    }
  }

  Future<void> _saveQuote(String quote) async {
    final preference = await SharedPreferences.getInstance();
    await preference.setString('motivation_quote', quote);
  }
  @override
  Widget build(BuildContext context) {
    final userName = Provider.of<UserNameProvider>(context).userName ?? '';
    final motivationProvider = Provider.of<MotivationQuoteProvider>(context); 
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () async{
                        final enteredText = _motivationQuoteController.text
                            .trim();
                        final motivationQuote = enteredText.isEmpty
                            ? "One task at a time. One step closer."
                            : enteredText;
                            motivationProvider.setQuote(motivationQuote);
                            await _saveQuote(motivationQuote);
                            
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back),
                      color: Colors.white,
                    ),
                    SizedBox(width: 7),
                    Text(
                      "User Details",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        color: Color(0xffFFFCFC),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                CustomTextStyle(
                  text: 'User Name',
                  fontSize: 20,
                  fontFamily: 'Poppins',
                ),
                SizedBox(height: 10),
                Container(
                  height: 66,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFF282828),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "$userName",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                   // Text("Motivation Quote", style: Theme.of(context).textTheme.titleLarge,)
                    CustomTextStyle(
                      text: 'Motivation Quote',
                      fontSize: 20,
                      fontFamily: 'Poppins',
                    ),
                    SizedBox(height: 10),
                    Form(
                      child: TextFormField(
                        key: motivationQuoteKey,
                        controller: _motivationQuoteController,
                        style: Theme.of(context).textTheme.labelLarge,
                        maxLines: 5,
                        keyboardType: TextInputType.text,
                        keyboardAppearance: Brightness.dark,
                        cursorColor: Colors.white,
                        cursorHeight: 30,
                        cursorRadius: const Radius.circular(40),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xff282828),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          hintText: _hintText,
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            color: Color.fromARGB(255, 109, 109, 109),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
