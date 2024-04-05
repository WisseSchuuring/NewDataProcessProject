include: "preprocess_reads.smk"
rule align_reads:
    input:
        in_R1 = config["datadir"] + "output/" + config["R1"] + "_preprocessed.fq.gz",
        in_R2 = config["datadir"] + "output/" + config["R2"] + "_preprocessed.fq.gz",
        buildfile1 = "../data/output/buildfile.1.bt2",
        buildfile2= "../data/output/buildfile.2.bt2",
        buildfile3= "../data/output/buildfile.3.bt2",
        buildfile4= "../data/output/buildfile.4.bt2",
        buildfile5= "../data/output/buildfile.rev.1.bt2",
        buildfile6= "../data/output/buildfile.rev.2.bt2"
    output:
        samfile = config["datadir"] + config["R1"] + config["R2"] + "_aligned_reads.sam"
    message:
        "ALIGNING READS {input.in_R1} AND {input.in_R2}, THIS MAY TAKE SOME TIME..."
    shell:
        "bowtie2 -x ../data/output/buildfile -1 {input.in_R1} -2 {input.in_R2} -S {output.samfile}"


rule build_index:
    input:
        ref_fasta = config["reference"]
    output:
        buildfile1 = "../data/output/buildfile.1.bt2",
        buildfile2= "../data/output/buildfile.2.bt2",
        buildfile3= "../data/output/buildfile.3.bt2",
        buildfile4= "../data/output/buildfile.4.bt2",
        buildfile5= "../data/output/buildfile.rev.1.bt2",
        buildfile6= "../data/output/buildfile.rev.2.bt2"
    shell:
        "bowtie2-build {input.ref_fasta} ../data/output/buildfile"
