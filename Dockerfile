FROM pytorch/pytorch:1.8.1-cuda10.2-cudnn7-runtime

# Set working directory
WORKDIR /ai-imu-dr

# Install necessary packages
RUN apt-get update && apt-get install -y wget unzip

# Copy data and temp files into the Docker container
COPY data.zip /ai-imu-dr/
COPY temp.zip /ai-imu-dr/

# Extract data and temp files
RUN mkdir ./results && \
    unzip data.zip -d . && \
    unzip temp.zip -d . && \
    rm data.zip temp.zip

# Install necessary Python packages
RUN pip3 install matplotlib numpy termcolor scipy navpy

# Copy the source code into the Docker container

RUN echo "cd src && python3 main_kitti.py" >> start.sh

# Run the filters
CMD ["sh", "./start.sh"]

