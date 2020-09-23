import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:zootracker/Model/Trail.dart';

class FormViewController {
  DateTime selectedDate = DateTime.now();
  TextEditingController dateController;
  TextEditingController titleController;
  TextEditingController locationController;
  TextEditingController notesController;

  File trailBanner;
  bool isReadOnly;

  Trail trail;

  _communInit() {
    this.dateController = TextEditingController();
    this.titleController = TextEditingController();
    this.locationController = TextEditingController();
    this.notesController = TextEditingController();
  }

  FormViewController(bool readOnly) {
    _communInit();
    this.isReadOnly = readOnly;
  }

  FormViewController.loadingTrail(bool readOnly, Trail trail) {
    _communInit();
    this.isReadOnly = readOnly;
    this.trail = trail;
    this.selectedDate = trail.date;
    this.titleController.text = trail.title;
    this.dateController.text = "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
  }
}