#!/bin/bash
MDBUSERNAME=""
MDBPASSWORD=""

curl  https://atlas-education.s3.amazonaws.com/sampledata.archive -o sampledata.archive
mongorestore  --nsExclude admin.* --username $MDBUSERNAME --password $MDBPASSWORD --archive=sampledata.archive