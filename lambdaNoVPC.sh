#!/bin/bash

Lambdas='takeon-db-test-dev-collate takeon-validation-to-bpm 
TakeOn-DataPreporator-dev-collate takeon-data-prep-py-lambda-dev-run_data_prep takeon-data-prep-test 
takeon-results-to-DB TakeOn-Recombinator-dev-collate takeon-val-comparison-dev-valueComparison 
takeon-ingest-bpm-dev-ingest takeon-validation-value-present-python wrangler-lambda'

for var in $Lambdas
do
    aws lambda update-function-configuration --function-name $var --vpc-config SubnetIds=[],SecurityGroupIds=[]
done