# 1. THE FOUNDATION: A Private VPC (The "Vault")
resource "aws_vpc" "ai_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name        = "Secure-AI-VPC"
    Compliance  = "NIST-AI-RMF"
    Governance  = "Fiduciary-Protection"
  }
}

# 2. THE LOCK: Security Group (Firewall)
resource "aws_security_group" "ai_sg" {
  name        = "ai-model-guardrail"
  description = "Restrict all inbound traffic. Only allow encrypted internal audit."
  vpc_id      = aws_vpc.ai_vpc.id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.0.1.0/24"] # Only internal traffic
  }
}

# 3. THE PILOT'S CHAIR: SageMaker AI Instance (Private)
resource "aws_sagemaker_notebook_instance" "secure_ai_node" {
  name          = "Compliance-Auditor-Node"
  role_arn      = "arn:aws:iam::ACCOUNT_ID:role/AI_Auditor_Role"
  instance_type = "ml.t3.medium"
  
  # CRITICAL SECURITY: No Public Internet Access
  direct_internet_access = "Disabled"
  
  # Isolated within our VPC vault
  subnet_id          = "subnet-12345" 
  security_group_ids = [aws_security_group.ai_sg.id]

  tags = {
    AuditLog = "Enabled"
    DataClassification = "Highly-Confidential"
  }
}
