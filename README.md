# flutter_shared_ui_poc

> **DISCLAIMER:**
>
> This project is just a temporary workaround for sharing more code between platforms. At one point, Flutter Web will be merged into the main repository and you will be able to generate a web app from an existing mobile app (more info [here](https://github.com/flutter/flutter/wiki/Building-a-web-application-with-Flutter) and [here](https://github.com/flutter/flutter/issues/34082)). Obviously, it is recommended to wait for the merge.

Today, flutter and flutter_web are two distinct frameworks, so user intefaces can't be shared between a mobile and a web app.

This project demonstrates a principle for sharing UI code between flutter and flutter_web based on conditional imports.

## Architecture

The project contains two different parts.

### [flutter_stub](flutter_stub)

A plain dart package that abstracts every common flutter APIs (and depends neither on `dart:io` and `dart:html`). I just added the widgets used for the POC, but a generator could be implemented to analyse common APIs and generate stubs for all types and methods.

### [flutter_cross](flutter_cross)

This package exposes the right API regarding the current target : `flutter_web` if `dart:html` is available, `flutter` if `dart:io` is available, else `flutter_stub`.

### [example](example)

The example project that shows a [mobile](example/mobile) and a [web app](example/webapp) that uses a Widget that is declared in a third [shared_ui project](example/shared_ui).

## The trick

The interresting part is in the [flutter_cross/material.dart](flutter_cross/lib/material.dart) file.

```dart
export 'package:flutter_stub/material.dart'
  // ignore: uri_does_not_exist
  if (dart.library.html) 'package:flutter_web/material.dart'
  // ignore: uri_does_not_exist
  if (dart.library.io) 'package:flutter/material.dart';
```

This conditional exports tell the compiler that it should override the default stubs for the dedicated platform dependencies.
