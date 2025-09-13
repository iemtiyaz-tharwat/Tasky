import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    SizedBox(width: 7),
                    Text(
                      "User Details",
                      style: Theme.of(context).textTheme.displayLarge
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Text("User Name" , style: Theme.of(context).textTheme.displayMedium
                    ),
                
                SizedBox(height: 10),
                Container(
                  height: 66,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Theme.of(context).colorScheme.onSecondaryContainer )
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Motivation Quote", style: Theme.of(context).textTheme.displayMedium,),
                    SizedBox(height: 10),
                    Form(
                      child: TextFormField(
                        key: motivationQuoteKey,
                        controller: _motivationQuoteController,
                        style: Theme.of(context).textTheme.labelLarge,
                        maxLines: 5,
                        keyboardType: TextInputType.text,
                        cursorColor: Theme.of(context).colorScheme.surface,
                        cursorHeight: 30,
                        cursorRadius: const Radius.circular(40),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Theme.of(context).colorScheme.secondaryContainer,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Theme.of(context).colorScheme.onSecondaryContainer),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Theme.of(context).colorScheme.onSecondaryContainer),
                          ),
                          hintText: _hintText,
                          hintStyle: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 120),
                ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff15B86C),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
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
                
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  
                    Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 19,
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}
