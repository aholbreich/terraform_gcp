# terraform_gcp

At the moment example of terraform configuration for Google Cloud Platform.

## Prerequisites
Creadentials are given by environment varible GOOGLE_CREDENTIALS. Set it like e.g.

```
export GOOGLE_CREDENTIALS=$(cat ~/.gce/gce-terraform-key.json)
```

#Usage examples

terraform plan -var-file=prod.tfvar
