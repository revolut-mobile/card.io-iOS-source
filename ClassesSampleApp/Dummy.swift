// Since version 4.4.0, opencv includes swift and objective-c wrappers, so it can be used
// directly without having to wrap the calls in c++.
// See: https://github.com/opencv/opencv/pull/17165
//
// Such wrappers require linking the swift libraries. In swift projects this happens
// automatically, but in Objective-C in order to link the swift files it is necessary to
// add a swift file to the project.
// See: https://github.com/opencv/opencv/issues/19645
