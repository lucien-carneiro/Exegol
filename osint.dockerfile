# Author: Charlie BROMBERG (Shutdown - @_nwodtuhs)

FROM debian

ARG TAG="local"
ARG VERSION="local"
ARG BUILD_DATE="n/a"

LABEL org.exegol.tag="${TAG}"
LABEL org.exegol.version="${VERSION}"
LABEL org.exegol.build_date="${BUILD_DATE}"
LABEL org.exegol.app="Exegol"
LABEL org.exegol.src_repository="https://github.com/ShutdownRepo/Exegol-images"

RUN echo "${TAG}-${VERSION}" > /opt/.exegol_version

ADD sources /root/sources
RUN chmod +x /root/sources/install.sh

RUN /root/sources/install.sh install_base

# WARNING: install_most_used_tools can't be used with other functions other than: install_base, install_clean
# RUN /root/sources/install.sh install_most_used_tools

# WARNING: the following installs (except: install_base, install_clean) can't be used with install_most_used_tools
# this is a temporary limitation
RUN /root/sources/install.sh install_misc_tools
# RUN /root/sources/install.sh install_wordlists_tools
# RUN /root/sources/install.sh install_cracking_tools
RUN /root/sources/install.sh install_osint_tools
# RUN /root/sources/install.sh install_web_tools
# RUN /root/sources/install.sh install_c2_tools
# RUN /root/sources/install.sh install_services_tools
# RUN /root/sources/install.sh install_ad_tools
# RUN /root/sources/install.sh install_mobile_tools
# RUN /root/sources/install.sh install_iot_tools
# RUN /root/sources/install.sh install_rfid_tools
# RUN /root/sources/install.sh install_sdr_tools
# RUN /root/sources/install.sh install_network_tools
# RUN /root/sources/install.sh install_wifi_tools
# RUN /root/sources/install.sh install_forensic_tools
# RUN /root/sources/install.sh install_cloud_tools
# RUN /root/sources/install.sh install_steganography_tools
# RUN /root/sources/install.sh install_reverse_tools
# RUN /root/sources/install.sh install_code_analysis_tools

RUN /root/sources/install.sh install_clean

RUN rm -rf /root/sources

WORKDIR /data
#CMD ["/bin/zsh"]
