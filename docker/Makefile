SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.ONESHELL :
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

.terraform: init
.terraform.lock.hcl: init

#VARIABLES
SSH_PUB_KEY = ./

CLOUD_IP = $(shell terraform output -raw IP)

#INSTRUCTIONS

.PHONY: init
init:
	terraform init

.PHONY: refresh
refresh:
	terraform refresh

.PHONY: plan
plan:
	terraform plan

.PHONY: apply
apply:
	terraform apply

.PHONY: list
list:
	terraform state list

.PHONY: inspect
inspect:
	terraform show

.PHONY: destroy
destroy:
	terraform destroy

.PHONY: output
output:
	terraform output

.PHONY: bootstrap
bootstrap:
