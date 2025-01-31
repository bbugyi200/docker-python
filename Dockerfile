FROM python:3.9-bullseye

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

### install and setup pyenv
ENV PYENV_ROOT=/pyenv
ENV PATH="/pyenv/bin:${PATH}"
RUN curl https://pyenv.run | bash
RUN eval "$(pyenv init -)"
RUN pyenv update && pyenv install 3.8.12
RUN pyenv install 3.9.9
RUN pyenv install 3.10.1
RUN pyenv global 3.8.12 3.9.9 3.10.1
# hadolint ignore=SC2016
RUN printf 'export PYENV_ROOT=/pyenv\neval "$(pyenv init --path)"\neval "$(pyenv init - --no-rehash)"\n' >> /bashrc
