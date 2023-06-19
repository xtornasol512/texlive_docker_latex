Hello!!

The following image contain the Latex installation via texlive

You can configure the installation

Specify a custom directory to work with:
`/app/build/.texlive`

Update the path ENV VAR

TODO add tlmgr install packages

RUN the image

`$ docker build -f Dockerfile -t latex_install:mytag . > build.log`



NOTEs:


Note that amd64 was chosen in order to see the effect of instalation on apple m2 chip, it works a bit not smoothie but works fine.

FROM amd64/python:3.9.16-buster AS texlive


