setwd("C:/Users/elise/OneDrive - NHL Stenden/Jaar 2/Periode 4/WC transcriptonics/Casus/Data_RA_raw/")
library(clusterProfiler)
library(org.Hs.eg.db)
library(Rsubread)
library(Rsamtools)
library(readr)
library(dplyr)
library(DESeq2)
library(EnhancedVolcano)
library(goseq)
library(TxDb.Hsapiens.UCSC.hg38.knownGene)
library(GO.db)
library(ggplot2)

# DATA VOORBEREIDING 
    # Index bouwen 

  buildindex(
    basename = "ref_human",
    reference = 'GCF_000001405.25_GRCh37.p13_genomic.gtf/GCF_000001405.25_GRCh37.p13_genomic.gtf',
    memory = 6000,
    indexSplit = TRUE)
    # Alingeren van reads
        # Normal monsters
          align.norm1 <- align(index = "ref_human", readfile1 = "SRR4785819_1_subset40k.fastq", readfile2 = "SRR4785819_2_subset40k.fastq", output_file = "norm1.BAM")
          align.norm2 <- align(index = "ref_human", readfile1 = "SRR4785820_1_subset40k.fastq", readfile2 = "SRR4785820_2_subset40k.fastq", output_file = "norm2.BAM")
          align.norm3 <- align(index = "ref_human", readfile1 = "SRR4785828_1_subset40k.fastq", readfile2 = "SRR4785828_2_subset40k.fastq", output_file = "norm3.BAM")
          align.norm4 <- align(index = "ref_human", readfile1 = "SRR4785831_1_subset40k.fastq", readfile2 = "SRR4785831_2_subset40k.fastq", output_file = "norm4.BAM")
        # RA monsters
          align.RA1 <- align(index = "ref_human", readfile1 = "SRR4785979_1_subset40k.fastq", readfile2 = "SRR4785979_2_subset40k.fastq", output_file = "RA1.BAM")
          align.RA2 <- align(index = "ref_human", readfile1 = "SRR4785980_1_subset40k.fastq", readfile2 = "SRR4785980_2_subset40k.fastq", output_file = "RA2.BAM")
          align.RA3 <- align(index = "ref_human", readfile1 = "SRR4785986_1_subset40k.fastq", readfile2 = "SRR4785986_2_subset40k.fastq", output_file = "RA3.BAM")
          align.RA4 <- align(index = "ref_human", readfile1 = "SRR4785988_1_subset40k.fastq", readfile2 = "SRR4785988_2_subset40k.fastq", output_file = "RA4.BAM")

        # Bestandsnamen van de monsters
          samples <- c('norm1', 'norm2', 'norm3', 'norm4', 'RA1', 'RA2', 'RA3', 'RA4')
    # Sorteren en indexeren
lapply(samples, function(s) {sortBam(file = paste0(s, '.BAM'), destination = paste0(s, '.sorted'))})
lapply(samples, function(s) {indexBam(file = paste0(s, '.sorted.bam'), destination = paste0(s, '.sorted.bam'))})

# FEATURE COUNTS

    # GTF voorbereiden
gtf <- read_tsv("Casus/GCF_000001405.25_GRCh37.p13_genomic.gtf.gz", comment = "#", col_names = FALSE)
        # Kolomnamen toevoegen
          colnames(gtf) <- c("seqid", "source", "type", "start", "end", "score", "strand", "phase", "attributes")
        # Alleen genregels selecteren
          gtf_gene <- gtf %>% filter(type == "gene")
        # 'type' aanpassen naar 'exon' zodat featureCounts het accepteert
          gtf_gene$type <- "exon"
  # Je definieert een vector met namen van BAM-bestanden. Elke BAM bevat reads van een RNA-seq-experiment (bijv. behandeld vs. controle).
allsamples <- c("Casus/Data_RA_raw/GCF_000001405.25_GRCh37.p13_genomic.gtf/DATA/Data_RA_raw/RA1.BAM", 
                "Casus/Data_RA_raw/GCF_000001405.25_GRCh37.p13_genomic.gtf/DATA/Data_RA_raw/RA2.BAM", 
                "Casus/Data_RA_raw/GCF_000001405.25_GRCh37.p13_genomic.gtf/DATA/Data_RA_raw/RA3.BAM", 
                "Casus/Data_RA_raw/GCF_000001405.25_GRCh37.p13_genomic.gtf/DATA/Data_RA_raw/RA4.BAM", 
                "Casus/Data_RA_raw/GCF_000001405.25_GRCh37.p13_genomic.gtf/DATA/Data_RA_raw/norm1.BAM", 
                "Casus/Data_RA_raw/GCF_000001405.25_GRCh37.p13_genomic.gtf/DATA/Data_RA_raw/norm2.BAM", 
                "Casus/Data_RA_raw/GCF_000001405.25_GRCh37.p13_genomic.gtf/DATA/Data_RA_raw/norm3.BAM", 
                "Casus/Data_RA_raw/GCF_000001405.25_GRCh37.p13_genomic.gtf/DATA/Data_RA_raw/norm4.BAM" )

