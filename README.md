# straycat-terraform

The root of the Straycat infrastructure Terraform.

This repository is the root repository for Terraform.  It's role is to establish the remote state bucket and setup the logging for it so we can track state file changes.

## Terraform Structure
Our Terraform design assumes all Terraform code should live as close to the service that it manages as possible.  Additionally we want the infrastructure to be as open and accessible as possible but still limit access to anything we deem sensitive; that could take the form of private repos or restricting write access.  To accomplish this we separate our concerns into individual repositories.

We have two types of Terraform repositories:
* Module repositories
* Service repositories

Additionally Terrafrom code may live within an application code repository.

### Module Repositories
Terraform modules describe how to build infrastructure.

Module repositories are for Terraform modules that will be reused.  They cannot by themself deploy a service.  Instead they are consumed by service repositories.  Their job is to define a repeatable design to follow.  These modules define a group or resoruces and how they interact with one another and/or conventions such as naming of resources.  These modules are opinionated but flexible ro prevent the need to create a duplicate module.

### Service Repositories
Terraform service define what infrastructure looks like.

Service repositories are for managing pieces of our infrastructure.  They are typically foundational blocks that don't correspond to a particular application.  For example:
* AWS VPC
* AWS IAM
  * A service may add additional roles
* AWS Route53
  * records may be added by an application

___Note: We are currently mixing modules into our service repos.  We should probably stop that and move our modules into their own repos for consistency.___

### Application Repositories
Application repositories define what a particular application should look like when deployed.

Taerraform code should live as close to the application code that is to be managed.  It should live under the ___deploy/___ directory of the repository.

