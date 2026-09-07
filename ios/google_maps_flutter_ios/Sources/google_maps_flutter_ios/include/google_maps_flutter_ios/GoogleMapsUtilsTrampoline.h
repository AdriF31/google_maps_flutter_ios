// Copyright 2013 The Flutter Authors
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifdef GOOGLE_MAPS_FLUTTER_SPM
// Under SPM, GoogleMapsUtils is a Swift-only module that ObjC cannot
// import; the ObjC types live in GoogleMapsUtilsObjC.
@import GoogleMapsUtilsObjC;
#else
@import GoogleMapsUtils;
#endif
