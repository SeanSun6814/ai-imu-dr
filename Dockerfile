FROM pytorch/pytorch:1.10.0-cuda11.3-cudnn8-devel

# Set working directory
WORKDIR /ai-imu-dr

# RUN apt-key del 7fa2af80 && \
# wget https://developer.download.nvidia.com/compute/cuda/repos/$distro/$arch/cuda-keyring_1.0-1_all.deb && \
# dpkg -i cuda-keyring_1.0-1_all.deb && \
# rm cuda-keyring_1.0-1_all.deb

RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/3bf863cc.pub

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

