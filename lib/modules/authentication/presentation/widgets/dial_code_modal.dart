import 'package:flutter/material.dart';
import 'package:vestrollmobile/modules/authentication/presentation/bloc/personal_details_bloc.dart';

class DialCodeModal extends StatefulWidget {
  final List<Country> countries;
  final void Function(Country) onSelected;
  final bool showDialCode;
  const DialCodeModal({
    super.key,
    required this.countries,
    required this.onSelected,
    this.showDialCode = true,
  });

  @override
  State<DialCodeModal> createState() => _DialCodeModalState();
}

class _DialCodeModalState extends State<DialCodeModal> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final filtered =
        widget.countries.where((c) {
          final q = _query.toLowerCase();
          return c.name.toLowerCase().contains(q) ||
              c.dialCode.toLowerCase().contains(q) ||
              c.code.toLowerCase().contains(q);
        }).toList();

    return Container(
      padding: const EdgeInsets.only(top: 12, left: 16, right: 16, bottom: 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(width: 48, height: 4, color: Colors.grey[300]),
          const SizedBox(height: 12),
          TextField(
            key: const Key('country_search'),
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Search',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide.none,
              ),
              filled: true,
              contentPadding: EdgeInsets.symmetric(vertical: 10),
            ),
            onChanged: (v) => setState(() => _query = v),
          ),
          const SizedBox(height: 12),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.5,
            ),
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final c = filtered[index];
                return ListTile(
                  key: Key('country_item_${c.code}'),
                  leading: Text(c.flag, style: const TextStyle(fontSize: 20)),
                  title: Text(c.name),
                  trailing: widget.showDialCode ? Text(c.dialCode) : null,
                  onTap: () {
                    widget.onSelected(c);
                    Navigator.of(context).pop();
                  },
                );
              },
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemCount: filtered.length,
            ),
          ),
        ],
      ),
    );
  }
}
