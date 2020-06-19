  
import 'package:flutter/foundation.dart';

class Person {
  String name;
  String profileImg;
  String allocated_farmers;
  String validated_farmers;
  String non_validated_farmers;
  String daily_inventory_status; 
  String distribution_centers;

  Person({
    this.name,
    this.profileImg,
    this.allocated_farmers,
    this.validated_farmers,
    this.non_validated_farmers,
    this.daily_inventory_status,
    this.distribution_centers,
    });
}