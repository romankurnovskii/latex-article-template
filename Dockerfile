FROM texlive/texlive:latest

WORKDIR /app

COPY . /app

RUN tlmgr update --self && tlmgr install latexmk
