from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return "<h1>Hello! Shakir here, So, This is a very basic example of Python Flask App and It will be used to show CI using AWS</h1>"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
