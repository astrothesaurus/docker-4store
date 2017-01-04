git pull
docker stop 4store
docker rm 4store
docker build -t iop/4store .
docker run -dit -p8080:8080 --name 4store iop/4store
