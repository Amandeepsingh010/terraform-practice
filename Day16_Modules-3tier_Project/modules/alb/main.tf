resource "aws_lb" "alb" {
  name = "simple-alb"
  internal = false
  load_balancer_type = "application"
  subnets = var.subnet_ids
}

resource "aws_lb_target_group" "tg" {
  name = "tg"
  port = 80
  protocol = "HTTP"
  vpc_id = var.vpc_id 
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn 
  port = 80
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.tg.arn  
}
}

resource "aws_lb_target_group_attachment" "frontend" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = var.frontend_instance_id
  port             = 80
}

resource "aws_lb_target_group_attachment" "backend" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = var.backend_instance_id
  port             = 80
}

