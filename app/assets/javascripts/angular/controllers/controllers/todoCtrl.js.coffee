#global todomvc 
"use strict"

###
The main controller for the app. The controller:
- retrieves and persist the model via the todoStorage service
- exposes the model to the template and provides event handlers
###
todomvc.controller "TodoCtrl", TodoCtrl = ($scope, $location, todoStorage, filterFilter) ->
  todos = $scope.todos = todoStorage.get()
  $scope.newTodo = ""
  $scope.remainingCount = filterFilter(todos,
    completed: false
  ).length
  $scope.editedTodo = null
  $location.path "/"  if $location.path() is ""
  $scope.location = $location
  $scope.$watch "location.path()", (path) ->
    $scope.statusFilter = (if (path is "/active") then completed: false else (if (path is "/completed") then completed: true else null))

  $scope.$watch "remainingCount == 0", (val) ->
    $scope.allChecked = val

  $scope.addTodo = ->
    return  if $scope.newTodo.length is 0
    todos.push
      title: $scope.newTodo
      completed: false

    todoStorage.put todos
    $scope.newTodo = ""
    $scope.remainingCount++

  $scope.editTodo = (todo) ->
    $scope.editedTodo = todo

  $scope.doneEditing = (todo) ->
    $scope.editedTodo = null
    $scope.removeTodo todo  unless todo.title
    todoStorage.put todos

  $scope.removeTodo = (todo) ->
    $scope.remainingCount -= (if todo.completed then 0 else 1)
    todos.splice todos.indexOf(todo), 1
    todoStorage.put todos

  $scope.todoCompleted = (todo) ->
    if todo.completed
      $scope.remainingCount--
    else
      $scope.remainingCount++
    todoStorage.put todos

  $scope.clearCompletedTodos = ->
    $scope.todos = todos = todos.filter((val) ->
      not val.completed
    )
    todoStorage.put todos

  $scope.markAll = (completed) ->
    todos.forEach (todo) ->
      todo.completed = completed

    $scope.remainingCount = (if completed then 0 else todos.length)
    todoStorage.put todos

