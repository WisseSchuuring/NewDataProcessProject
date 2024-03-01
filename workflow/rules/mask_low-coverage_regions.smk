rule mask_lowCoverage_regions:
    input:
        "primers_removed_dummy"
    output:
        "masked_dummy"
    wrapper:
        "v2.2.1/bio/bedtools/bamtobed"