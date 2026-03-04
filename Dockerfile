FROM --platform=linux/i386 i386/debian as production

RUN apt update && apt install -fy gcc make gdb python3 less file vim gosu checksec strace

COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN useradd -m -s /bin/bash user

RUN mkdir -p /workdir && chown user:user /workdir

WORKDIR /workdir

COPY bof0.c bof0.c

RUN gcc -m32 -no-pie -fno-stack-protector -z execstack -o bof0 bof0.c

RUN chown root:root bof0 && chmod u+rws,g+rs,o+rx bof0

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/workdir/bof0"]
