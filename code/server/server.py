from flask import *
from Database.engine import *
from Database import api as bd


app = Flask(__name__)


# set optional bootswatch theme
app.config['FLASK_ADMIN_SWATCH'] = 'cerulean'

#admin = Admin(app, name='microblog', template_mode='bootstrap3')
# Add administrative views here


@app.route('/home/shows', methods=['GET'])
def getHomeShows():
    shows = bd.getHomeShows()
    return jsonify(shows)

@app.route('/home/shows/content/<user_id>', methods=['GET'])
def getSuggestionsContent(user_id):
    shows = findSuggestionsFromContent(user_id, engine)
    return jsonify(shows)

@app.route('/home/shows/users/<user_id>', methods=['GET'])
def getSuggestionsUsers(user_id):
    shows = findSuggestionsFromUsers(user_id)
    return jsonify(shows)

@app.route('/home/genre/<user_id>', methods=['GET'])
def getFavoriteGenres(user_id):
    genres = bd.getFavoriteGenres(user_id)
    return jsonify(genres)

@app.route('/home/shows/user/<user_id>', methods=['GET'])
def getHomeUserShows(user_id):
    shows = bd.getHomeUserLikeShows(user_id)
    return jsonify(shows)

@app.route('/shows/id/<id_show>', methods=['GET'])
def getShowByID(id_show):
    show = bd.getShowByID(id_show)
    return jsonify(show)

@app.route('/shows/similare/id/<id_show>', methods=['GET'])
def getSimilareShowByID(id_show):
    shows = findSimilarShows(engine, id_show)
    return jsonify(shows)

@app.route('/home/shows/genre/<user_id>/<genre>', methods=['GET'])
def getHomeShowsByGenre(user_id, genre):
    shows = bd.getHomeShowsByGenre(genre,user_id)
    return jsonify(shows)


# Create user and genre
@app.route('/create/users', methods=['POST'])
def signUp():
    user = request.get_json()
    login = user['login']
    password = user['password']
    genre = user["genre"]
    user = bd.signUp(login, password,genre)
    user = bd.signIn(login, password)
    if user is None:
        return json.dumps({"error": "error"}), 404
    return jsonify(user)



@app.route('/users', methods=['POST'])
def signIn():
    print("users")
    user = request.get_json()
    login = user['login']
    password = user['password']
    user = bd.signIn(login, password)
    if user is None:
        return json.dumps({"error": "error"}), 404
    return jsonify(user)

if __name__ == '__main__':
    engine = Engine()
    engine.start_engine()
    app.run(host='192.168.1.132')
    app.run(debug=True)

