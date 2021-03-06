import os
from flask_restplus import Api
from flask import url_for
from .apis.root import ns_root


class MyApi(Api):
    @property
    def specs_url(self):
        if os.environ['APP_ENV'].lower() == 'heroku':
            scheme = 'https'
        else:
            scheme = 'http'
        return url_for(self.endpoint('specs'), _external=True, _scheme=scheme)


api = MyApi(version='1.0', title='Task Scherduler API',
            description='Task Scherduler API', doc='/doc/')

api.add_namespace(ns_root)
