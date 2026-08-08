from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/")
def home():
    return jsonify({
        "application": "Project Phoenix",
        "version": "1.0.0",
        "status": "Running"
    })

@app.route("/health")
def health():
    return jsonify({
        "status": "UP"
    })

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)