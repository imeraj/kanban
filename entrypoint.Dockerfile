ARG ELIXIR_VERSION=1.16.0
ARG OTP_VERSION=26.2.1
ARG DEBIAN_VERSION=bullseye-20231009-slim

ARG BUILDER_IMG="hexpm/elixir:${ELIXIR_VERSION}-erlang-${OTP_VERSION}-debian-${DEBIAN_VERSION}"

FROM ${BUILDER_IMG}

CMD []
ENTRYPOINT []
