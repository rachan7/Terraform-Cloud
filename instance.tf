  provider "aws" { 
  region = "us-east-1" 
  access_key=var.AWS_ACCESS_KEY 
  secret_key=var.AWS_SECRET_KEY 
  } 

  resource "aws_instance" "web" { 
  ami           = "ami-0fc5d935ebf8bc3bc" 
  instance_type = "t3.micro" 
  tags = { 
  Name = "Hello from Terraform Cloud" 
  } 
  }
resource "aws_security_group" "example" {
  name        = "allow_ssh_http"
  description = "Allow SSH and HTTP access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Be cautious with this, consider restricting it
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Be cautious with this
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Define an EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe01e" # Replace with a valid AMI ID for your region
  instance_type = "t2.micro" # Change as needed
  key_name      = aws_key_pair.my_key.key_name
  security_groups = [aws_security_group.example.name]

  tags = {
    Name = "MyTerraformInstance"
  }
}

output "instance_ip" {
  value = aws_instance.example.public_ip
}
