include: "process_SAM_and_BAM_files.smk"

rule remove_primers:
    input:
        in_bam = rules.fixmate_files.output.out_fixmate,
        primers = config["primers"]
    output:
        out_bam = config["outputdir"] + "remove_primers/" + config["R1"] + config["R2"] + "_primers_removed_bamfile_ivar.bam"
    shell:
        "ivar trim -i {input.in_bam} -b {input.primers} -p {output.out_bam}"
