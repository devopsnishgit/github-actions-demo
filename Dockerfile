FROM almalinux:8

# Install dependencies
RUN yum install -y httpd wget unzip

# Change directory
WORKDIR /var/www/html

# Download webfiles
RUN wget https://github.com/azeezsalu/techmax/archive/refs/heads/main.zip

# Unzip folder
RUN unzip main.zip

# Copy files into the HTML directory
RUN cp -r techmax-main/* /var/www/html/

# Remove unwanted folder
RUN rm -rf techmax-main main.zip

# Expose port 80
EXPOSE 80

# Set the default application to start when the container starts
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]
