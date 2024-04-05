include: "process_SAM_and_BAM_files.smk"

rule remove_primers:
    input:
        in_bam = config["datadir"] + config["R1"] + config["R2"] + "_aligned_reads_sorted_fixmate.bam",
        primers = config["primers"]
    output:
        out_bam = config["datadir"] + config["R1"] + config["R2"] + "_primers_removed_bamfile_ivar.bam"
    shell:
        "ivar trim -i {input.in_bam} -b {input.primers} -p {output.out_bam}"
