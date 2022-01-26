import 'package:flutter/material.dart';

PhysicalModel physicalModel(context, var x, var c) {
  return PhysicalModel(
    color: c,
    elevation: 8,
    shadowColor: Colors.grey,
    borderRadius: BorderRadius.circular(100),
    child: GestureDetector(
      onTap: () {},
      child: ClipOval(
        child: Container(
          color: Colors.white,
          height: 140.0,
          width: 140.0,
          child: Center(
              child: Text(
            '$x',
            style: Theme.of(context).textTheme.headline3,
            textAlign: TextAlign.center,
          )),
        ),
      ),
    ),
  );
}
