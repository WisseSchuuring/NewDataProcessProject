include: "lineage_identification.smk"

rule create_visual:
    input:
        pangolin_csv = rules.identify_lineage.output.csv_file
    output:
        barplot_png = config["outputdir"] + "visual/pangolin_plot.png"
    script:
        "../scripts/CovVisualizer.Rmd"
