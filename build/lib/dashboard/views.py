from pyramid.view import view_config


@view_config(route_name='home', renderer="templates/mytemplate.mako")
def my_view(request):
    return {'project': 'dashboard'}


@view_config(route_name='/', renderer="templates/dashboard.mako")
def my_view(request):

    return {'project': 'dashboard'}
