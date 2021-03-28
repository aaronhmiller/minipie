#!/bin/sh
echo "What version are you building?"
read VER
docker build -t kongaaron/minipie:$VER -t kongaaron/minipie:latest .
docker push kongaaron/minipie
docker push kongaaron/minipie:$VER
