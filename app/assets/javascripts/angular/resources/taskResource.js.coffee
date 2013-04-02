todomvc.factory 'Todo', ($resource) ->
  $resource '/todos/:id', { id: '@id' },
    update:
      method: 'PUT'
