import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zootracker/View/Components/BarButtonItem.dart';

class SectionHeaderView extends StatefulWidget {
  final Widget leading;

  const SectionHeaderView({Key key, this.leading}) : super(key: key);

  @override
  _SectionHeaderViewState createState() => _SectionHeaderViewState();
}

class _SectionHeaderViewState extends State<SectionHeaderView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Adicionar Animal" ?? '',
            style:
            TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
          ),
          widget.leading ?? Spacer()
        ],
      ),
    );
  }
}
