#!/bin/bash

git clone <repository-url>

export DB_PASSWORD=<password>
export API_KEY=<api-key>

docker build -t <image-name> .

docker run -p 8080:8080 -e DB_PASSWORD=$DB_PASSWORD -e API_KEY=$API_KEY <image-name>
