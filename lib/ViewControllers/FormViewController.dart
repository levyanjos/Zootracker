import 'dart:io';
import 'package:flutter/cupertino.dart';

class FormViewController {
  DateTime selectedDate = DateTime.now();
  TextEditingController dateController;
  TextEditingController titleController;
  TextEditingController locationController;
  TextEditingController notesController;

  File trailBanner;
  bool isReadOnly;

  FormViewController(bool readOnly) {
    this.dateController = TextEditingController();
    this.titleController = TextEditingController();
    this.locationController = TextEditingController();
    this.notesController = TextEditingController();
    this.isReadOnly = readOnly;
  }

}