count_matrix <- featureCounts(
  files = allsamples,
    annot.ext = "Casus/Data_RA_raw/GCF_000001405.25_GRCh37.p13_genomic.gtf/GCF_000001405.25_GRCh37.p13_genomic.gtf",
  isPairedEnd = TRUE,
  isGTFAnnotationFile = TRUE,
  GTF.attrType = "gene_id",
  useMetaFeatures = TRUE
)

        head(count_matrix$annotation)
        head(count_matrix$counts)
        str(count_matrix)
    # Haal alleen de matrix met tellingen eruit
      counts.GTF <- count_matrix$counts
      colnames(counts.GTF) <- c("RA1", "RA2", "RA3", "RA4", "norm1", "norm2", "norm3", "norm4")
      write.csv(counts.GTF, "bewerkt_countmatrix.GTF.csv")

      Count_matrix_groot <- read.table("C:/Users/elise/OneDrive - NHL Stenden/Jaar 2/Periode 4/WC transcriptonics/Casus/Data_RA_raw/GCF_000001405.25_GRCh37.p13_genomic.gtf/DATA/Data_RA_raw/count_matrix.txt")
      write.csv(Count_matrix_groot, "Count_matrix_groot.csv")
      head(Count_matrix_groot)
      Count_matrix_groot

# DESeq2 ANALYSE
      
  counts <- read.csv("Casus/Data_RA_raw/GCF_000001405.25_GRCh37.p13_genomic.gtf/Count_matrix_groot.csv")
  Count_matrix_groot

  treatment <- c("RA1", "RA2", "RA3", "RA4", "norm1", "norm2", "norm3", "norm4")
  treatment_table <- data.frame(treatment)
  rownames(treatment_table) <- c("RA1", "RA2", "RA3", "RA4", "norm1", "norm2", "norm3", "norm4")
  head(treatment)
  treatment_table
  treatment_table$treatment <- factor(c(rep("norm", 4), rep("RA", 4)))

  ncol(Count_matrix_groot)        # aantal samples (kolommen in counts)
  nrow(treatment_table)  # aantal sample-informatie rijen
  any(counts %% 1 != 0)  # TRUE betekent dat er decimalen in zitten
  Count_matrix_groot <- round(Count_matrix_groot)
  treatment_table$treatment <- factor(treatment_table$treatment)
  head(Count_matrix_groot)

    # Maak DESeqDataSet aan
      dds <- DESeqDataSetFromMatrix(countData = Count_matrix_groot,
                              colData = treatment_table,
                              design = ~ treatment)
      table(treatment_table$treatment)
    # Voer analyse uit

      dds <- DESeq(dds)
      resultaten <- results(dds)
      write.table(resultaten, file = 'ResultatenCasusRAVersie2.csv', row.names = TRUE, col.names = TRUE)

          # Stap 1: Hoeveel genen zijn er écht veranderd? Hier tellen we hoeveel genen er significant op- of neer-gereguleerd zijn.
            sum(resultaten$padj < 0.05 & resultaten$log2FoldChange > 1, na.rm = TRUE)
            sum(resultaten$padj < 0.05 & resultaten$log2FoldChange < -1, na.rm = TRUE)

          # Stap 2: Welke genen springen eruit? Nu sorteren we het resultaat om te kijken naar de opvallendste genen:
            hoogste_fold_change <- resultaten[order(resultaten$log2FoldChange, decreasing = TRUE), ]
            laagste_fold_change <- resultaten[order(resultaten$log2FoldChange, decreasing = FALSE), ]
            laagste_p_waarde <- resultaten[order(resultaten$padj, decreasing = FALSE), ]
            head(laagste_p_waarde)

# VISUALISATIE
head(rownames(resultaten))
resultaten_df <- as.data.frame(resultaten)
resultaten_df$gene <- rownames(resultaten_df)

    EnhancedVolcano(resultaten_df,
                lab = resultaten_df$gene,
                x = 'log2FoldChange',
                y = 'padj')


    # Alternatieve plot zonder p-waarde cutoff (alle genen zichtbaar)
      EnhancedVolcano(resultaten_df,
                lab = resultaten_df$gene,
                x = 'log2FoldChange',
                y = 'padj',
                pCutoff = 0)
    # Figuur opslaan
      dev.copy(png, 'VolcanoplotCasusRA.png', 
         width = 8,
         height = 10,
         units = 'in',
         res = 500)
      dev.off()

