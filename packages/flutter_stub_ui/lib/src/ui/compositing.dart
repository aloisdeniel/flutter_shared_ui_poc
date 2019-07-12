// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

part of ui;

/// An opaque object representing a composited scene.
///
/// To create a Scene object, use a [SceneBuilder].
///
/// Scene objects can be displayed on the screen using the
/// [Window.render] method.
class Scene {
  /// This class is created by the engine, and should not be instantiated
  /// or extended directly.
  ///
  /// To create a Scene object, use a [SceneBuilder].
  Scene._();

  /// Creates a raster image representation of the current state of the scene.
  /// This is a slow operation that is performed on a background thread.
  Future<Image> toImage(int width, int height) {
    if (width <= 0 || height <= 0) {
      throw Exception('Invalid image dimensions.');
    }
    throw UnsupportedError('toImage is not supported on the Web');
    // TODO(flutter_web): Implement [_toImage].
    // return futurize(
    //     (Callback<Image> callback) => _toImage(width, height, callback));
  }

  // String _toImage(int width, int height, Callback<Image> callback) => null;

  /// Releases the resources used by this scene.
  ///
  /// After calling this function, the scene is cannot be used further.
  void dispose() {}
}

/// An opaque handle to a transform engine layer.
///
/// Instances of this class are created by [SceneBuilder.pushTransform].
///
/// {@template dart.ui.sceneBuilder.oldLayerCompatibility}
/// `oldLayer` parameter in [SceneBuilder] methods only accepts objects created
/// by the engine. [SceneBuilder] will throw an [AssertionError] if you pass it
/// a custom implementation of this class.
/// {@endtemplate}
abstract class TransformEngineLayer implements EngineLayer {}

/// An opaque handle to an offset engine layer.
///
/// Instances of this class are created by [SceneBuilder.pushOffset].
///
/// {@macro dart.ui.sceneBuilder.oldLayerCompatibility}
abstract class OffsetEngineLayer implements EngineLayer {}

/// An opaque handle to a clip rect engine layer.
///
/// Instances of this class are created by [SceneBuilder.pushClipRect].
///
/// {@macro dart.ui.sceneBuilder.oldLayerCompatibility}
abstract class ClipRectEngineLayer implements EngineLayer {}

/// An opaque handle to a clip rounded rect engine layer.
///
/// Instances of this class are created by [SceneBuilder.pushClipRRect].
///
/// {@macro dart.ui.sceneBuilder.oldLayerCompatibility}
abstract class ClipRRectEngineLayer implements EngineLayer {}

/// An opaque handle to a clip path engine layer.
///
/// Instances of this class are created by [SceneBuilder.pushClipPath].
///
/// {@macro dart.ui.sceneBuilder.oldLayerCompatibility}
abstract class ClipPathEngineLayer implements EngineLayer {}

/// An opaque handle to an opacity engine layer.
///
/// Instances of this class are created by [SceneBuilder.pushOpacity].
///
/// {@macro dart.ui.sceneBuilder.oldLayerCompatibility}
abstract class OpacityEngineLayer implements EngineLayer {}

/// An opaque handle to a color filter engine layer.
///
/// Instances of this class are created by [SceneBuilder.pushColorFilter].
///
/// {@macro dart.ui.sceneBuilder.oldLayerCompatibility}
abstract class ColorFilterEngineLayer implements EngineLayer {}

/// An opaque handle to a backdrop filter engine layer.
///
/// Instances of this class are created by [SceneBuilder.pushBackdropFilter].
///
/// {@macro dart.ui.sceneBuilder.oldLayerCompatibility}
abstract class BackdropFilterEngineLayer implements EngineLayer {}

/// An opaque handle to a shader mask engine layer.
///
/// Instances of this class are created by [SceneBuilder.pushShaderMask].
///
/// {@macro dart.ui.sceneBuilder.oldLayerCompatibility}
abstract class ShaderMaskEngineLayer implements EngineLayer {}

/// An opaque handle to a physical shape engine layer.
///
/// Instances of this class are created by [SceneBuilder.pushPhysicalShape].
///
/// {@macro dart.ui.sceneBuilder.oldLayerCompatibility}
abstract class PhysicalShapeEngineLayer implements EngineLayer {}

