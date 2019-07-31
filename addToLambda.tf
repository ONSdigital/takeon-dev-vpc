
# resource "null_resource" "addtolambda" {
#   provisioner "local-exec" {
#       command = "LambdaDevVPC.sh ${aws_subnet.takeon-dev-private-subnet.id} ${aws_security_group.takeon-dev-private-securitygroup.id}"
#   }
# }
