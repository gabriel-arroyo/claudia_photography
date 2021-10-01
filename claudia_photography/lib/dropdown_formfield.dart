import 'package:flutter/material.dart';


class DropdownWidget extends StatefulWidget {
  final String? title;
  final List<String>? items;
  final ValueChanged<String>? itemCallBack;
  final String? currentItem;
  final String? hintText;

  const DropdownWidget({
    Key? key,
    this.title,
    this.items,
    this.itemCallBack,
    this.currentItem,
    this.hintText,
  }):super(key: key);

  @override
  State<StatefulWidget> createState() => _DropdownState();
}

class _DropdownState extends State<DropdownWidget> {
  List<DropdownMenuItem<String>> dropDownItems = [];

  @override
  void initState() {
    super.initState();
    for (String item in widget.items!) {
      dropDownItems.add(DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ));
    }
  }


  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 6),
            child: Text(
              widget.title!,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 2),
                  blurRadius: 10,
                  color: Color(0x19000000),
                ),
              ],
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                icon: const Icon(Icons.family_restroom),
                value: widget.currentItem,
                isExpanded: true,
                items: dropDownItems,
                onChanged: (selectedItem) => setState(() {
                  widget.itemCallBack!(widget.currentItem!);
                }),
                hint: Container(
                  child: Text(widget.hintText!, ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
