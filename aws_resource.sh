#!/bin/bash

################
#Author:  mohd saquib
#date:    25th-Aug-2025
#
#Version: v1
#
#this script will report the aws resources usage
################

set -x
#AWS S3
#AWS EC2
#AWS Lambda
#AWS IAM Users

#list the buckets
echo "list of s3 buckets"
aws s3 ls

#list ec2-instances
echo "list of ec2-instances"
#aws ec2 describe-instances
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' > resourceTracker

#list lambda-fucntions 
echo "list of lambda-fucntions"
aws lambda list-functions

#list iam-users
echo "list of iam-users"
#aws iam list-users
aws iam list-users | jq .Users[].UserName >> resourceTracker