/// Builds a [Scene] containing the given visuals.
///
/// A [Scene] can then be rendered using [Window.render].
///
/// To draw graphical operations onto a [Scene], first create a
/// [Picture] using a [PictureRecorder] and a [Canvas], and then add
/// it to the scene using [addPicture].
class SceneBuilder {
  /// Creates an empty [SceneBuilder] object.
  factory SceneBuilder() => throw UnsupportedError('');

  SceneBuilder._() { throw UnsupportedError('');
  }

  factory SceneBuilder.layer() => throw UnsupportedError('');


  /// Pushes an offset operation onto the operation stack.
  ///
  /// This is equivalent to [pushTransform] with a matrix with only translation.
  ///
  /// See [pop] for details about the operation stack.
  OffsetEngineLayer pushOffset(double dx, double dy,
      {OffsetEngineLayer oldLayer}) => throw UnsupportedError('');

  /// Pushes a transform operation onto the operation stack.
  ///
  /// The objects are transformed by the given matrix before rasterization.
  ///
  /// See [pop] for details about the operation stack.
  TransformEngineLayer pushTransform(Float64List matrix4,
      {TransformEngineLayer oldLayer}) => throw UnsupportedError('');

  /// Pushes a rectangular clip operation onto the operation stack.
  ///
  /// Rasterization outside the given rectangle is discarded.
  ///
  /// See [pop] for details about the operation stack, and [Clip] for different clip modes.
  /// By default, the clip will be anti-aliased (clip = [Clip.antiAlias]).
  ClipRectEngineLayer pushClipRect(Rect rect,
      {Clip clipBehavior = Clip.antiAlias, ClipRectEngineLayer oldLayer}) => throw UnsupportedError('');

  /// Pushes a rounded-rectangular clip operation onto the operation stack.
  ///
  /// Rasterization outside the given rounded rectangle is discarded.
  ///
  /// See [pop] for details about the operation stack.
  ClipRRectEngineLayer pushClipRRect(RRect rrect,
      {Clip clipBehavior, ClipRRectEngineLayer oldLayer}) => throw UnsupportedError('');

  /// Pushes a path clip operation onto the operation stack.
  ///
  /// Rasterization outside the given path is discarded.
  ///
  /// See [pop] for details about the operation stack.
  ClipPathEngineLayer pushClipPath(Path path,
      {Clip clipBehavior = Clip.antiAlias, ClipPathEngineLayer oldLayer}) => throw UnsupportedError('');

  /// Pushes an opacity operation onto the operation stack.
  ///
  /// The given alpha value is blended into the alpha value of the objects'
  /// rasterization. An alpha value of 0 makes the objects entirely invisible.
  /// An alpha value of 255 has no effect (i.e., the objects retain the current
  /// opacity).
  ///
  /// See [pop] for details about the operation stack.
  OpacityEngineLayer pushOpacity(int alpha,
      {OpacityEngineLayer oldLayer, Offset offset = Offset.zero}) => throw UnsupportedError('');

  /// Pushes a color filter operation onto the operation stack.
  ///
  /// The given color is applied to the objects' rasterization using the given
  /// blend mode.
  ///
  /// See [pop] for details about the operation stack.
  ColorFilterEngineLayer pushColorFilter(Color color, BlendMode blendMode,
      {ColorFilterEngineLayer oldLayer}) => throw UnsupportedError('');

  /// Pushes a backdrop filter operation onto the operation stack.
  ///
  /// The given filter is applied to the current contents of the scene prior to
  /// rasterizing the given objects.
  ///
  /// See [pop] for details about the operation stack.
  BackdropFilterEngineLayer pushBackdropFilter(ImageFilter filter,
      {BackdropFilterEngineLayer oldLayer}) => throw UnsupportedError('');

  /// Pushes a shader mask operation onto the operation stack.
  ///
  /// The given shader is applied to the object's rasterization in the given
  /// rectangle using the given blend mode.
  ///
  /// See [pop] for details about the operation stack.
  ShaderMaskEngineLayer pushShaderMask(
      Shader shader, Rect maskRect, BlendMode blendMode,
      {ShaderMaskEngineLayer oldLayer}) => throw UnsupportedError('');

