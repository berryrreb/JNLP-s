NOTE: this image is intended for Maverick's gateway project. PLEASE, customize the code for your needs.

docker build -t jenkins/slave:3.16-1 --build-arg http_proxy=http://172.26.202.4:8080 --build-arg https_proxy=https://172.26.202.4:8080 .

