<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Usage

Creates a component for EC2 Image Builder.

```hcl
module "image_builder_component" {
  source = "dod-iac/image-builder-component/aws"

  name     = format("app-%s-component-%s", var.application, var.environment)
  platform = "Linux"
  data     = yamlencode(yamldecode(file(format("%s/data.yml", path.module))))
}
```

Creates a component from a template file for EC2 Image Builder.

```hcl
module "image_builder_component" {
  source = "dod-iac/image-builder-component/aws"

  name     = format("app-%s-component-%s", var.application, var.environment)
  platform = "Linux"
  data = templatefile(format("%s/component.yml.tpl", path.module), {
    account_id = data.aws_caller_identity.current.account_id
    bucket     = var.bucket
  })
}
```

Create a series of components for EC2 Image Builder.

```hcl
module "image_builder_component" {
  source = "dod-iac/image-builder-component/aws"

  for_each = toset(["component-a", "component-b", "component-c"])

  name     = format("app-%s-%s-%s", var.application, each.key, var.environment)
  platform = "Linux"
  data     = yamlencode(yamldecode(file(format("%s/%s.yml", path.module, each.key))))
}
```

## Terraform Version

Terraform 0.13. Pin module version to ~> 1.0.0 . Submit pull-requests to main branch.

Terraform 0.11 and 0.12 are not supported.

## License

This project constitutes a work of the United States Government and is not subject to domestic copyright protection under 17 USC § 105.  However, because the project utilizes code licensed from contributors and other third parties, it therefore is licensed under the MIT License.  See LICENSE file for more information.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_imagebuilder_component.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/imagebuilder_component) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_component_version"></a> [component\_version](#input\_component\_version) | The version of the component. | `string` | `"1.0.0"` | no |
| <a name="input_data"></a> [data](#input\_data) | Inline YAML string with data of the component. Exactly one of data and uri can be specified. | `string` | `""` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the component. | `string` | `"An component for EC2 Image Builder."` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the component. | `string` | n/a | yes |
| <a name="input_platform"></a> [platform](#input\_platform) | The platform of the component. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | The tags applied to the component. | `map(string)` | `{}` | no |
| <a name="input_uri"></a> [uri](#input\_uri) | S3 URI with data of the component. Exactly one of data and uri can be specified. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the EC2 Image Builder component. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
