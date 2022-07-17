'''
different functions for making movie recommendations
'''

import pandas as pd


def recommend_random(query, movies, k=3):
    """
    Dummy recommender that recommends a list of random movies. Ignores the actual query.
    """
    return movies.reset_index()['movieId'].sample(k).to_list()


def recommend_popular(query, k=10):
    """
    Filters and recommends the top k movies for any given input query. 
    Returns a list of k movie ids.
    """    
    
    return [364, 372, 43, 34, 243]

def recommend_cluster(query, k=10):
    """
    Filters and recommends the top k movies from a cluster a given input query. 
    Returns a list of k movie ids.
    """    
    
    return [364, 372, 43, 34, 243]


def recommend_nmf(query, model, k=10):
    """
    Filters and recommends the top k movies for any given input query based on a trained NMF model. 
    Returns a list of k movie ids.
    """    
    
    return [364, 372, 43, 34, 243]


def recommend_neighborhood(query, model, k=10):
    """
    Filters and recommends the top k movies for any given input query based on a trained nearest neighbors model. 
    Returns a list of k movie ids.
    """   
    
    return [364, 372, 43, 34, 243]
