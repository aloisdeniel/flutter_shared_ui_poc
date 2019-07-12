// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// Synced 2019-06-03T11:09:26.955527.

import 'arena.dart';
import 'events.dart';
import 'recognizer.dart';

/// A gesture recognizer that eagerly claims victory in all gesture arenas.
///
/// This is typically passed in [AndroidView.gestureRecognizers] in order to immediately dispatch
/// all touch events inside the view bounds to the embedded Android view.
/// See [AndroidView.gestureRecognizers] for more details.
class EagerGestureRecognizer extends OneSequenceGestureRecognizer {
  /// Create an eager gesture recognizer.
  ///
  /// {@macro flutter.gestures.gestureRecognizer.kind}
  EagerGestureRecognizer({PointerDeviceKind kind}) : super(kind: kind);

  @override
  void addAllowedPointer(PointerDownEvent event) {
    // We call startTrackingPointer as this is where OneSequenceGestureRecognizer joins the arena.
    startTrackingPointer(event.pointer);
    resolve(GestureDisposition.accepted);
    stopTrackingPointer(event.pointer);
  }

  @override
  String get debugDescription => 'eager';

  @override
  void didStopTrackingLastPointer(int pointer) {}

  @override
  void handleEvent(PointerEvent event) {}
}
