resource "aws_instance" "web" {
  ami                    = "ami-07d9b9ddc6cd8dd30" #change ami id for different region
  instance_type          = "t2.large"
  key_name               = "Nova_keypair" #change key name as per your setup
  vpc_security_group_ids = [aws_security_group.Jenkins-VM-SG.id]
  user_data              = templatefile("./install.sh", {})

  tags = {
    Name = "Jenkins-SonarQube"
  }

  root_block_device {
    volume_size = 40
  }
}




