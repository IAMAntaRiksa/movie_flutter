import 'package:flutter/material.dart';
import 'package:flutter_movie/ui/search/components/search_home_screen.dart';
import 'package:flutter_movie/values/text_style.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: const [
          SearchField(),
          MovieSearchWidget(),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          keyboardType: TextInputType.text,
          style: titleTextStyleKecilblack,
          decoration: const InputDecoration(
            hintText: 'Mau cari apa?',
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintStyle: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
