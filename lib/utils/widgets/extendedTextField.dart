import 'package:flutter/cupertino.dart';

class ActionPayload {
  final Function onTap;
  final IconData icon;

  Function get _onTap => onTap;
  IconData get _icon => icon;

  const ActionPayload({
    @required this.onTap,
    @required this.icon,
  });
}

class ExtendedTextField extends StatefulWidget {
  const ExtendedTextField({
    Key key,
    @required this.placeholder,
    this.prefixIcon,
    this.action,
    this.onChanged,
    this.color = CupertinoColors.systemGrey3,
    this.textInputType = TextInputType.text,
    this.boxPadding = const EdgeInsets.all(10.0),
    this.textPadding = const EdgeInsets.fromLTRB(10.0, 5.0, 5.0, 5.0),
    this.radiusCircular = const Radius.circular(8.0),
    this.obscure = false,
  }) : super(key: key);

  final String placeholder;
  final Color color;
  final TextInputType textInputType;
  final Radius radiusCircular;
  final EdgeInsetsGeometry textPadding;
  final EdgeInsetsGeometry boxPadding;
  final bool obscure;
  final IconData prefixIcon;
  final ActionPayload action;
  final Function onChanged;

  @override
  _ExtendedTextFieldState createState() => _ExtendedTextFieldState();
}

class _ExtendedTextFieldState extends State<ExtendedTextField> {
  Color _color;
  IconData _prefixIcon;
  IconData _actionIcon;
  bool _obscure;

  void _setColor(Color color) => setState(() => _color = color);
  void _setPrefixIcon(IconData icon) => setState(() => _prefixIcon = icon);
  void _setActionIcon(IconData icon) => setState(() => _actionIcon = icon);
  void _toggleObscure() => setState(() => _obscure = !_obscure);

  Widget _buildPrefixIcon() {
    return _prefixIcon != null ? Icon(_prefixIcon, color: _color) : Container();
  }

  Widget _buildActionIcon() {
    return _actionIcon != null ? Icon(_actionIcon, color: _color) : Container();
  }

  Widget _buildTextField() {
    return CupertinoTextField(
      enabled: true,
      keyboardType: widget.textInputType,
      padding: widget.textPadding,
      placeholder: widget.placeholder,
      onChanged: widget.onChanged,
      autocorrect: false,
      obscureText: _obscure,
      style: null,
      decoration: null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: _color),
        borderRadius: BorderRadius.all(widget.radiusCircular),
      ),
      child: Padding(
        padding: widget.boxPadding,
        child: Row(
          children: [
            _buildPrefixIcon(),
            Expanded(child: _buildTextField()),
            GestureDetector(
              child: this._buildActionIcon(),
              onTap: widget?.action?._onTap ?? () => {},
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _color = widget.color;
    _obscure = widget.obscure;
    _prefixIcon = widget.prefixIcon;
    _actionIcon = widget?.action?.icon;
  }
}
