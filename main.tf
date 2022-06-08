/**
 * ## Usage
 *
 * Creates a component for EC2 Image Builder.
 *
 * ```hcl
 * module "image_builder_component" {
 *   source = "dod-iac/image-builder-component/aws"
 *
 *   name     = format("app-%s-component-%s", var.application, var.environment)
 *   platform = "Linux"
 *   data     = yamlencode(yamldecode(file(format("%s/data.yml", path.module))))
 * }
 * ```
 *
 * Creates a component from a template file for EC2 Image Builder.
 *
 * ```hcl
 * module "image_builder_component" {
 *   source = "dod-iac/image-builder-component/aws"
 *
 *   name     = format("app-%s-component-%s", var.application, var.environment)
 *   platform = "Linux"
 *   data = templatefile(format("%s/component.yml.tpl", path.module), {
 *     account_id = data.aws_caller_identity.current.account_id
 *     bucket     = var.bucket
 *   })
 * }
 * ```
 *
 * Create a series of components for EC2 Image Builder.
 *
 * ```hcl
 * module "image_builder_component" {
 *   source = "dod-iac/image-builder-component/aws"
 *
 *   for_each = toset(["component-a", "component-b", "component-c"])
 *
 *   name     = format("app-%s-%s-%s", var.application, each.key, var.environment)
 *   platform = "Linux"
 *   data     = yamlencode(yamldecode(file(format("%s/%s.yml", path.module, each.key))))
 * }
 * ```
 *
 * ## Terraform Version
 *
 * Terraform 0.13. Pin module version to ~> 1.0.0 . Submit pull-requests to main branch.
 *
 * Terraform 0.11 and 0.12 are not supported.
 *
 * ## License
 *
 * This project constitutes a work of the United States Government and is not subject to domestic copyright protection under 17 USC § 105.  However, because the project utilizes code licensed from contributors and other third parties, it therefore is licensed under the MIT License.  See LICENSE file for more information.
 */

resource "aws_imagebuilder_component" "main" {
  name        = var.name
  description = var.description
  platform    = var.platform
  version     = var.component_version
  data        = length(var.data) > 0 ? var.data : null
  uri         = length(var.uri) > 0 ? var.uri : null
}
