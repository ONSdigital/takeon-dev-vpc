
# resource "null_resource" "addtolambda" {
#   provisioner "local-exec" {
#       command = "LambdaDevVPC.sh ${aws_subnet.private-subnet.id} ${aws_security_group.private-securitygroup.id}"
#   }
# }
