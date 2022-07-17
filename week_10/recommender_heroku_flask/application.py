'''
flask app for movie recommendations
'''

from flask import Flask, request, render_template 
from utils import movies, fuzzy_title_to_id, id_to_title # import data read in from other scripts
from recommender import recommend_random # import functions from other scripts


app = Flask(__name__) # instansiate the flask object

@app.route('/') # use a decorator to route the function to a URL
def landing_page():
    return render_template('landing_page.html')

@app.route('/recommendations/test')
def recommendations():
    print(request.args) # shows URL aruments in terminal, not needed, used for explanation
    
    user_inputs = request.args.getlist('user_movies') # stores user_inputs in variable
    
    titles_ids = [fuzzy_title_to_id(movies_df=movies, title_from_user=user_input) for user_input in user_inputs]
    # take movie ids and format them for models and recommendations
    
    rec_ids = recommend_random(query=user_inputs, movies=movies)
    recs = [id_to_title(movies_df=movies, id=id) for id in rec_ids]
    return render_template('recommendations.html', user_inputs=user_inputs, titles_ids=titles_ids, recs=recs)


if __name__=='__main__':
    app.run(debug=True) # run the app in debug mode and reboot when changes are made

    