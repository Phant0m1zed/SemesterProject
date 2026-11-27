from pathlib import Path
from flask import Flask, render_template, request

BASE_DIR = Path(__file__).resolve().parents[2]

app = Flask(
    __name__,
    template_folder=str(BASE_DIR / "templates"),
    static_folder=str(BASE_DIR / "static"),
)

@app.route("/")
def home():
    return render_template("home.html")

if __name__ == "__main__":
    app.run(debug=True)
