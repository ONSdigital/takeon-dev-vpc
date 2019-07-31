#Creation of a custom VPC

##This project uses terraform to create all the insfrastructure necessary to create a vpc which allows lambda to lambda, lambda to rds and lambda to s3 communication

##Also creates an ec2 bastion which will require further local configuration in order to update from a local machine

##In your tf vars file you can set your own ip to allow communication between your local machine and the security groups

