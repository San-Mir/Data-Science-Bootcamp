'''
use to read in data and store utility functions
'''

import pandas as pd
from thefuzz import process

movies = pd.read_csv('C:\Users\hassa\OneDrive\Desktop\spiced_excercises\scikit-cilantro-student-code\week_10\data\movies.csv', index_col=0) # read in data here
ratings = ...

def id_to_title(movies_df, id):
    '''
    transforms moveId to title
    '''
    title = movies_df.query(f'movieId =={id}')['title'].values[0]
    return title

def title_to_id(movies_df, title):
    '''
    transforms title to movieId
    '''
    title_to_id = movies_df[movies_df['title']==title].values[0][0]
    return title_to_id

def fuzzy_title_to_id(movies_df, title_from_user):
    '''
    input user movie title
    returns movie title, fuzz score and movieId
    '''
    title_full = process.extract(f'{title_from_user}', movies_df['title'], limit=1)
    return title_full



if __name__ == '__main__':

    # print(id_to_title(movies_df=movies, id=1))
    print(title_to_id(movies, 'Toy Story (1995)'))

    












    '''
    def match_title(query, movies_df, n_results=3):
        matches = process.extract(query, movies_df['title'], limit=n_results)
        title_ids = [(match[0], match[2]) for match in matches]
        return title_ids
    '''
    
    