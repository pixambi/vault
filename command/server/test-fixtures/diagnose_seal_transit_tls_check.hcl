# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: BUSL-1.1

disable_cache = true
disable_mlock = true

ui = true

listener "tcp" {
    address = "127.0.0.1:1024"
    tls_disable = true
}

backend "consul" {
    address = "127.0.0.1:8500"
    foo = "bar"
    advertise_addr = "foo"
}

seal "transit" {

  // TLS Configuration
  tls_ca_cert        = "{REPLACE_COMBINED_CA_CHAIN_FILE}"
  tls_client_cert    = "{REPLACE_LEAF_CERT_FILE}"
  tls_client_key     = "{REPLACE_LEAF_KEY_FILE}"
  tls_server_name    = "vault"
  tls_skip_verify    = "false"
}

ha_backend "consul" {
    address = "127.0.0.1:8500"
    bar = "baz"
    advertise_addr = "https://127.0.0.1:8500"
    disable_clustering = "true"
}

service_registration "consul" {
    address = "127.0.0.1:8500"
    foo = "bar"
}

telemetry {
    statsd_address = "bar"
    usage_gauge_period = "5m"
    maximum_gauge_cardinality = 100

    statsite_address = "foo"
    dogstatsd_addr = "127.0.0.1:7254"
    dogstatsd_tags = ["tag_1:val_1", "tag_2:val_2"]
    metrics_prefix = "myprefix"
}

max_lease_ttl = "10h"
default_lease_ttl = "10h"
cluster_name = "testcluster"
pid_file = "./pidfile"
raw_storage_endpoint = true
disable_sealwrap = true
disable_printable_check = true
enable_multiseal = true