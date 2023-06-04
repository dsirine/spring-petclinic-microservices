resource "aws_instance" "petclinic-server" {
  ami                         = "ami-008bcc0a51a849165"
  instance_type               = var.instance_type
  key_name                    = "petclinic"
  subnet_id                   = aws_subnet.petclinic-subnet-1.id
  vpc_security_group_ids      = [aws_default_security_group.default-sg.id]
  availability_zone           = var.avail_zone
  associate_public_ip_address = true
  user_data                   = file("jenkins-server-script.sh")
  tags = {
    Name = "${var.env_prefix}-server"
  }
  # Copy in the bash script we want to execute.
  # The source is the location of the bash script
  # on the local linux box you are executing terraform
  # from.  The destination is on the new AWS instance.
  provisioner "file" {
    source      = "./jenkins-server-script.sh"
    destination = "/tmp/jenkins-server-script.sh"
  }
  # Change permissions on bash script and execute from ec2-user.
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/jenkins-server-script.sh",
      "sudo /tmp/jenkins-server-script.sh",
    ]
  }
    # Login to the ec2-user with the aws key.
  connection {
    type        = "ssh"
    user        = "ubuntu"
    host        = self.public_ip
    private_key = file("petclinic.pem")
  }
}

 # end resource