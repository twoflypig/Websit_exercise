from pyramid.view import view_config
import json

@view_config(route_name='home', renderer="templates/dashboard.mako")
def my_view(request):
    res = []
    for i in range(0,3):
        res.append(
            {
                'id_number':1,
                'name': str(i)+'Morty',
                'v1':str(i*2),
                'v2':str(i*3),
                'v3':str(i*4)
            }
        )

    return {'rows': res}


@view_config(route_name='personal_config', renderer="templates/config.mako")
def config_personal(request):

    return {'project': 'dashboard'}

@view_config(route_name='chart_data', renderer="json")
def chat_data(request):
    print("getting:", request.params['entity'])
    return json.dumps({'state': 'success','data':[15339, 21345, 18483, 24003, 23489, 24092, 12034]})

@view_config(route_name='home_page', renderer="templates/home.mako")
def home_page(request):

    return {'project': 'dashboard'}
