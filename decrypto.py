# -*- coding: utf-8 -*
import argparse
import itertools
import random
import sys
from bottle import route, run, template

word_list = []
white_codes = []
black_codes = []
lang = 'es'

@route('/new')
def new():
    global lang
    setup_game(lang)
    ret = "Listo! Volvé a la página anterior!" if lang == 'es' else "Done! Go back to the previous page"
    return ret

@route('/white')
def white():
    global word_list, white_codes
    return template('white', word_list=word_list[:4], codes=white_codes[:8])

@route('/black')
def black():
    global word_list, black_codes
    return template('black', word_list=word_list[-4:], codes=black_codes[:8])

def choose_rows():
    arr = range(110)
    # Let's shuffle 3 times, because why not
    random.shuffle(arr)
    random.shuffle(arr)
    random.shuffle(arr)

    return arr[:8]

def get_words(lang,rows):
    f = 'words_es' if lang == 'es' else 'words_en';
    lines = []
    with open(f) as fp:
        flines=fp.readlines()
        for r in rows:
            lines.append(flines[r])

    ret = []
    for line in lines:
        words = line.split(',')
        ret.append(words[random.randint(0,3)])
        
    return ret

def get_codes():
    arr = list(itertools.permutations([1,2,3,4],3))
    random.shuffle(arr)
    return arr

def setup_game(language):
    global word_list, black_codes, white_codes
    rows = choose_rows()

    word_list = get_words(language,rows)
    white_codes = get_codes()
    black_codes = get_codes()

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Create a game for decrypto.')
    parser.add_argument('-l', type=str, default='es',
                   help='Language (default es, can also choose en)')

    args = parser.parse_args()
    lang = args.l
    setup_game(args.l)

    if lang == 'es':
        print "Juego iniciado!"
        print "Deben entrar a :"
        print "    Equipo BLANCO: http://localhost:8080/white"
        print "    Equipo NEGRO:  http://localhost:8080/black"
    else:
        print "Game started, you must access http://localhost:8080/white y http://localhost:8080/black"
        print "Game started!"
        print "You must access"
        print "    WHITE team: http://localhost:8080/white"
        print "    BLACK team: http://localhost:8080/black"

    run(host='localhost', port=8080, quiet=True)

