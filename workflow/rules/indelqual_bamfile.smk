include: "mask_low-coverage_regions.smk"

rule lofreq_dindel_indelqual:
    input:
        bamfile = config["datadir"] + config["R1"] + config["R2"] + "_primers_removed_bamfile_ivar.bam",
        ref = config["datadir"] + config["R1"] + config["R2"] + config["reference"] + "_masked.fasta"
    output:
        indel_bam = config["datadir"] + config["R1"] + config["R2"] + "_output.indel.bam"
    shell:
        "lofreq indelqual {input.bamfile} --dindel -f {input.ref} -o {output.indel_bam}"

