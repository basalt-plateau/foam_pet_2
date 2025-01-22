


# Foam Pet

## Load Docker Image
```
docker load -i Foam_Pet.Docker_image.v7_0_0_0.tar
```


## Run Docker Container from Image
```
docker run --name Mech_Pet_1 -td -e HOST_IP=host.docker.internal -p 22000:22000 -p 21000:21000 -p 443:443 -p 80:80 Mech_Pet:v7_0_0_0 /bin/bash -c "bash /embark.sh"
```

## From a Web Browser
The site should be open on port 22000
http://localhost:22000