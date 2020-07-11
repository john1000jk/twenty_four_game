import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import './home.dart';
import './time_trial.dart';
import './normal.dart';
import './numbers.dart';

class OpButton extends StatefulWidget {
  final int index;
  final NumbersState parent;

  OpButton(this.index, this.parent);

  @override
  State<StatefulWidget> createState() {
    return _OpButtonState();
  }
}

class _OpButtonState extends State<OpButton> {
  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        border: widget.parent.opSelected[widget.index]
            ? Border.all(color: Colors.black, width: 1.0)
            : Border.all(color: Colors.white, width: 0.0),
        color: Colors.white,
        shape: BoxShape.rectangle,
      ),
      child: FittedBox(
        fit: BoxFit.contain,
        child: IconButton(
          onPressed: () => widget.parent.setState(
            () {
              for (int i = 0; i < widget.parent.opSelected.length; i++) {
                if (i != widget.index) {
                  widget.parent.changeOPSelected(i, false);
                } else {
                  widget.parent
                      .changeOPSelected(widget.index, !widget.parent.opSelected[widget.index]);
                }
              }
            },
          ),
          icon: widget.parent.operators[widget.index],
          iconSize: widget.index != 3 ? 10000 : 150,
        ),
      ),
    );
  }
}
