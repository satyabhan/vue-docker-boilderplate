# vue-docker-boilderplate
Boilerplate docker image for vue dev and production

## Create vue app
```
docker build --build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g) -t vue_helper - < ./dockerfiles/Setup.Dockerfile

docker run --rm -v ~/projects/vue/:/vue-setup -it vue_helper 

vue create vue_app
```

## Build and run dev
```
docker build -f Dockerfiles/Dev.Dockerfile -t vue_app:dev vue_app

docker run --rm -v ~/projects/vue/vue_app:/vue_app -p 8080:8080 -it vue_app:dev
```

## Build and run prod
```
docker build -f ./dockerfiles/Deploy.Dockerfile -t vue_app:production vue_app

docker run --rm -p 80:80 vue_app:production
```