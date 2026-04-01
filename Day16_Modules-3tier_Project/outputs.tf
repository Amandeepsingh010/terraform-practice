output "frontend_ip" {
  value = module.frontend.public_ip
}

output "backend_ip" {
  value = module.backend.public_ip
}
      