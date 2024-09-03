include: "align_reads.smk"

rule sort_BAM_and_SAM_files:
    input:
        samfile = rules.align_reads.output.samfile
    output:
        out_sorted = config["outputdir"] + "sort_BAM_SAM/" + config["R1"] + config["R2"] + "_aligned_reads_sorted.bam"
    message:
        "sorting aligned file(s)..."
    shell:
        "samtools sort -n -O bam -o {output.out_sorted} {input.samfile}"


rule fixmate_files:
    input:
        in_sorted = rules.sort_BAM_and_SAM_files.output.out_sorted
    output:
        out_fixmate = config["outputdir"] + "fixmate/" + config["R1"] + config["R2"] + "_aligned_reads_sorted_fixmate.bam"
    message:
        "utilising fixmate..."
    shell:
        "samtools fixmate -m {input.in_sorted} {output.out_fixmate}"

