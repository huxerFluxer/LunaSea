import 'dart:io';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:lunasea/core.dart';
import 'package:lunasea/modules.dart';

class LunaRouter {
  static FluroRouter router = FluroRouter();
  static TransitionType get transitionType {
    // Required otherwise no transition is executed
    if (Platform.isMacOS) return TransitionType.cupertino;
    return TransitionType.native;
  }

  /// Calls `defineAllRoutes()` on all module routers that implement [LunaModuleRouter].
  void initialize() {
    router.notFoundHandler = Handler(
      handlerFunc: (context, params) => LunaInvalidRoute(),
    );
    DashboardRouter().defineAllRoutes(router);
    ExternalModulesRouter().defineAllRoutes(router);
    OverseerrRouter().defineAllRoutes(router);
    RadarrRouter().defineAllRoutes(router);
    SearchRouter().defineAllRoutes(router);
    SettingsRouter().defineAllRoutes(router);
    SonarrRouter().defineAllRoutes(router);
    TautulliRouter().defineAllRoutes(router);
  }

  /// **Will be removed when all module routers are integrated.**
  ///
  /// Returns a map of all module routes.
  Map<String, WidgetBuilder> get routes => <String, WidgetBuilder>{
        ..._lidarr,
        ..._sabnzbd,
        ..._nzbget,
      };

  Map<String, WidgetBuilder> get _lidarr => <String, WidgetBuilder>{
        Lidarr.ROUTE_NAME: (context) => Lidarr(),
        LidarrAddSearch.ROUTE_NAME: (context) => LidarrAddSearch(),
        LidarrAddDetails.ROUTE_NAME: (context) => LidarrAddDetails(),
        LidarrEditArtist.ROUTE_NAME: (context) => LidarrEditArtist(),
        LidarrDetailsAlbum.ROUTE_NAME: (context) => LidarrDetailsAlbum(),
        LidarrDetailsArtist.ROUTE_NAME: (context) => LidarrDetailsArtist(),
        LidarrSearchResults.ROUTE_NAME: (context) => LidarrSearchResults(),
      };

  Map<String, WidgetBuilder> get _nzbget => <String, WidgetBuilder>{
        NZBGet.ROUTE_NAME: (context) => NZBGet(),
        NZBGetStatistics.ROUTE_NAME: (context) => NZBGetStatistics(),
      };

  Map<String, WidgetBuilder> get _sabnzbd => <String, WidgetBuilder>{
        SABnzbd.ROUTE_NAME: (context) => SABnzbd(),
        SABnzbdStatistics.ROUTE_NAME: (context) => SABnzbdStatistics(),
        SABnzbdHistoryStages.ROUTE_NAME: (context) => SABnzbdHistoryStages(),
      };
}
