# Flask API with spaCy NLP

This project is a simple Flask API that utilizes the spaCy NLP library to analyze text. The API exposes endpoints to interact with a pre-trained spaCy model and extract entities from the provided text.

## Features

- **Home Route:** A simple welcome message.
- **Analyze Text Route:** Analyzes text using spaCy's `en_core_web_sm` model to extract named entities.

## Project Structure

my_flask_app/
├── app.py
├── dependencies.txt
└── Containerfile

- `app.py`: The main Flask application file.
- `dependencies.txt`: List of Python dependencies.
- `Containerfile`: Podman container configuration.

## Setup Instructions

### Prerequisites

- [Podman](https://podman.io/getting-started/installation) installed on your machine.
- Basic knowledge of command-line operations.

### Building the Container

1. **Clone the repository**:

    ```bash
    git clone https://github.com/your-username/my_flask_app.git
    cd my_flask_app
    ```

2. **Build the container image**:

    ```bash
    podman build -t my-flask-app .
    ```

### Running the Container

1. **Run the container**:

    ```bash
    podman run -d -p 5000:5000 my-flask-app
    ```

2. **Access the API**:
    - Home Route: [http://localhost:5000/](http://localhost:5000/)
    - Analyze Route: [http://localhost:5000/analyze](http://localhost:5000/analyze)

### Example Usage

#### Home Route

Visit the following URL to see the welcome message:

http://localhost:5000/

#### Analyze Text Route

To analyze text, send a POST request to `/analyze` with a JSON body containing the text to analyze:

```bash
curl -X POST -H "Content-Type: application/json" -d '{"text": "OpenAI is a company based in San Francisco."}' http://localhost:5000/analyze


Expected Response

[
    {
        "text": "OpenAI",
        "label": "ORG"
    },
    {
        "text": "San Francisco",
        "label": "GPE"
    }
]
