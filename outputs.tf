output "arn" {
  value       = aws_imagebuilder_component.main.arn
  description = "The ARN of the EC2 Image Builder component."
}
