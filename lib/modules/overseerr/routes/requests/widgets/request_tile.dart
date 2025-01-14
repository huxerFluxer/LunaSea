import 'package:flutter/material.dart';
import 'package:lunasea/core.dart';
import 'package:lunasea/modules/overseerr.dart';

class OverseerrRequestTile extends StatelessWidget {
  final OverseerrRequest request;

  OverseerrRequestTile({
    Key key,
    @required this.request,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LunaTwoLineCardWithPoster(
      title: request.requestedBy.displayName ?? 'overseerr.UnknownUser'.tr(),
      subtitle1: TextSpan(text: 'Placeholder 1'),
      subtitle2: TextSpan(text: 'Placeholder 2'),
      posterPlaceholder: LunaAssets.blankUser,
      posterHeaders: context.read<OverseerrState>().headers,
      posterUrl: request.requestedBy.avatar,
    );
  }
}
