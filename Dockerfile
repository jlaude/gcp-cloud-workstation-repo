FROM us-central1-docker.pkg.dev/cloud-workstations-images/predefined/code-oss:latest

RUN sudo apt-get update

# Install extensions for Code OSS

RUN wget https://open-vsx.org/api/vscjava/vscode-java-debug/0.40.1/file/vscjava.vscode-java-debug-0.40.1.vsix && \
unzip vscjava.vscode-java-debug-0.40.1.vsix "extension/*" &&\
mv extension /opt/code-oss/extensions/java-debug

RUN wget https://open-vsx.org/api/vscjava/vscode-java-dependency/0.19.1/file/vscjava.vscode-java-dependency-0.19.1.vsix && \
unzip vscjava.vscode-java-dependency-0.19.1.vsix "extension/*" &&\
mv extension /opt/code-oss/extensions/java-dependency

RUN wget https://open-vsx.org/api/redhat/java/1.6.0/file/redhat.java-1.6.0.vsix && \
unzip redhat.java-1.6.0.vsix "extension/*" &&\
mv extension /opt/code-oss/extensions/redhat-java

RUN wget https://open-vsx.org/api/vscjava/vscode-maven/0.35.2/file/vscjava.vscode-maven-0.35.2.vsix && \
unzip vscjava.vscode-maven-0.35.2.vsix "extension/*" &&\
mv extension /opt/code-oss/extensions/java-maven

RUN wget https://open-vsx.org/api/vscjava/vscode-java-test/0.35.0/file/vscjava.vscode-java-test-0.35.0.vsix && \
unzip vscjava.vscode-java-test-0.35.0.vsix "extension/*" &&\
mv extension /opt/code-oss/extensions/java-test

RUN wget https://open-vsx.org/api/hashicorp/terraform/linux-x64/2.25.2/file/hashicorp.terraform-2.25.2@linux-x64.vsix && \
unzip hashicorp.terraform-2.25.2@linux-x64.vsix "extensions/*" &&\
mv extension /opt/code-oss/extensions/hashicorp-terraform

# Install Terraform
RUN sudo apt-get install -y gnupg software-properties-common

RUN wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

RUN sudo apt update

RUN sudo apt-get install terraform
