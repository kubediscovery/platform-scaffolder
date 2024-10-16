output "atlantis" {
  value       = helm_release.atlantis
  sensitive   = true
  description = "Result of installation a Atlantis"
}
