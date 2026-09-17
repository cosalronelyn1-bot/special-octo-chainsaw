FROM node:22-bookworm

WORKDIR /app

RUN apt-get update && apt-get install -y \
    python3 python3-pip python3-venv \
    curl git \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt ./requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

ENV PORT=8003
EXPOSE 8003

CMD ["python3", "main.py"]
