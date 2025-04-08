# analyze_mock_genes.R
# Analyseert (doet alsof) de gegenereerde genen

library(ggplot2)

# Laad gegevens
genes <- read.csv("data/fake_genes.csv")

# Plot lengte per functie
ggplot(genes, aes(x = reorder(function, length), y = length)) +
  geom_col(fill = "#00BFC4") +
  coord_flip() +
  labs(
    title = "???? Lengte van Mockrobiome-genen per functie",
    x = "Functie",
    y = "Lengte (bp)"
  ) +
  theme_minimal()

# Optioneel opslaan
ggsave("plots/mock_gene_lengths.png", width = 8, height = 5)
