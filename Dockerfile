FROM python:3
LABEL MAINTAINER=rick@hostingcoach.nl

COPY . /usr/src

RUN cd /usr/src; \
  pip install -r requirements.txt; \
  python setup.py install; \
  cp heralding/heralding.yml /etc/heralding.yml; \
  \
  mkdir /var/heralding; \
  chown 1000:1000 /var/heralding;

WORKDIR /var/heralding
ENTRYPOINT [ "/usr/local/bin/heralding", "--config=/etc/heralding.yml", "--logfile=/dev/stdout" ]
