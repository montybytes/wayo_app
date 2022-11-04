import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wayo/configs/enums.dart';
import 'package:wayo/configs/theme_dark.dart';
import 'package:wayo/configs/theme_light.dart';
import 'package:wayo/exception.dart';
import 'package:wayo/locator.dart';
import 'package:wayo/repositories/map_repository.dart';
import 'package:wayo/repositories/settings_repository.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(const MapState()) {
    on<InitializeMap>(_onInitializeMap);
  }

  void _onInitializeMap(
    InitializeMap event,
    Emitter<MapState> emit,
  ) async {
    emit(state.copyWith(status: LoadingStatus.loading));
    try {
      final mapRepo = locator.get<MapRepository>();
      final settingsRepo = locator.get<SettingsReposistory>();

      final themeMode = await settingsRepo.getThemeMode();
      String? mapThemeConfig;

      switch (themeMode) {
        case ThemeMode.light:
          mapThemeConfig = mapLightThemeConfig;
          break;
        case ThemeMode.dark:
          mapThemeConfig = mapDarkThemeConfig;
          break;
        default:
      }

      emit(state.copyWith(
        status: LoadingStatus.success,
        initialLocation: await mapRepo.getLocation(),
        currentLocation: await mapRepo.getLocationUpdates(),
        mapThemeConfig: mapThemeConfig,
      ));
    } on CustomException {
      emit(state.copyWith(status: LoadingStatus.failure));
    }
  }
}
