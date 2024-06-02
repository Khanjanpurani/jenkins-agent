#!/bin/bash

while ! curl -s http://localhost:8080 > /dev/null; do
    echo "Waiting for Jenkins..."
    sleep 5
done

curl -sO http://localhost:8080/jnlpJars/agent.jar

exec java -jar agent.jar -url http://localhost:8080/ -secret 681bcf2e9a017827f9d239a1d62779188139dfc501900ce3ff1edadac78b2a6b -name "Docker agent" -workDir /home/jenkins/agent
