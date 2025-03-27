FROM python:3.6-alpine
LABEL maintainer=" Eya Alimi"


WORKDIR /opt/buildapp 
COPY . . 


RUN pip3 install flask 
ENV ODOO_URL="odoo.com"
ENV PGADMIN_URL="pgadmin.org"
EXPOSE 8080
ENTRYPOINT ["python" , "app.py"]