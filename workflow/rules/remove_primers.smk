rule remove_primers:
    input:
        in_bam = "processed_reads_sorted.bam",
        primers = "primers.bed"
    output:
        out_bam = "primers_removed_bamfile_ivar.bam"
    shell:
        "ivar trim -i {input.in_bam} -b {input.primers} -p {output.out_bam} -e"
