#!/bin/bash
log="output-log.txt"

if [ "$#" -ne 2 ]; then
    echo "Illegal number of parameters. Usage: load_data.sh <username> <password>"
    exit
else
    export PGPASSWORD=$2
fi
echo "Dropping existing tables..."
psql --host=localhost --port=1235 --username=$1 --dbname=takeondevdb -a -f droptables.sql
echo "Creating Tables..."
psql --host=localhost --port=1235 --username=$1 --dbname=takeondevdb -a -f tables.sql >> $log
echo "Generating dummy contributor data..."
cd test-data
python generateContributors.py >> $log
echo "Generating dummy response data..."
psql --host=localhost --port=1235 --username=$1 --dbname=takeondevdb -a -f generateResponses.sql >> $log
echo "Generating validation data..."
python generateValidationData.py >> $log
echo "Adding example data"
psql --host=localhost --port=1235 --username=$1 --dbname=takeondevdb -a -f exampledata.sql >> $log
echo "Adding changelog rule"
python addChangelogRule.py >> $log
echo "Script finished"