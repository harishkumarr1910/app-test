FROM alpine:3.8

# VERSIONS
ENV ALPINE_VERSION=3.8 

FROM python:3
RUN pip install --upgrade pip \
	&& pip install --upgrade pip setuptools wheel \
        && pip install utils \
        && pip install virtualenv \
        && pip install apache-beam \
	&& pip install --no-cache-dir nibabel pydicom matplotlib pillow\
	&& pip install --no-cache-dir med2image

CMD ["cat", "/etc/os-release"]
# Downloading gcloud package
RUN curl https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz > /tmp/google-cloud-sdk.tar.gz

# Installing the package
RUN mkdir -p /usr/local/gcloud 
RUN tar -C /usr/local/gcloud -xvf /tmp/google-cloud-sdk.tar.gz 
RUN  /usr/local/gcloud/google-cloud-sdk/install.sh 
RUN pip install gcloud 
# Adding the package path to local
ENV PATH $PATH:/usr/local/gcloud/google-cloud-sdk/bin
RUN gcloud components update

