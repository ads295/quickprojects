#!/bin/bash

#####################
#My first AWS project using Shell Scripting!
#The idea is to check from the CLI what resources are currently in use.
#Aditya Trivedi v0.01 dt. 24/09/2025
#####################
#Entering debug modeaws ec2 describe-instances | jq '.Reservations[].ReservationId'

set -x
#List IAM users
echo "Printing IAM users"
aws iam list-users

#List EC2 instances
echo "Printing EC2 instances"
aws ec2 describe-instances | jq '.Reservations[].ReservationId'

#List S3 buckets
echo "Printing S3 buckets"
aws s3 ls

#List AWS Lambda instances
echo "Printing AWS Lambda functions"
aws lambda list-functions
