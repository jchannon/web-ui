// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

#library('toggleall');
#import('dart:html');
#import('component.dart');
#import('model.dart');
#import('../../../watcher.dart');

/** The component associated with 'toggleall.html' (written by user). */
class ToggleComponent extends _ToggleComponent {

  bool get allChecked () => app.todos.length > 0 && 
      app.todos.every((t) => t.done);

  ToggleComponent(root, elem) : super(root, elem);

  void markAll() => app.todos.forEach((t) { t.done = _toggleAll.checked; });
}

/** Portions of the component autogenerated from the template. */
class _ToggleComponent extends Component {

  _ToggleComponent(root, elem) : super('toggleall', root, elem);

  InputElement _toggleAll; // Name generated from the id from the element.
  WatcherDisposer _stopWatcher1;
  EventListener _listener1;

  void created()  {
    _toggleAll = root.query("#toggle-all");
  }

  void inserted() {
    _listener1 = (_) {
      markAll();
      _toggleAll.checked = allChecked;
      dispatch();
    };
    _toggleAll.on.click.add(_listener1);
    _stopWatcher1 = bind(() => allChecked, (e) {
      _toggleAll.checked = e.newValue;
    });
  }

  void removed() {
    _toggleAll.on.click.remove(_listener1);
    _stopWatcher1();
  }
}