# KEGG PATHWAY-ANALYSE

  gene_vector <- resultaten$log2FoldChange
  names(gene_vector) <- rownames(resultaten)

  pathview(
    gene.data = gene_vector,
    pathway.id = "hsa05323",  
    species = "hsa",         
    gene.idtype = "SYMBOL",  
    limit = list(gene = 5))

      #error matrix goed inladen
        head(rownames(resultaten), 10)
        counts <- read.csv("Count_matrix_groot.csv", row.names = 1)  # Neem eerste kolom als rownames
      #herhaling desq analyse
        counts <- round(counts)  # Rond af
        dds <- DESeqDataSetFromMatrix(countData = counts,
                              colData = treatment_table,
                              design = ~ treatment)
        dds <- DESeq(dds)
        resultaten <- results(dds)
        resultaten <- as.data.frame(resultaten)
      #GEN iD opslaan:
        resultaten$ENSEMBL <- rownames(resultaten)

        
          converted <- bitr(resultaten$ENSEMBL,
                  fromType = "SYMBOL",
                  toType = "ENTREZID",
                  OrgDb = org.Hs.eg.db)
          resultaten$SYMBOL <- resultaten$ENSEMBL
        # Mergen
          resultaten <- dplyr::left_join(
                    resultaten,
                    converted,
                    by = c("SYMBOL" = "SYMBOL")
                    )
gene_vector <- resultaten$log2FoldChange
names(gene_vector) <- resultaten$ENTREZID


# GO ANALYSE MET GOSEQ
    sig_genes <- resultaten %>%
        filter(!is.na(padj)) %>%
        filter(padj < 0.05 & abs(log2FoldChange) > 1)
    gene_list <- as.integer(rownames(resultaten) %in% rownames(sig_genes))
    names(gene_list) <- rownames(resultaten)

    if (!all(grepl("^[0-9]+$", rownames(resultaten)))) {
  # Converteer SYMBOL naar ENTREZ
    converted_ids <- bitr(rownames(resultaten), 
                        fromType = "SYMBOL", 
                        toType = "ENTREZID", 
                        OrgDb = org.Hs.eg.db)
  # Maak een named vector met ENTREZIDs
    entrez_ids <- converted_ids$ENTREZID[match(rownames(resultaten), converted_ids$SYMBOL)]
    names(gene_list) <- entrez_ids
  # Verwijder NA genen (geen mapping gevonden)
    gene_list <- gene_list[!is.na(names(gene_list))]
    }
    
    txdb <- TxDb.Hsapiens.UCSC.hg38.knownGene
    exons_by_gene <- exonsBy(txdb, by = "gene")
    gene_lengths <- sum(width(reduce(exons_by_gene)))
    common_genes <- intersect(names(gene_list), names(gene_lengths))

      gene_list_filtered <- gene_list[common_genes]
      gene_lengths_filtered <- gene_lengths[common_genes]

    pwf <- nullp(gene_list_filtered, bias.data = gene_lengths_filtered)


     all <- rownames(resultaten)
      deg <- resultaten %>%
      filter(padj < 0.05)
      deg <- rownames(deg)


      gene.vector=as.integer(all%in%deg)
      names(gene.vector)=all 
          head(gene.vector)
          tail(gene.vector)
  
    pwf <- nullp(gene.vector, genome = "hg19", id = "geneSymbol")
    GO.wall <- goseq(pwf, "hg19", "geneSymbol")
    #How many enriched GO terms do we have
        class(GO.wall)
        head(GO.wall)
        nrow(GO.wall)

      top_terms <- GO.wall %>%
         filter(over_represented_pvalue < 0.05) %>%
         arrange(over_represented_pvalue) %>%
         head(20)  # of 10 of 30, naar wens
    
# BARPOT
   ggplot(top_terms, aes(x = reorder(term, -log10(over_represented_pvalue)),
                         y = -log10(over_represented_pvalue),
                         fill = ontology)) +
     geom_bar(stat = "identity") +
     coord_flip() +  # horizontale balken
     labs(title = "Top verrijkte GO-termen",
          x = "GO term",
          y = "-log10(p-waarde)",
          fill = "Ontologie") +
     theme_minimal(base_size = 14)
   
   # Ander plot
   GO.wall %>%
     top_n(10, wt = -over_represented_pvalue) %>%
     mutate(hitsPerc = numDEInCat * 100 / numInCat) %>%
     ggplot(aes(x = hitsPerc,
                y = term,
                colour = over_represented_pvalue,
                size = numDEInCat)) +
     geom_point() +
     expand_limits(x = 0) +
     labs(x = "Hits (%)", y = "GO term", colour = "p value", size = "Count") +
     
   
# KEGG PATHWAY
   top_terms$kegg_url <- paste0("https://www.genome.jp/dbget-bin/www_bget?pathway:", top_terms$category)
   write.csv(top_terms, "Top_KEGG_Pathways.csv", row.names = FALSE)
   