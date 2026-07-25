#!/bin/bash

# Update system
sudo apt update && sudo apt upgrade -y

# Install Docker & Docker Compose
sudo apt install -y docker.io docker-compose git python3 python3-pip

# Enable Docker service
sudo systemctl enable docker
sudo systemctl start docker

# Add current user to docker group (so sudo লাগবে না)
sudo groupadd docker || true
sudo usermod -aG docker $USER

# Clone project 
if [ ! -d "my-app" ]; then
  git clone https://github.com/Mohinuddin12/My-sort-project-1.git my-app
fi

cd my-app

# Build & Run Docker Compose
docker-compose up --build -d

echo "✅ Setup complete!"
echo "Frontend: http://localhost:8080"
echo "Backend:  http://localhost:5000"
echo "👉 Logout করে আবার Login করলে sudo ছাড়াই docker কমান্ড কাজ করবে"
