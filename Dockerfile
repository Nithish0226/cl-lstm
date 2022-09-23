FROM python:3.8-slim-buster
EXPOSE 8501
WORKDIR /python-docker



RUN apt-get -y update
RUN apt-get -y install git

RUN mkdir repo 
RUN git clone https://github.com/Nithish0226/lstm-cl.git 
WORKDIR /python-docker/lstm-cl

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt


ENTRYPOINT ["streamlit", "run", "LSTM_Model_Prediction.py", "--server.port=8501", "--server.address=0.0.0.0"]

