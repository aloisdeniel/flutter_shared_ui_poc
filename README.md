# flutter_shared_ui_poc

> **DISCLAIMER:**
>
> This project is just a temporary workaround for sharing more code between platforms. At one point, Flutter Web will be merged into the main repository and you will be able to generate a web app from an existing mobile app (more info [here](https://github.com/flutter/flutter/wiki/Building-a-web-application-with-Flutter) and [here](https://github.com/flutter/flutter/issues/34082)). Obviously, it is recommended to wait for the merge (though the code produced with `flutter_cross` will be updated to work also with end configuration).

Today, flutter and flutter_web are two distinct frameworks, so user intefaces can't be shared between a mobile and a web app.

This project demonstrates a principle for sharing UI code between flutter and flutter_web based on conditional imports.

## Usage

To create your cross-platform UI project, you must use the `flutter_cross` package instead of the platform specific framework.

### Use flutter_cross packages from git

The `pubspec.yaml` file of your shared package should have those dependencies :

```yaml
name: flutter_cross_example

environment:
  sdk: '>=2.2.0 <3.0.0'

dependencies:
  flutter_cross: any

# flutter_cross package is not published to pub.dartlang.org
# These overrides tell the package tools to get them from GitHub
dependency_overrides:
  flutter_cross:
    git:
      url: https://github.com/aloisdeniel/flutter_shared_ui_poc
      path: packages/flutter_cross
```

### Update imports

Code your flutter app like you would have with Flutter, except :

* Change imports of `package:flutter` (*or `package:flutter_web`*) to `package:flutter_cross` throughout your application code.
* Change imports of `dart:ui` (*or `package:flutter_web_ui`*) to `package:flutter_cross/ui.dart`.

### Import from platforms

You can share 100% of your app in shared code, or several widgets only.

If you share Widgets and use them in your platform code, you IDE will break because shared `Widgets` arent platform ones by default (even if at compile time they are). Simply **cast them as `dynamic`** in such situation.

## The trick

The interresting parts are in the [flutter_cross](packages/flutter_cross/lib/material.dart) export files.

```dart
export 'package:flutter_stub/material.dart'
  // ignore: uri_does_not_exist
  if (dart.library.html) 'package:flutter_web/material.dart'
  // ignore: uri_does_not_exist
  if (dart.library.io) 'package:flutter/material.dart';
```

This conditional exports tell the compiler that it should override the default stubs for the dedicated platform dependencies.

## Repository's structure

The project contains three different parts.

#### [flutter_stub](packages/flutter_stub) & [flutter_stub_ui](packages/flutter_stub_ui)

A plain dart package that abstracts every common Flutter APIs (and depends neither on `dart:io` and `dart:html`). 

To create those packages, I forked `flutter/flutter_web` repository and :

* `flutter_stub/lib` : all code is the same as `flutter_web/lib` except that imports have been updated.
* `flutter_stub_ui/lib` : the engine html specific code has been manually updated to throw exceptions instead of actual logic.

A generator could be implemented to automate this process.

#### [flutter_cross](packages/flutter_cross)

This package exposes the right API regarding the current target : `flutter_web` if `dart:html` is available, `flutter` if `dart:io` is available, else `flutter_stub`.

#### [example](example)

The example project that shows a [mobile](example/mobile) and a [web app](example/webapp) that uses a Widget that is declared in a third [shared_ui project](example/shared_ui).

All the application is exactly the same as a Flutter one, except that imports should be :

* `flutter_cross/<file>.dart` instead of `flutter/<file>.dart` (or `flutter_web/<file>.dart`)
* `flutter_cross/ui.dart` instead of `dart:ui` (or `flutter_web_ui/ui.dart`)
