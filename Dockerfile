FROM hashicorp/terraform:0.12.6 AS terraform
FROM hashicorp/packer:1.4.2 AS packer

FROM alpine:3.9.2 as final

RUN apk add --no-cache git openssh jq

COPY --from=terraform ["/bin/terraform", "/bin/terraform"]
COPY --from=packer ["/bin/packer", "/bin/packer"]
