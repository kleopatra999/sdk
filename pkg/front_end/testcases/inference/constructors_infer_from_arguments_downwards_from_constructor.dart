// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/*@testedFeatures=inference*/
library test;

class C<T> {
  C(List<T> list);
}

main() {
  var /*@type=C<int>*/ x = /*@typeArgs=int*/ new C(/*@typeArgs=int*/ [123]);
  C<int> y = /*@promotedType=none*/ x;

  var /*@type=C<dynamic>*/ a = new C<dynamic>(/*@typeArgs=dynamic*/ [123]);

  // This one however works.
  var /*@type=C<Object>*/ b = new C<Object>(/*@typeArgs=Object*/ [123]);
}
