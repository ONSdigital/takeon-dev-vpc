resource "aws_db_instance" "takeon" {
    allocated_storage = 5
    storage_type = "gp2"
    engine = "postgres"
    engine_version = 11.4
    instance_class = "db.t3.small"
    name = "${var.DB_name}"
    username = "${var.DB_username}"
    password = "${var.DB_password}"
    backup_retention_period = 7
    identifier = "${var.DB_name}"
    skip_final_snapshot = true
    db_subnet_group_name = "${aws_db_subnet_group.rds-subnetgroup.name}"
    vpc_security_group_ids = ["${aws_security_group.private-securitygroup.id}"]

      tags = {
        Name = "${var.environment_name}-RDS"
        App = "takeon"
    }

  # provisioner "local-exec" {
  #   command =  "load_data.sh ${var.DB_username} ${var.DB_password}"
  # }
}