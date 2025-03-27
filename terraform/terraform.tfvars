security_groups_name = "sg_project"
security_groups_ports = [
  { from_port = 22, to_port = 22 },
  { from_port = 80, to_port = 80 },
  { from_port = 8080, to_port = 8080 },
  { from_port = 8069, to_port = 8069 },
  { from_port = 30080, to_port = 30080 },
  { from_port = 30010, to_port = 30010 },
  { from_port = 30011, to_port = 30011 }
]

instance_type = "t2.medium"
username      = "ubuntu"
# key_name      = "key_project"
protocol      = "tcp"
region        = "us-east-1"
stack         = "kubernetes"
private_key_path  = "C:\\Users\\Lenovo\\ic-webapp\\terraform\\keypair\\key_project.pem"

