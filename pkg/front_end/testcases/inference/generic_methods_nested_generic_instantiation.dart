// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/*@testedFeatures=inference*/
library test;

import 'dart:math' as math;

class Trace {
  List<Frame> frames = /*@typeArgs=Frame*/ [];
}

class Frame {
  String location = '';
}

main() {
  List<Trace> traces = /*@typeArgs=Trace*/ [];
  var /*@type=int*/ longest = /*@promotedType=none*/ traces
      .map(/*@returnType=int*/ (/*@type=Trace*/ trace) {
    return trace.frames
        .map(/*@returnType=int*/ (/*@type=Frame*/ frame) =>
            frame.location.length)
        .fold(0, math.max);
  }).fold(0, math.max);
}
