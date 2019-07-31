resource "aws_db_instance" "takeon" {
    allocated_storage = 5
    storage_type = "gp2"
    engine = "postgres"
    engine_version = 11.4
    instance_class = "db.t3.small"
    name = "takeondevdb"
    username = "${var.DB_username}"
    password = "${var.DB_password}"
    backup_retention_period = 7
    identifier = "takeondevdb"
    skip_final_snapshot = true
    db_subnet_group_name = "${var.rds_subnet_group}"
    vpc_security_group_ids = ["${aws_security_group.takeon-dev-private-securitygroup.id}"]

      tags = {
        Name = "takeon-dev-RDS"
        App = "takeon-dev-RDS"
    }

  provisioner "local-exec" {
    command =  "load_data.sh ${var.DB_username} ${var.DB_password}"
  }
}