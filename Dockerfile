FROM python:3
LABEL MAINTAINER=rick@hostingcoach.nl

COPY . /usr/src

RUN cd /usr/src; \
  pip install -r requirements.txt; \
  python setup.py install; \
  cp heralding/heralding.yml /etc/heralding.yml;

VOLUME [ "/var/heralding" ]
WORKDIR /var/heralding
EXPOSE 21 23 110 995 5432 142 993 22 80 443 25 5900 1000 3306 3389
ENTRYPOINT [ "/usr/local/bin/heralding", "--config=/etc/heralding.yml", "--logfile=/dev/stdout" ]
