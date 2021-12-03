import 'package:flutter/material.dart';

SizedBox remove(VoidCallback f){
  return SizedBox(height:40,child: FloatingActionButton(heroTag: null,onPressed: f,child: const Icon(Icons.remove,color: Colors.white,),backgroundColor: const Color(0xFF4C4F5E),));
}
SizedBox add(VoidCallback f){
  return SizedBox(height:40,child: FloatingActionButton(heroTag:null,onPressed: f,child: const Icon(Icons.add,color: Colors.white,),backgroundColor: const Color(0xFF4C4F5E)));
}