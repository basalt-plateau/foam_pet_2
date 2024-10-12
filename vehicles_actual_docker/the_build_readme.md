


# Foam Pet

## Load Docker Image
```
docker load -i Foam_Pet_v6_0_0.0.Docker_image.tar
```


## Run Docker Container from Image
```
docker run --name foam_pet_1 -td -e HOST_IP=host.docker.internal -p 22000:22000 -p 21000:21000 -p 443:443 -p 80:80 foam_pet:v5_0_0.0 /bin/bash -c "bash /embark.sh"
```

## From a Web Browser
The site should be open on port 22000
http://localhost:22000