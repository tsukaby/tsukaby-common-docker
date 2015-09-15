#!/bin/sh

now=`date +"%Y%m%d_%H%M%S"`
file_name=${now}_tsukaby-common.zip

# Create zip
cd eb
zip -r ../${file_name} ./* .ebextensions
cd ..

# Upload
aws s3 mv ${file_name} s3://tsukaby-common/binary/

# Create eb version
aws elasticbeanstalk create-application-version \
  --application-name tsukaby-common \
  --version-label ${now} \
  --source-bundle S3Bucket="tsukaby-common",S3Key=binary/${file_name}