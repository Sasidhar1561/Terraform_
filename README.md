📁 Project Structure:
Created a folder with these files:
• variable.tf, provider.tf, vpc.tf, securitygroup.tf, keypair.tf, InstanceID.tf, Instance.tf, web.sh, and backend.tf.
🛠️ Key Highlights:
1️⃣ variable.tf
• Defined variables like AWS region, availability zones, and SSH user (webuser).
2️⃣ vpc.tf
• Created a VPC (10.0.0.0/16)
• Set up 2 public subnets (10.1.0.0/16, 10.2.0.0/16) in AZ1 & AZ2
• Added an Internet Gateway, public route table (0.0.0.0/0), and associated the public subnets
3️⃣ provider.tf
• Configured AWS provider and region
4️⃣ securitygroup.tf
• Allowed inbound traffic on port 22 (SSH) and port 80 (HTTP)
• Enabled outbound access to the internet
5️⃣ keypair.tf
• Generated a secure SSH key pair using ssh-keygen
• Used aws_key_pair resource in Terraform to associate with EC2
6️⃣ InstanceID.tf
• Used the data "aws_ami" block to dynamically fetch the latest Ubuntu 22.04 LTS AMI
• Added an output block to expose and verify the selected AMI ID
7️⃣ Instance.tf
• Provisioned an EC2 instance in a public subnet using the above AMI
• Attached the created security group and key pair
• Used Terraform provisioner "file" to upload a script (web.sh) into the instance
• Configured connection block to securely SSH into the instance via Terraform
• Executed the script remotely using provisioner "remote-exec" to:
o Install Apache (httpd)
o Serve a basic webpage from /var/www/html
8️⃣ backend.tf
• Configured backend "s3" block to store the Terraform state file in an S3 bucket
• This allows collaboration, locking, and safer state management for team-based work
