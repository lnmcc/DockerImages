# DockerImages

## Jenkins For Android
docker run  --name jenkins4android --rm   -p 32784:8080  -p 32783:50000  -v ~/jenkins_home:/var/jenkins_home  [image-id]

## Gerrit With Apache
docker run --rm    --name gerritwithapache -p 8080:8080 -p 29418:29418 -e AUTH_TYPE=HTTP -v ~/gerrit_volume:/home/gerrit2/review_site  [image-id]
