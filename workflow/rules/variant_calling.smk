rule call_variant:
    input:
        "masked_dummy"
    output:
        "variant_called_dummy"
    wrapper:
        "v2.2.1/bio/lofreq/call"