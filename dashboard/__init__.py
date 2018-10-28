from pyramid.config import Configurator


def main(global_config, **settings):
    """ This function returns a Pyramid WSGI application.
    """
    config = Configurator(settings=settings)
    config.include('pyramid_mako')

    config.add_static_view('static', 'static', cache_max_age=3600)
    config.add_route('home', '/')
    config.add_route('personal_config', 'config')
    config.add_route('chart_data', 'chart_data')
    config.add_route('home_page', 'home_page')

    config.scan()
    return config.make_wsgi_app()
