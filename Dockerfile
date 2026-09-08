FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends g++ && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY main.cpp .
COPY httplib.h .
COPY index.html .

RUN g++ -std=c++17 -O2 main.cpp -o db

EXPOSE 10000

CMD ["./db"]