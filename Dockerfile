FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        g++ \
        libssl-dev \
        ca-certificates && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY main.cpp .
COPY httplib.h .
COPY index.html .

RUN g++ -std=c++17 -O2 \
    -DCPPHTTPLIB_OPENSSL_SUPPORT \
    main.cpp -o db \
    -lssl -lcrypto -pthread

EXPOSE 10000

CMD ["./db"]