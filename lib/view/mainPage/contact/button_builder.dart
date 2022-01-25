import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({
    //this.child,
    // this.color,
    // this.txtColor,
    this.onpressed,
    // this.borderColor,
    this.assetName,
    this.text,
  });
  //final Widget? child;
  // final Color? color;
  // final Color? txtColor;
  final VoidCallback? onpressed;
  // final Color? borderColor;
  final String? assetName;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: MaterialButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 35,
              width: 35,
              child: Image.asset(assetName!),
            ),
            Text(text!,
                //style: Theme.of(context).textTheme.headline6,
                style: TextStyle(
                  //color: Colors.black,
                  fontSize: 20,
                )),
            Opacity(
              opacity: 0.0,
              child: SizedBox(
                height: 35,
                width: 35,
                child: Image.asset(assetName!),
              ),
            ),
          ],
        ),
        color: Colors.white,
        textColor: Color(0xff1C846B),
        onPressed: onpressed,
        //obscureText:
        shape: RoundedRectangleBorder(
            //side: BorderSide(color: borderColor!),
            borderRadius: BorderRadius.all(Radius.circular(15))),
      ),
    );
  }
}
