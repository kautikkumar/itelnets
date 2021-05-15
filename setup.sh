#!/bin/bash

cd /tmp && rm -rf itelnets  && git clone -b Dockerfile https://github.com/kautikkumar/itelnets.git
cd itelnets && docker build . -t itelnets/webserver:letest
docker push itelnets/webserver:letest

#!/bin/bash
imageName=itelnets/webserver:letest
containerName=itelnets

echo Delete old container...
docker rm -f $containerName

echo Run new container...
docker run -d -p 8844:80 --name $containerName $imageName

#docker run  -p 8844:80 --name itelnets -d itelnets/webserver:letest

