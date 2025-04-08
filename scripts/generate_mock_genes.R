# generate_mock_genes.R
# Genereert nep-gengegevens voor het Mockrobiome

set.seed(42)

n_genes <- 10
gene_ids <- paste0("mck", sprintf("%03d", 1:n_genes))
functions <- c(
  "Quantum ATP Synthase",
  "Entropy Stabilizer",
  "Reverse Transcriptinator",
  "Memetic Transferase",
  "Alien Ribosomal Disruptor"
)
lengths <- sample(200:1200, n_genes, replace = TRUE)
assigned_functions <- sample(functions, n_genes, replace = TRUE)

mock_genes <- data.frame(
  gene_id = gene_ids,
  function = assigned_functions,
  length = lengths
)

write.csv(mock_genes, file = "data/fake_genes.csv", row.names = FALSE)
cat("??? Nep-genen opgeslagen in data/fake_genes.csv\n")
