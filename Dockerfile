FROM python:3.9-bullseye

## install and setup pyenv
RUN curl https://pyenv.run | bash
ENV PATH="/root/.pyenv/bin:${PATH}"
RUN eval "$(pyenv init -)"
RUN pyenv install 3.7.12
RUN pyenv install 3.8.12
RUN pyenv install 3.9.7
RUN pyenv global 3.9.7 3.8.12 3.7.12
RUN echo 'export PATH=$HOME/.pyenv/bin:$PATH' >> $HOME/.bashrc
RUN echo 'eval "$(pyenv init -)"' >> $HOME/.bashrc
