from flask import Flask, jsonify
from flask_restful import Api, Resource, reqparse
from flask_cors import CORS

from services import user

app = Flask(__name__)
cors = CORS(app)
CORS(app, support_credentials=True)
api = Api(app, prefix="/api", catch_all_404s=True)
app.config['SECRET_KEY'] = 'Thisissupposedtobesecret!'

UPLOAD_FOLDER = 'static/picture/'
ALLOWED_EXTENSIONS = ['png', 'jpg', 'jpeg']
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER


class Register(Resource):
    def post(self):
        parser = reqparse.RequestParser()
        parser.add_argument('Name', required=True, type=str, help='Name cannot be found')
        parser.add_argument('Phoneno', required=True, type=int, help='Phoneno cannot be found')
        parser.add_argument('AadharNo', required=True, type=int, help='AadharNo cannot be found')
        parser.add_argument('Latitude', required=True, type=str, help='Latitude cannot be found')
        parser.add_argument('Longitude', required=True, type=str, help='Longitude cannot be found')
        parser.add_argument('Photo', type=str, required=True, help='Photo From Camera cannot be found')
        args = parser.parse_args()
        return jsonify(user.register(args))


class Login(Resource):
    def post(self):
        parser = reqparse.RequestParser()
        parser.add_argument('AadharNo', required=True, type=int, help='AadharNo cannot be found')
        args = parser.parse_args()
        aadhar = args['AadharNo']
        return jsonify(user.login(aadhar))


class LocationUpdate(Resource):
    def post(self):
        parser = reqparse.RequestParser()
        parser.add_argument('latitude', required=True, type=str, help='latitude cannot be found')
        parser.add_argument('longitude', required=True, type=str, help='longitude cannot be found')
        parser.add_argument('userid', required=True, type=str, help='userid cannot be found')
        args = parser.parse_args()
        return jsonify(user.location_update(args))


api.add_resource(Register, "/register")
api.add_resource(Login, "/login")
api.add_resource(LocationUpdate, "/locationupdate")


if __name__ == '__main__':
    app.run(port='9000', host='0.0.0.0', debug=False)
