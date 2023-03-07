#Specify the base image to use for the build
FROM python:3.10

#Set working directory
WORKDIR /opt/status-page

#Copy all app files to container
COPY requirements.txt .

#Install all requirements needed
RUN pip install --no-cache-dir -r requirements.txt

#Declare vars to be used in the app build
#ARG POSTGRES_NAME
#gitENV POSTGRES_NAME=${POSTGRES_NAME}

#Copy app files
COPY . .

#Expose ports
EXPOSE 8000 

#Run app
CMD ["python3", "statuspage/manage.py", "runserver", "0.0.0.0:8000"]
