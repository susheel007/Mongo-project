# Step 1: Use base Ubuntu image
FROM ubuntu:latest

# Step 2: Install Apache
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean

# Step 3: Install Chrome headless
RUN apt-get install -y wget curl && \
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    apt install -y ./google-chrome-stable_current_amd64.deb && \
    rm google-chrome-stable_current_amd64.deb && \
    apt-get install -y libx11-xcb1

# Expose port 80 for Apache
EXPOSE 80

# Start Apache service
CMD ["apache2ctl", "-D", "FOREGROUND"]
