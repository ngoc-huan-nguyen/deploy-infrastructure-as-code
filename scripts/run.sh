#!/bin/bash
# Automation script for CloudFormation templates. 
#
# Parameters
#   $1: Execution mode. Valid values: create, update, delete.
#   $2: Stack name
#   $3: Template file
#   $4: Params file
#
# Usage examples:
#   ./run.sh create STACK_NAME TEMPLATE_FILE PARAM_FILE 
#   ./run.sh update STACK_NAME TEMPLATE_FILE PARAM_FILE 
#   ./run.sh delete STACK_NAME
#

# Validate parameters
if [[ $1 != "create" && $1 != "update" && $1 != "delete" ]]; then
    echo "ERROR: Incorrect execution mode. Valid values: create, update, delete." >&2
    exit 1
fi

# Execute CloudFormation CLI
if [ $1 == "create" ]
then
    aws cloudformation create-stack --stack-name $2 \
    --template-body file://$3   \
    --parameters file://$4 \
    --capabilities "CAPABILITY_NAMED_IAM"  \
    --region us-east-1
fi
if [ $1 == "update" ]
then
    aws cloudformation update-stack --stack-name $12  \
    --template-body file://$3  \
    --parameters file://$4  \
    --capabilities "CAPABILITY_NAMED_IAM"  \
    --region us-east-1
    
fi
if [ $1 == "delete" ]
then
   aws cloudformation delete-stack --stack-name $2 \
    --region us-east-1
fi

