###
The main controller for the app. The controller:
- retrieves and persist the model via the todoStorage service
- exposes the model to the template and provides event handlers
###
todomvc.controller "TodoCtrl", TodoCtrl = ($scope, $location, Todo, filterFilter) ->
  $scope.newTodo = ""
  $scope.editedTodo = null
  $location.path "/"  if $location.path() is ""
  $scope.location = $location
  $scope.$watch "location.path()", (path) ->
    $scope.statusFilter = (if (path is "/active") then completed: false else (if (path is "/completed") then completed: true else null))

  $scope.retrieveTodos = ->
    $scope.todos = Todo.query {}
  $scope.retrieveTodos()

  $scope.$watch "remainingCount == 0", (val) ->
    $scope.allChecked = val

  $scope.$watch "todos", ->
    $scope.remainingCount = filterFilter($scope.todos,
      completed: false
    ).length
  , true

  $scope.addTodo = ->
    return  if $scope.newTodo.length is 0
    $scope.todos.push Todo.save
      title: $scope.newTodo
      completed: false

    $scope.newTodo = ""

  $scope.editTodo = (todo) ->
    $scope.editedTodo = todo

  $scope.doneEditing = (todo) ->
    $scope.editedTodo = null
    $scope.removeTodo todo  unless todo.title
    Todo.save { id: todo.id }, todo

  $scope.removeTodo = (todo) ->
    $scope.todos.splice $scope.todos.indexOf(todo), 1
    todo.$remove()

  $scope.todoCompleted = (todo) ->
    todo.$update()

  $scope.clearCompletedTodos = ->
    $scope.todos.filter (val) ->
      val.completed
    .forEach (todo) ->
      $scope.removeTodo todo

  $scope.markAll = (completed) ->
    $scope.todos.forEach (todo) ->
      todo.completed = completed
