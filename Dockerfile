FROM ibmcom/ibm-cloud-developer-tools-amd64:latest

ENV LC_ALL=en_US.UTF-8
ENV IKS_BETA_VERSION=1
ENV ZSH=/root/.oh-my-zsh

# Update IBM Cloud CLI & plugins
RUN bx update -f && \
    bx plugin update --all -f

RUN apk add --no-cache \
        zsh \
        curl

# change default shell from ash to bash
RUN sed -i -e "s/bin\/ash/bin\/zsh/" /etc/passwd

RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$ZSH/custom}/plugins/zsh-autosuggestions && \
    # Install power line fonts
    git clone https://github.com/powerline/fonts.git --depth=1 && \
    cd fonts && \
    ./install.sh && \
    cd .. && \
    rm -rf fonts

WORKDIR /root

COPY zsh.d /root/
COPY _zshrc /root/.zshrc
COPY kube-ps1.sh /root/kube-ps1.sh

CMD "/bin/zsh"
