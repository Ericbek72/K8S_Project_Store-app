FROM httpd:alpine
COPY ./scr /usr/local/apache2/htdocs/
RUN addgroup devops && adduser eric -G devops --disabled-password
USER eric
# Set the ERIC_PROJ_PASSWORD environment variable at runtime
CMD ["sh", "-c", "export ERIC_PROJ-PASSWD=$(aws secretsmanager get-secret-value --secret-id=my-secret --query=SecretString --output=text) && httpd-foreground"]
#CMD ["httpd", "-g", "daemon off;"]