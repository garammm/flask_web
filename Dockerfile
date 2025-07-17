FROM python:3.12-slim

RUN apt-get update && apt-get install -y --no-install-recommends && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

# requirements.txt 복사 (작업 디렉토리에)
COPY requirements.txt . 

# 설치
RUN pip install --no-cache-dir -r requirements.txt

# 앱 전체 복사
COPY . .

EXPOSE 5000

CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0"]
