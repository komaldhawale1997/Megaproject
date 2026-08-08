output "jenkins_controller_id" {
  description = "Jenkins Controller Instance ID"
  value       = aws_instance.jenkins_controller.id
}

output "build_agent_id" {
  description = "Build Agent Instance ID"
  value       = aws_instance.build_agent.id
}

output "deploy_agent_id" {
  description = "Deploy Agent Instance ID"
  value       = aws_instance.deploy_agent.id
}

output "sonarqube_id" {
  description = "SonarQube Instance ID"
  value       = aws_instance.sonarqube.id
}

output "monitoring_id" {
  description = "Monitoring Server Instance ID"
  value       = aws_instance.monitoring.id
}