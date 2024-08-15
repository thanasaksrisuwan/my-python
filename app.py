from flask import Flask, jsonify, request
import spacy

app = Flask(__name__)

# Load the spaCy model
nlp = spacy.load("en_core_web_sm")

@app.route('/')
def home():
    return "Welcome to the Flask API!"

@app.route('/analyze', methods=['POST'])
def analyze_text():
    if not request.json or 'text' not in request.json:
        return jsonify({'error': 'No text provided'}), 400

    text = request.json['text']
    doc = nlp(text)

    results = []
    for ent in doc.ents:
        results.append({
            'text': ent.text,
            'label': ent.label_
        })

    return jsonify(results)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
