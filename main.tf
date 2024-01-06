#ec2

resource "aws_instance" "ec2-s3-module" {
  ami                    = "ami-0c7217cdde317cfec"
  instance_type          = "t2.micro"
  key_name               = "gp1"
  vpc_security_group_ids = [aws_security_group.aws-my-sg.id]

  tags = {
    Name = "my-ec2"
  }
}

# security group

resource "aws_security_group" "aws-my-sg" {
  name = "aws-my-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
