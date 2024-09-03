include: "preprocess_reads.smk"

rule build_index:
    input:
        ref_fasta = config["reference"]
    params:
         buildfile_base_name= config["outputdir"] + "buildfiles/buildfile"
    output:
        buildfile1 = config["outputdir"] + "buildfiles/buildfile.1.bt2",
        buildfile2= config["outputdir"] + "buildfiles/buildfile.2.bt2",
        buildfile3= config["outputdir"] + "buildfiles/buildfile.3.bt2",
        buildfile4= config["outputdir"] + "buildfiles/buildfile.4.bt2",
        buildfile5= config["outputdir"] + "buildfiles/buildfile.rev.1.bt2",
        buildfile6= config["outputdir"] + "buildfiles/buildfile.rev.2.bt2"
    shell:
        "bowtie2-build {input.ref_fasta} {params.buildfile_base_name}"


rule align_reads:
    input:
        in_R1 = rules.preprocess_reads.output.out_R1,
        in_R2 = rules.preprocess_reads.output.out_R2,
        buildfile1 = rules.build_index.output.buildfile1,
        buildfile2= rules.build_index.output.buildfile2,
        buildfile3= rules.build_index.output.buildfile3,
        buildfile4= rules.build_index.output.buildfile4,
        buildfile5= rules.build_index.output.buildfile5,
        buildfile6= rules.build_index.output.buildfile6
    output:
        samfile = config["outputdir"] + "bowtie2/" + config["R1"] + config["R2"] + "_aligned_reads.sam"
    message:
        "ALIGNING READS {input.in_R1} AND {input.in_R2}, THIS MAY TAKE SOME TIME..."
    shell:
        "bowtie2 -x ../data/output/buildfiles/buildfile -1 {input.in_R1} -2 {input.in_R2} -S {output.samfile}"

