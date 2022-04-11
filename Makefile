project-setup :
		cd 1.project_setup && terraform fmt && terraform init -upgrade && terraform get -update && terraform apply -auto-approve 

cluster-setup : project-setup 
		cd 2.cluster_setup && bash setenv.sh && terraform fmt && terraform init -upgrade && terraform get -update && terraform apply -auto-approve 

namespace-setup : cluster-setup
		cd 3.namespace_setup && bash setenv.sh && terraform fmt && terraform init -upgrade && terraform get -update && terraform apply -auto-approve 

ingress-controller-setup : namespace-setup
		cd 4.ingress-controller-setup && bash setenv.sh && terraform fmt && terraform init -upgrade && terraform get -update && terraform apply -auto-approve -var-file envs/dev.tfvars

tools-setup : ingress-controller-setup
		cd 5.tools-setup && bash setenv.sh && terraform fmt && terraform init -upgrade && terraform get -update && terraform apply -auto-approve -var-file envs/dev.tfvars

domain-setup : tools-setup
		cd 6.domain_setup && bash setenv.sh && terraform fmt && terraform init -upgrade && terraform get -update && terraform apply -auto-approve -var-file envs/dev.tfvars

jenkins-setup : domain-setup 
		cd 7.jenkins-setup && bash setenv.sh && terraform fmt && terraform init -upgrade && terraform get -update && terraform apply -auto-approve -var-file envs/dev.tfvars

nexus-setup : jenkins-setup
		cd 8.nexus-setup && bash setenv.sh && terraform fmt && terraform init -upgrade && terraform get -update && terraform apply -auto-approve -var-file envs/dev.tfvars

vault-setup : nexus-setup
		cd 9.vault-setup && bash setenv.sh && terraform fmt && terraform init -upgrade && terraform get -update && terraform apply -auto-approve -var-file envs/dev.tfvars

sonarqube-setup : vault-setup
		cd 10.sonarqube-setup && bash setenv.sh && terraform fmt && terraform init -upgrade && terraform get -update && terraform apply -auto-approve -var-file envs/dev.tfvars
		