# Verhoogde activiteit van ontstekingsgenen bij Reumatoïde Artritis 
---
<p align="center">
  <img src="assets/6610f7439ffcd635d26addc1797d59d1.jpg " width="600"/>
</p>

---



## 📁 Inhoud

- `README.md` - het document om de tekst hier te genereren
- `data/raw/` – Ruwe data (4 patienten met RA en 4 controle)  
- `data/processed` - verwerkte datasets gegenereerd met script 
- `scripts/` – Casus script 
- `resultaten/` - grafieken en tabellen
- `bronnen/` - gebruikte bronnen 
- `assets/` - overige documenten voor de opmaak
- `data_stewardship/` - Voor de competentie beheren ga je aantonen dat je projectgegevens kunt beheren met behulp van GitHub. In deze folder kan je hulpvragen terugvinden om je op gang te helpen met de uitleg van data stewardship. 

---

## Introductie

Reumatoïde artritis (RA) is een systemische auto-immuunziekte waarvan de exacte oorzaak nog niet bekent is. Mogelijk ontstaat RA door een combinatie van genetische aanleg, omgevingsfactoren en een ontspoort immuunsysteem _[(Gabriel, 2001)](bronnen/The%20epidemiology%20of%20Rheumatoid%20Arthritis.pdf)_. 

Een typisch verschijnsel bij RA is synovitis, een ontsteking van gewrichtsslijmvlies, wat uiteindelijk leidt tot gewichtschade _[(Radu & Bungau, 2021)](bronnen/Management%20of%20Rheumatoid%20Arthritis%20An%20Overview.pdf)_. 
De diagnose is op basis van klinische syptomen zoals de aanwezigheid van autoantistoffen, zoals ACPA. Dat meet autoantistoffen tegen het CCP (cyclische gecitrullineerde peptiden) eiwit. Momenteel is er geen genezing voor RA kunnen medicijnen wel de symptomen onderdrukken _[(Majithia & Geraci, 2007)](bronnen/Rheumatoid%20arthritis%20diagnosis%20and%20managment.pdf)_. Aangezien er geen genezing is, is het van belang om een vroege diagnose te kunnen stellen zodat de patiënt eerder kan beginnen met medicijnen. 


> Het doel van dit onderzoek is om, met behulp van transcriptomics, te achterhalen welke genen significant verschillen in expressie tussen patienten met RA en gezonde controles. Daarnaast wordt onderzocht welke biologische processen en pathways betrokken zijn bij RA.

## Methoden

De samples (4 personen met RA en 4 personen zonder RA) zijn verkregen via synoviumbiopten: weefsel afkomstig uit gewirchtsslijmvlies. De patiënten met RA zijn positief getest op ACPA, met een diagnose langer dan 12 maanden. 

Met behulp van RStudios wordt een transcriptomics-analyse uitgevoerd op de [ruwe data](data/raw). Voor deze analyse wordt er gebruikgemaakt van het humanereferentiegenoom [NCBI: GCF 000001405.25 GRCh37.p13](https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_000001405.25/). De ruwe data werdt verwerkt aan de hand van dit [script](scripts) waaruit de [verwerkte dataset](data/verwerkt) kwam.

Eerst werdt er een **kwaliteitscontrole** gedaan. Met behulp van `DESeq2` pakket werdt er berekend welke genen significant meer of minder tot expressie kwamen. Vervolgens werden er pathway-analyses gedaan. **Gene Ontology (GO)-analyse** om biologische processen te identificeren die bij RA horen. De **KEGG-pathway** maakt een beeld van de genen die verhogen/verlagen in expressie. 

De methode is ook nog stapsgewijs in het [flowschema](assets/FLOWSCHEMA-Transcriptomics.pdf) te zien. 
 

## Resultaten
De resultaten zijn verkregen via het [script](scripts) hieruit zijn resultaten gekomen, waaronder de Volcano-plot, GO-analyse, PWF-plot en KEGG-pathway

#### _Volcanoplot_

De volcano plots laten de spreiding van differentieel tot expressie komende genen weer. In de [plot met p-waarde](resultaten/VolcanoPlot_P-Value2.0.png) zijn bijvoorbeeld de genen zoals ANKRD30BL, MT-ND6, COL6A5 gelabled als significant (padj<0,05 en log2fc van >1 of <-1). Deze kunnen relevant zijn voor de ziekteoorzaak van RA. De [volcanoplot zonder p-waarde](resultaten/VolcanoplotCasusRA.png) geeft een vollediger beeld van welke genen het interessantste zijn voor onderzoek. Het grote deel van de genen rond de log2FC = 0 zijn minder interessant. 

#### _GO-analyse_

De GO-analyse laat zien welke biologische processen, moleculaire functies en cellulaire componenten betrokken zijn bij RA. De [GO-analyse](resultaten/GO-Analyseplot.png) geeft hits(%), GO-termen, p-waarde en counts weer. De visualisatie toont dat de termen zoals 'protein binding, 'immune system process' en 'interacellulair organelle lumen' een lage p-waarde en hoge count hebben. Opvallend is dat er veel genen zijn die te maken hebben met het afweersysteem. De hoge hits bevestigt dat er veel genen in RA betrokken zijn bij bepaalde GO-termen. 

#### _KEGG-Pathway_

De [pathview](resultaten/hsa05323.pathview.png) is gebasseerd op de KEGG-pathway voor [rheumatoid arthritis (hsa05323)](https://www.kegg.jp/pathway/hsa05323) en geeft de genen weer die binnen de bekende pathway verhoogd of verlaagd in expressie. Cytokines zoals M-CSF, IL-17, TGFβ en IL23 zijn upregulated (rood), wat past bij de rol in ontstekingprocessen en synoviale activatie bij RA. Meerdere andere genen zijn downregulated (groen) wat kan wijzen op negatieve feedbackmeganismen of onderdrukking van het afweersysteem. 

## Conclusie
De resultaten van de volcano-plots, GO-analyse en KEGG-pathway geven het beeld dat bij mensen met RA bepaalde genen meer of minder actief zijn dan de controle. Vooral de genen die een rol spelen bij het afweersysteem. Dit komt omdat RA er voor zorgt dat het afweersysteem lichaamseigen weefsel aanvalt. 
De KEGG-pathway laat zien dat ontstekingsfactoren zoals IL-17 en IL-23 actiever zijn bij RA patiënten. Deze bevindingen kunnen gekoppeld worden aan bekende RA-mechanismen. Ook de GO-analyse laat zien dat genen die betrokken zijn bij eiwitbinding en ontstekingsreacties veel voorkomen. 

Voor vervolgonderzoek zou gekeken kunnen worden naar sterk gereguleerde genen en cytokines in RA-patiëntenmateriaal, meerdere KEGG-analyse van meerdere pathways om andere betrokken routes in kaart te brengen. Zo mogelijk het vergroten van de dataset zodat de resultaten betrouwbaarder worden. 





