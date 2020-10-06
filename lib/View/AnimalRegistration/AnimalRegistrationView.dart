import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zootracker/View/Components/BarButtonItem.dart';
import 'package:zootracker/View/Components/Bars/CustomNavBar.dart';
import 'package:zootracker/View/Components/CircleImageViewCell.dart';
import 'package:zootracker/View/Components/FromView.dart';
import 'package:zootracker/View/Components/SectionHeaderView.dart';
import 'package:zootracker/View/Filter/FilterView.dart';
import 'package:zootracker/ViewControllers/FormViewController.dart';

class AnimalRegistration extends StatefulWidget {
  FormViewController controller = FormViewController(false);

  @override
  _AnimalRegistrationState createState() => _AnimalRegistrationState();
}

class _AnimalRegistrationState extends State<AnimalRegistration> {
  @override
  Widget build(BuildContext context) {
    return CustomNavBar(
      title: Text("Criar Registro"),
      uniqueHeroTag: "AnimalDetailsViewNavBar",
      body: SafeArea(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                toolbarHeight: 30,
                flexibleSpace: TabBar(
                    tabs: [
                      Tab(icon: Icon(Icons.library_books)),
                      Tab(icon: Icon(CupertinoIcons.paw_solid)),
                    ]
                ),
              ),
              body: TabBarView(
                children: [
                  Container(
                    child: FormView(
                      controller: widget.controller,
                      footerWidget: Container(
                        height: 150,
                        child: Column(
                          children: <Widget>[
                            SectionHeaderView(
                              leading: BarButtonItem(
                                child: Icon(
                                  Icons.add,
                                  color: CupertinoColors.label,
                                ),
                                callBack: () {
                                  //_pushToCorrectPresentation(context, false, AnimalRegistration());
                                },
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: 12,
                                itemBuilder: (BuildContext context, int index) =>
                                    CircleImageViewCell(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: FilterView(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      actions: <Widget>[
        BarButtonItem(
          child: Icon(Icons.check),
          callBack: () {
            Navigator.of(context).pop();
          },
        )],
    );
  }
}
