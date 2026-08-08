########################################
# Latest Amazon Linux AMI
########################################

data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

########################################
# Jenkins Controller
########################################

resource "aws_instance" "jenkins_controller" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet_id
  key_name               = var.key_name
  vpc_security_group_ids = [var.security_group_id]
  iam_instance_profile   = var.instance_profile

  tags = {
    Name = "${var.project_name}-Jenkins-Controller"
  }
}

########################################
# Build Agent
########################################

resource "aws_instance" "build_agent" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet_id
  key_name               = var.key_name
  vpc_security_group_ids = [var.security_group_id]
  iam_instance_profile   = var.instance_profile

  tags = {
    Name = "${var.project_name}-Build-Agent"
  }
}

########################################
# Deploy Agent
########################################

resource "aws_instance" "deploy_agent" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet_id
  key_name               = var.key_name
  vpc_security_group_ids = [var.security_group_id]
  iam_instance_profile   = var.instance_profile

  tags = {
    Name = "${var.project_name}-Deploy-Agent"
  }
}

########################################
# SonarQube
########################################

resource "aws_instance" "sonarqube" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet_id
  key_name               = var.key_name
  vpc_security_group_ids = [var.security_group_id]
  iam_instance_profile   = var.instance_profile

  tags = {
    Name = "${var.project_name}-SonarQube"
  }
}

########################################
# Prometheus + Grafana
########################################

resource "aws_instance" "monitoring" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet_id
  key_name               = var.key_name
  vpc_security_group_ids = [var.security_group_id]
  iam_instance_profile   = var.instance_profile

  tags = {
    Name = "${var.project_name}-Monitoring"
  }
}