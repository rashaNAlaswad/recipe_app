import 'package:flutter/cupertino.dart';

class SearchBar extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;

  const SearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onClear,
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: CupertinoTextField(
        controller: widget.controller,
        placeholder: 'Search meals...',
        padding: const EdgeInsets.all(12.0),
        decoration: const BoxDecoration(),
        prefix: const Padding(
          padding: EdgeInsets.only(left: 12.0),
          child: Icon(CupertinoIcons.search, size: 20),
        ),
        suffix: widget.controller.text.isNotEmpty
            ? CupertinoButton(
                onPressed: widget.onClear,
                child: const Icon(CupertinoIcons.clear_circled_solid, size: 20),
              )
            : null,
        onChanged: widget.onChanged,
      ),
    );
  }
}
