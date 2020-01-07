#Makefile

.PHONY: all

all: init plan build

init:
	rm -rf .terraform/modules/
	terraform init -reconfigure

plan:
	terraform plan -refresh=true

build:
	terraform apply -auto-approve

apply: build

check: init
	terraform plan -detailed-exitcode

destroy: init
	terraform destroy -force

docs:
	terraform-docs md . > README.md

valid:
	tflint
	terraform fmt -check=true -diff=true
