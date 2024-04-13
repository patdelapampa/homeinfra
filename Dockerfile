ARG MICRODIR=/microdir
ARG PACKAGES_TO_INSTALL="webmin openssl "

FROM redhat/ubi9 AS BUILD
ARG MICRODIR
ARG PACKAGES_TO_INSTALL
RUN curl -o setup-repos.sh https://raw.githubusercontent.com/webmin/webmin/master/setup-repos.sh && \
    sh ./setup-repos.sh -f && \
    mkdir ${MICRODIR}
RUN dnf install \
    --installroot ${MICRODIR} \
    # --setop install_weak_deps=false \
    -y \
    ${PACKAGES_TO_INSTALL} && \
    dnf clean all \
    --installroot ${MICRODIR}

FROM redhat/ubi9-minimal AS IMAGE
ARG MICRODIR
COPY --from=BUILD ${MICRODIR}/ . 
EXPOSE 10000
CMD ["webmin"]
