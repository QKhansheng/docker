   This is a dockerfile to build FastDFS and Nginx image , also include shell script which is used to render config 

Q : What is FastDFS?
    It is an open source, lightweight distributed file system that manages files, including file storage, file synchronization, file access 
(file upload, file download), and solves the problem of large-capacity storage and load balancing. Especially suitable for online services 
such as photo albums, video sites, etc.

Q : what is Nginx?
    Nginx (engine x) is a high-performance HTTP and reverse proxy service and an IMAP/POP3/SMTP service. Nginx was developed by Igor 
Sesoyev for the second-running Rambler.ru site in Russia (Russian: Рамблер)

   We take the way to compile the source code to make the image , you can search and download the whole software packages in the official 
URL or other mirrors website:

Nginx : http://nginx.org/en/download.html 

FastDFS : https://github.com/happyfish100/fastdfs

...

Q : how to build images through this dockerfile

    docker build -t fdfs-and-nginx:tag -f dockerfile ./

Q : how to run the container

    docker swarm init
    docker network create --driver overlay --subnet 192.168.0.0/16 --attachable zhacai
    docker run -d --network zhacai --name fdfs-nginx-test -p 80:80 -p 22122:22122 fdfs-and-nginx:tag