  /// Pushes a physical layer operation for an arbitrary shape onto the
  /// operation stack.
  ///
  /// By default, the layer's content will not be clipped (clip = [Clip.none]).
  /// If clip equals [Clip.hardEdge], [Clip.antiAlias], or [Clip.antiAliasWithSaveLayer],
  /// then the content is clipped to the given shape defined by [path].
  ///
  /// If [elevation] is greater than 0.0, then a shadow is drawn around the layer.
  /// [shadowColor] defines the color of the shadow if present and [color] defines the
  /// color of the layer background.
  ///
  /// See [pop] for details about the operation stack, and [Clip] for different clip modes.
  PhysicalShapeEngineLayer pushPhysicalShape({
    Path path,
    double elevation,
    Color color,
    Color shadowColor,
    Clip clipBehavior = Clip.none,
    PhysicalShapeEngineLayer oldLayer,
  }) => throw UnsupportedError('');

  /// Add a retained engine layer subtree from previous frames.
  ///
  /// All the engine layers that are in the subtree of the retained layer will
  /// be automatically appended to the current engine layer tree.
  ///
  /// Therefore, when implementing a subclass of the [Layer] concept defined in
  /// the rendering layer of Flutter's framework, once this is called, there's
  /// no need to call [addToScene] for its children layers.
  void addRetained(EngineLayer retainedLayer) => throw UnsupportedError('');

  /// Ends the effect of the most recently pushed operation.
  ///
  /// Internally the scene builder maintains a stack of operations. Each of the
  /// operations in the stack applies to each of the objects added to the scene.
  /// Calling this function removes the most recently added operation from the
  /// stack.
  void pop() => throw UnsupportedError('');

  /// Adds an object to the scene that displays performance statistics.
  ///
  /// Useful during development to assess the performance of the application.
  /// The enabledOptions controls which statistics are displayed. The bounds
  /// controls where the statistics are displayed.
  ///
  /// enabledOptions is a bit field with the following bits defined:
  ///  - 0x01: displayRasterizerStatistics - show GPU thread frame time
  ///  - 0x02: visualizeRasterizerStatistics - graph GPU thread frame times
  ///  - 0x04: displayEngineStatistics - show UI thread frame time
  ///  - 0x08: visualizeEngineStatistics - graph UI thread frame times
  /// Set enabledOptions to 0x0F to enable all the currently defined features.
  ///
  /// The "UI thread" is the thread that includes all the execution of
  /// the main Dart isolate (the isolate that can call
  /// [Window.render]). The UI thread frame time is the total time
  /// spent executing the [Window.onBeginFrame] callback. The "GPU
  /// thread" is the thread (running on the CPU) that subsequently
  /// processes the [Scene] provided by the Dart code to turn it into
  /// GPU commands and send it to the GPU.
  ///
  /// See also the [PerformanceOverlayOption] enum in the rendering library.
  /// for more details.
  void addPerformanceOverlay(int enabledOptions, Rect bounds) => throw UnsupportedError('');

  /// Whether we've already warned the user about the lack of the performance
  /// overlay or not.
  ///
  /// We use this to avoid spamming the console with redundant warning messages.
  static bool _webOnlyDidWarnAboutPerformanceOverlay = false;

  /// Adds a [Picture] to the scene.
  ///
  /// The picture is rasterized at the given offset.
  void addPicture(
    Offset offset,
    Picture picture, {
    bool isComplexHint = false,
    bool willChangeHint = false,
  }) => throw UnsupportedError('');

  /// Adds a backend texture to the scene.
  ///
  /// The texture is scaled to the given size and rasterized at the given
  /// offset.
  void addTexture(int textureId,
      {Offset offset = Offset.zero,
      double width = 0.0,
      double height = 0.0,
      bool freeze = false}) => throw UnsupportedError('');

  /// Adds a platform view (e.g an iOS UIView) to the scene.
  ///
  /// Only supported on iOS, this is currently a no-op on other platforms.
  ///
  /// On iOS this layer splits the current output surface into two surfaces, one for the scene nodes
  /// preceding the platform view, and one for the scene nodes following the platform view.
  ///
  /// ## Performance impact
  ///
  /// Adding an additional surface doubles the amount of graphics memory directly used by Flutter
  /// for output buffers. Quartz might allocated extra buffers for compositing the Flutter surfaces
  /// and the platform view.
  ///
  /// With a platform view in the scene, Quartz has to composite the two Flutter surfaces and the
  /// embedded UIView. In addition to that, on iOS versions greater than 9, the Flutter frames are
  /// synchronized with the UIView frames adding additional performance overhead.
  void addPlatformView(
    int viewId, {
    Offset offset = Offset.zero,
    double width = 0.0,
    double height = 0.0,
  }) => throw UnsupportedError('');


