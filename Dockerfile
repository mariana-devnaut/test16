FROM cimg/python:3.10.1

LABEL Author "Kennedy Sanchez <kennedy.sanchez@koombea.com>"

USER root

ENV PYTHONUNBUFFERED 1
ENV APP_DIR=/usr/src/app

# Set display port as an environment variable
ENV DISPLAY=:99

#WORKDIR $APP_DIR
WORKDIR /app

COPY . $APP_DIR

#COPY ./webdrivers/chromedriver /usr/local/bin/chromedriver
COPY ./webdrivers/chromedriver /usr/bin/chromedriver 
COPY ./webdrivers/chromedriver /usr/local/bin/chromedriver

# Install Chrome
RUN sudo wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
RUN sudo echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
RUN sudo apt-get update
RUN sudo apt-get install -y google-chrome-stable
RUN sudo apt install -y unzip

RUN \
    wget https://chromedriver.storage.googleapis.com/114.0.5735.90/chromedriver_linux64.zip && \
    unzip chromedriver_linux64.zip && \
    sudo mv chromedriver /usr/bin/chromedriver && \
    chromedriver --version && \
    curl https://intoli.com/install-google-chrome.sh | bash && \
    sudo mv /usr/bin/google-chrome-stable /usr/bin/google-chrome && \
    google-chrome --version && \
    which google-chrome

RUN pip install virtualenv
RUN virtualenv /usr/src/app/venv/bin/python
RUN source venv/bin/activate
RUN pip3 install -r requirements.txt
#RUN pip install --upgrade pip && pip install -r requirements.txt

# install Java
RUN sudo apt update
RUN sudo apt install -y default-jre 
RUN sudo apt install -y default-jdk 

# install allure
RUN sudo apt-get update
RUN sudo apt-get -y install allure
RUN allure -v

#RUN behave --tags=regression
RUN behave -f allure_behave.formatter:AllureFormatter -o Reports ./features
