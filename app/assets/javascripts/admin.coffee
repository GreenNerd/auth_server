@admin = {}

admin.getDrawerItemId= ->
  routerOfPathItem =
    'users': 'user_index'
    'router': 'router_show'
    'router/edit': 'router_edit'

  pathMatchPattern = /.*admin\/(.*)/;

  page_path = pathMatchPattern.exec(window.location.pathname);
  if page_path
    page_path = page_path[1];
    if itemId = routerOfPathItem[page_path]
      return itemId
    else
      return routerOfPathItem[page_path.split('/')[0]]
  else
    return undefined;

$(document).ready ->
  itemId = admin.getDrawerItemId();
  if itemId
    console.log itemId;
    $("##{itemId}").addClass 'is-active';
