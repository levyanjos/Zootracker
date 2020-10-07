import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:zootracker/Model/Trail.dart';
import 'package:zootracker/View/Components/Bars/CustomNavBar.dart';
import 'package:zootracker/View/Components/Bars/SearchBar.dart';
import 'package:zootracker/View/CreateTrail/CreateTrailView.dart';
import 'package:zootracker/View/DetailsTrail/DetailsTrailView.dart';
import 'package:zootracker/View/Trails/TrailsCell.dart';

class TrailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomNavBar(
        title: Text("Trilhas"), uniqueHeroTag: 'tab1', body: TrailsContainerView());
  }
}

class TrailsContainerView extends StatelessWidget {
  didSelectTrailInList(BuildContext context, Trail trail) {
    pushToCorrectPresentation(
        context,
        false,
        DetailsTrailView(
          trail,
        )
    );
  }

  pushToCorrectPresentation(
      BuildContext context, bool isFullScreen, Widget screem) {
    Navigator.push(
        context,
        Platform.isIOS
            ? CupertinoPageRoute(
                fullscreenDialog: isFullScreen,
                builder: (context) => screem,
              )
            : MaterialPageRoute(
                fullscreenDialog: isFullScreen,
                builder: (context) => screem,
              ));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Styles.backgroundColor,
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(color: Colors.grey),
          itemCount: TrailRepository.mockTrails.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(
                  top: 8, left: 32, right: 32, bottom: 0),
              child: GestureDetector(
                onTap: () => didSelectTrailInList(context, TrailRepository.mockTrails[index]),
                child: TrailCell(
                  trail: TrailRepository.mockTrails[index],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: FloatingActionButton(
          backgroundColor: Styles.actionColor,
          tooltip: 'Increment Counter',
          child: const Icon(Icons.add),
          onPressed: () =>
              pushToCorrectPresentation(context, true, CreateTrails()),
        ),
      ),
    );
  }
}



// class _CupertinoSearchViewState extends State<CupertinoSearchView> {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<TrailsViewModel>(
//       builder: (context, model, child) {
//         final trailCellsViewModel = model.getTrailCellsViewModel();
//         return CustomScrollView(
//           semanticChildCount: trailCellsViewModel.length,
//           slivers: <Widget>[
//             CupertinoSliverNavigationBar(
//               largeTitle: Text('Shopping Cart'),
//             ),
//             SliverSafeArea(
//               // BEGINNING OF NEW CONTENT
//               top: false,
//               minimum: const EdgeInsets.only(top: 8),
//               sliver: SliverList(
//                 delegate: SliverChildBuilderDelegate(
//                       (context, index) {
//                     if (index < trailCellsViewModel.length) {
//                       return Text(trailCellsViewModel[index].trail.title);
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//             )
//           ],
//         );
//       },
//     );
//   }
// }