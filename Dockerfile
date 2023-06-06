FROM httpd:alpine
COPY ./scr /usr/local/apache2/htdocs/
RUN addgroup devops && adduser eric -G devops --disabled-password
USER eric
ENTRYPOINT ["sleep", "10000"]
# Set the ERIC_PASSWORD environment variable at runtime
#CMD ["sh", "-c", "export ERIC_PASSWORD=$(aws secretsmanager get-secret-value --secret-id=my-secret --query=SecretString --output=text) && httpd-foreground"]
#CMD ["httpd", "-g", "daemon off;"]