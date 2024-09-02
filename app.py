from flask import Flask

app = Flask(__name__)

@app.route('/', methods=['GET'])
def home():
    info = open('info.txt', 'r')
    return info.read()