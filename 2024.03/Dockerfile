# vim:set ft=dockerfile:

# Do not edit individual Dockerfiles manually. Instead, please make changes to the Dockerfile.template, which will be used by the build script to generate Dockerfiles.

# By policy, the base image tag should be a quarterly tag unless there's a
# specific reason to use a different one. This means January, April, July, or
# October.

FROM cimg/base:2024.02

LABEL maintainer="CircleCI Execution Team <eng-execution@circleci.com>"

RUN sudo apt-get update && sudo apt-get install --yes --no-install-recommends \
		python3-pip \
		rsync \
	&& \
	sudo rm -rf /var/lib/apt/lists/* && \

	# Setup Ansible
	pip install ansible && \
	pip cache purge && \

	# Setup Packer & Terraform
	curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg && \
	echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list && \

	# Setup Salt
	[[ $(uname -m) == "x86_64" ]] && ARCH="amd64" || ARCH="arm64" && \
	sudo curl -fsSL -o /usr/share/keyrings/salt-archive-keyring.gpg https://repo.saltproject.io/py3/ubuntu/20.04/${ARCH}/latest/salt-archive-keyring.gpg && \
	echo "deb [signed-by=/usr/share/keyrings/salt-archive-keyring.gpg arch=${ARCH}] https://repo.saltproject.io/py3/ubuntu/20.04/${ARCH}/latest focal main" | sudo tee /etc/apt/sources.list.d/salt.list && \

	# Setup Kubectl
	# You must use a kubectl version that is within one minor version difference of your cluster. For example, a v1.23 client can communicate with v1.22, v1.23, and v1.24 control planes.
	sudo mkdir -p -m 755 /etc/apt/keyrings && \
	sudo curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg && \
	echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list && \


	# Setup nFPM
	echo 'deb [trusted=yes] https://repo.goreleaser.com/apt/ /' | sudo tee /etc/apt/sources.list.d/goreleaser.list && \

	# Install Helm
	HELM_VER=3.14.2 && \
	curl -sSL "https://get.helm.sh/helm-v${HELM_VER}-linux-${ARCH}.tar.gz" | sudo tar -xz --strip-components=1 -C /usr/local/bin linux-${ARCH}/helm && \
	helm version && \

	# Install tools from added Apt repos
	sudo apt-get update && sudo apt-get install --yes --no-install-recommends \
		kubectl \
		nfpm \
		packer \
		salt-master \
		terraform \
	&& \
	sudo rm -rf /var/lib/apt/lists/*
