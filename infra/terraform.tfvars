name              = "app"
subnets           = ["subnet-0f7bf92972cacad54", "subnet-055f043b9c23f1d6b", "subnet-0bd03cac930e7d9ec"]
security_group_id = "sg-06b17738f316397ec"

internal = true
load_balancer_type = "application"
/* lb_protocol     = "http"
lb_backend_port = 80

target_group_name        = "tg-group"
target_listener_port     = 8080
target_listener_protocol = "http"
target_type              = "instance" */