import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required this.tr,
    required this.onEdit,
    required this.onRemove,
  });

  final Transaction tr;
  final void Function(Transaction) onEdit;
  final void Function(String) onRemove;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(child: Text('R\$${tr.value}')),
          ),
        ),
        title: Text(tr.title, style: Theme.of(context).textTheme.titleLarge),
        subtitle: Text(
          DateFormat("d 'de' MMM 'de' y").format(tr.date),
          style: const TextStyle(color: Colors.grey),
        ),
        trailing: MediaQuery.of(context).size.width > 480
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton.icon(
                    onPressed: () => onEdit(tr),
                    icon: const Icon(Icons.edit),
                    label: const Text('Editar'),
                    style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () => onRemove(tr.id),
                    icon: const Icon(Icons.delete),
                    label: const Text('Excluir'),
                    style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ],
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    color: Theme.of(context).colorScheme.primary,
                    onPressed: () => onEdit(tr),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    color: Theme.of(context).colorScheme.error,
                    onPressed: () => onRemove(tr.id),
                  ),
                ],
              ),
      ),
    );
  }
}
