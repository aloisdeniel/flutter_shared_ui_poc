// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// TODO(flutter_web): the Web-only API below need to be cleaned up.

part of ui;

/// Used to track when the platform is initialized. This ensures the test fonts
/// are available.
Future<void> _testPlatformInitializedFuture;

/// If the platform is already initialized (by a previous test), then run the test
/// body immediately. Otherwise, initialize the platform then run the test.
Future<dynamic> ensureTestPlatformInitializedThenRunTest(
    dynamic Function() body) => throw UnsupportedError('');

/// This setter is used by [WebNavigatorObserver] to update the url to
/// reflect the [Navigator]'s current route name.
set webOnlyRouteName(String routeName) => throw UnsupportedError('');

/// Used to track when the platform is initialized. This ensures the test fonts
/// are available.
Future<void> _platformInitializedFuture;

/// Initializes domRenderer with specific devicePixelRation and physicalSize.
Future<void> webOnlyInitializeTestDomRenderer({double devicePixelRatio = 3.0}) => throw UnsupportedError('');