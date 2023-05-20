# Use a specific version of Fedora
FROM almalinux/9-minimal

LABEL "com.github.actions.name"="Black Code Formatter"
LABEL "com.github.actions.description"="Format Python code using black"
LABEL "com.github.actions.icon"="code"
LABEL "com.github.actions.color"="yellow"

LABEL "repository"="https://github.com/beholdenkey/black-action"
LABEL "homepage"="https://github.com/beholdenkey/black-action"
LABEL "maintainer"="Justin Bailey <justthered63@gmail.com>"

ENV pip_packages "black"

RUN dnf -y update && dnf clean all

# Install pip and other requirements.
RUN dnf makecache \
  && dnf -y install \
  python3-pip \
  sudo \
  which \
  python3-dnf \
  && dnf clean all

# Install pip packages.
RUN pip3 install --upgrade pip \
  && pip3 install $pip_packages

# Copy the entrypoint script
COPY entrypoint.sh /entrypoint.sh

# Ensure the script is executable
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
