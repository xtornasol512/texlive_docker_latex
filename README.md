Hello!!

The following image contain the Latex installation via texlive

You can configure the installation

Specify a custom directory to work with:
`/app/build/.texlive`

Update the path ENV VAR

TODO add tlmgr install packages

RUN the image

`$ docker build --build-arg ARCH_DIR=aarch64-linux -f Dockerfile -t latex_install:mytag . > build.log`


Read the notes below to choose the correct ARCH_DIR value

NOTES:

Custom Installation: Using texlive
Custom Directory: `/build/.texlive/`
Adding custom PATH, differs when use apple sillicon or intel chips
Add new packages with tlmgr

Docker installation cover for two architectures: x86_64(most intel & amd chips), and ARMv8(apple silicon chips)

To see what your architecture is, type the following command:
`uname -m`

| Host Architecture | Docker Architecture |
|-------------------|---------------------|
| x86_64            | amd64               |
| ARMv7             | armv7               |
| ARMv8 (ARM64)     | arm64v8             |
| PowerPC           | ppc64le             |
| IBM Z             | s390x               |
| Apple Silicon     | arm64v8             |


FOR Apple sillicon the ARCH_TYPE value is: aarch64-linux
FOR intel and amd chips is okay using: x86_64-linux
