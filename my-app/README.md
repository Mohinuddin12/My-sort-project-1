📦 My-App Project
🚀 Overview
এই প্রজেক্ট একটি Dockerized Fullstack Application যেখানে:

Backend → Python Flask API

Frontend → Simple HTML (Nginx দিয়ে সার্ভ করা)

Deployment → Docker Compose দিয়ে লোকাল বা AWS EC2 তে চালানো যাবে

🛠 Requirements
লোকাল বা AWS EC2 তে চালাতে যা লাগবে:

Ubuntu/Debian based OS

Git

Docker & Docker Compose

Python3 (Backend এর জন্য)

📂 Project Structure
Code
my-app/
 ├── backend/
 │    └── app.py
 ├── frontend/
 │    └── index.html
 ├── docker-compose.yml
 ├── setup.sh
 └── README.md
⚙️ Backend (Flask API)
backend/app.py

python
from flask import Flask
app = Flask(__name__)

@app.route("/")
def home():
    return {"message": "Hello from Backend!"}

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
🎨 Frontend (HTML)
frontend/index.html

html
<!DOCTYPE html>
<html>
<head>
  <title>My App</title>
</head>
<body>
  <h1>Hello from Frontend!</h1>
  <p>Backend API: <a href="http://localhost:5000">Click Here</a></p>
</body>
</html>
🐳 Docker Compose
docker-compose.yml

yaml
version: "3"
services:
  backend:
    build: ./backend
    ports:
      - "5000:5000"
  frontend:
    image: nginx:alpine
    volumes:
      - ./frontend:/usr/share/nginx/html
    ports:
      - "8080:80"
🔧 Auto Setup Script
setup.sh

bash
#!/bin/bash

# Update system
sudo apt update && sudo apt upgrade -y

# Install Docker & Docker Compose
sudo apt install -y docker.io docker-compose git python3 python3-pip

# Enable Docker service
sudo systemctl enable docker
sudo systemctl start docker

# Clone project (নিজের repo URL বসাও)
if [ ! -d "my-app" ]; then
  git clone https://github.com/example/my-app.git
fi

cd my-app

# Build & Run Docker Compose
sudo docker-compose up --build -d

echo "✅ Setup complete!"
echo "Frontend: http://<SERVER-IP>:8080"
echo "Backend:  http://<SERVER-IP>:5000"
▶️ Usage
লোকাল মেশিনে
bash
chmod +x setup.sh
./setup.sh
👉 তারপর ব্রাউজারে:

Frontend → http://localhost:8080

Backend → http://localhost:5000

AWS EC2 তে
EC2 Instance Launch করো (Ubuntu 22.04)

Security Group এ 8080 এবং 5000 পোর্ট ওপেন করো

SSH দিয়ে লগইন করো:

bash
ssh -i my-key.pem ubuntu@<EC2-Public-IP>
স্ক্রিপ্ট রান করো:

bash
chmod +x setup.sh
./setup.sh
👉 তারপর ব্রাউজারে:

Frontend → http://<EC2-Public-IP>:8080

Backend → http://<EC2-Public-IP>:5000

📌 Notes
লোকালে শুধু নিজের কম্পিউটারে দেখা যাবে।

AWS EC2 তে দিলে ইন্টারনেট থেকে অ্যাক্সেস করা যাবে।

Security Group এ পোর্ট ওপেন না করলে বাইরে থেকে দেখা যাবে না।