  /// (Fuchsia-only) Adds a scene rendered by another application to the scene
  /// for this application.
  void addChildScene(
      {Offset offset = Offset.zero,
      double width = 0.0,
      double height = 0.0,
      SceneHost sceneHost,
      bool hitTestable = true}) => throw UnsupportedError('');

  /// Sets a threshold after which additional debugging information should be
  /// recorded.
  ///
  /// Currently this interface is difficult to use by end-developers. If you're
  /// interested in using this feature, please contact [flutter-dev](https://groups.google.com/forum/#!forum/flutter-dev).
  /// We'll hopefully be able to figure out how to make this feature more useful
  /// to you.
  void setRasterizerTracingThreshold(int frameInterval) {}

  /// Sets whether the raster cache should checkerboard cached entries. This is
  /// only useful for debugging purposes.
  ///
  /// The compositor can sometimes decide to cache certain portions of the
  /// widget hierarchy. Such portions typically don't change often from frame to
  /// frame and are expensive to render. This can speed up overall rendering.
  /// However, there is certain upfront cost to constructing these cache
  /// entries. And, if the cache entries are not used very often, this cost may
  /// not be worth the speedup in rendering of subsequent frames. If the
  /// developer wants to be certain that populating the raster cache is not
  /// causing stutters, this option can be set. Depending on the observations
  /// made, hints can be provided to the compositor that aid it in making better
  /// decisions about caching.
  ///
  /// Currently this interface is difficult to use by end-developers. If you're
  /// interested in using this feature, please contact [flutter-dev](https://groups.google.com/forum/#!forum/flutter-dev).
  void setCheckerboardRasterCacheImages(bool checkerboard) => throw UnsupportedError('');

  /// Sets whether the compositor should checkerboard layers that are rendered
  /// to offscreen bitmaps.
  ///
  /// This is only useful for debugging purposes.
  void setCheckerboardOffscreenLayers(bool checkerboard) => throw UnsupportedError('');


  /// Discards information about previously rendered frames, including DOM
  /// elements and cached canvases.
  ///
  /// After calling this function new canvases will be created for the
  /// subsequent scene. This is useful when tests need predictable canvas
  /// sizes. If the cache is not cleared, then canvases allocated in one test
  /// may be reused in another test.
  static void debugForgetFrameScene() => throw UnsupportedError('');

  /// Finishes building the scene.
  ///
  /// Returns a [Scene] containing the objects that have been added to
  /// this scene builder. The [Scene] can then be displayed on the
  /// screen with [Window.render].
  ///
  /// After calling this function, the scene builder object is invalid and
  /// cannot be used further.
  Scene build() => throw UnsupportedError('');

  /// Set properties on the linked scene.  These properties include its bounds,
  /// as well as whether it can be the target of focus events or not.
  void setProperties(double width, double height, double insetTop,
      double insetRight, double insetBottom, double insetLeft, bool focusable) {
    throw UnimplementedError();
  }
}

/// A handle for the framework to hold and retain an engine layer across frames.
class EngineLayer {}

/// (Fuchsia-only) Hosts content provided by another application.
class SceneHost {
  /// Creates a host for a child scene.
  ///
  /// The export token is bound to a scene graph node which acts as a container
  /// for the child's content.  The creator of the scene host is responsible for
  /// sending the corresponding import token (the other endpoint of the event
  /// pair) to the child.
  ///
  /// The export token is a dart:zircon Handle, but that type isn't
  /// available here. This is called by ChildViewConnection in
  /// //topaz/public/lib/ui/flutter/.
  ///
  /// The scene host takes ownership of the provided export token handle.
  SceneHost(dynamic exportTokenHandle);

  /// Releases the resources associated with the child scene host.
  ///
  /// After calling this function, the child scene host cannot be used further.
  void dispose() {}

  /// Set properties on the linked scene.  These properties include its bounds,
  /// as well as whether it can be the target of focus events or not.
  void setProperties(double width, double height, double insetTop,
      double insetRight, double insetBottom, double insetLeft, bool focusable) {
    throw UnimplementedError();
  }
}
