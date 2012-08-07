// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

#library('newform');
#import('dart:html');
#import('component.dart');
#import('model.dart');
#import('../../../watcher.dart');

/** The component associated with 'newform.html' (written by user). */
class FormComponent extends _FormComponent {
  void addTodo() {
    app.todos.add(new Todo(_newTodo.value));
    _newTodo.value = '';
  }

  FormComponent(root, elem) : super(root, elem);
}

/** Portions of the component autogenerated from the template. */
class _FormComponent extends Component {
  _FormComponent(root, elem) : super('x-todo-form', root, elem);

  InputElement _newTodo;
  EventListener _listener1;

  void created() {
    _newTodo = root.query("#new-todo");
  }

  void inserted() {
    _listener1 = (_) {
      addTodo();
      dispatch();
    };
    _newTodo.on.change.add(_listener1);
  }

  void removed() {
    element.on.change.remove(_listener1);
  }
}
