package main

# Guardrail: Block any VPC configuration that opens routing parameters directly to the public internet
deny[msg] {
    resource := input.resource_changes[_]
    resource.type == "aws_vpc"
    resource.change.after.cidr_block == "0.0.0.0/0"
    
    msg := sprintf("🚨 CRITICAL COMPLIANCE VIOLATION: Managed VPC '%v' cannot be assigned an open routing mask (0.0.0.0/0) due to HIPAA/GDPR isolation rules.", [resource.name])
}
