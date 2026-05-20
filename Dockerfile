FROM python:3.10-slim-bullseye

ENV PIP_NO_CACHE_DIR=1
ENV PYTHONUNBUFFERED=1

# تثبيت الحزم المطلوبة
RUN apt-get update && apt-get upgrade -y && \
    apt-get install --no-install-recommends -y \
    bash \
    curl \
    figlet \
    git \
    libffi-dev \
    libjpeg-dev \
    libwebp-dev \
    neofetch \
    libpq-dev \
    libcurl4-openssl-dev \
    libxml2-dev \
    libxslt1-dev \
    python3-pip \
    python3-sqlalchemy \
    openssl \
    wget \
    python3-dev \
    gcc \
    sqlite3 \
    libsqlite3-dev \
    ffmpeg \
    libssl-dev \
    unzip \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip3 install --upgrade pip setuptools wheel
RUN pip3 install setuptools==67.8.0
RUN pip3 install -r requirements.txt

COPY . .

CMD ["python3", "-m", "MukeshRobot"]
