# Verhoogde/verlaagde genexpressie in patienten met reumatoïde artris
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

Met behulp van RStudios wordt een transcriptomics-analyse uitgevoerd op de [ruwe data](data/raw). Voor deze analyse wordt er gebruikgemaakt van het humanereferentiegenoom [NCBI: GCF_000001405.25_GRCh37.p13](https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_000001405.25/). De ruwe data werdt verwerkt aan de hand van dit [script](scripts) waaruit de [verwerkte dataset](data/verwerkt) kwam.

Eerst werdt er een **kwaliteitscontrole** gedaan. Met behulp van `DESeq2` pakket werdt er berekend welke genen significant meer of minder tot expressie kwamen. Vervolgens werden er pathway-analyses gedaan. **Gene Ontology (GO)-analyse** om biologische processen te identificeren die bij RA horen. De **Probability Weighting Funciton (PWF)** laat de genlengte en bias zien. De **KEGG-pathway** maakt een beeld van de genen die verhogen/verlagen in expressie. 

De methode is ook nog stapsgewijs in het [flowschema](assets/FLOWSCHEMA-Transcriptomics.pdf) te zien. 
 

## Resultaten

### Vulcanoplot

Om inzicht te krijgen in eigenschappen van de te gebruiken spreuken is er een overzicht gemaakt, te vinden in [deze tabel](resultaten/top_10_spells.csv). Onvergeeflijke vloeken zijn niet meegenomen in dit overzicht. 

Om een afweging te maken welke spreuken het meest effectief zijn, is er onderzocht of er een verband te vinden is tussen kracht en accuraatheid. In [het resultaat hiervan](resultaten/spell_power_vs_accuracy.png) is te zien dat er een negatieve daling lijkt te zijn in kracht als de accuraatheid toeneemt. Een uitschieter is de onvergeeflijke vloek *Avada Kedavra*, met zowel hoge kracht als accuraatheid. 

## Conclusie

Spreuken met meer accuraatheid lijken minder krachtig te zijn. Een uitzondering op deze trend is de onvergeeflijke vloek *Avada Kedavra*, welke beter niet gebruikt kan worden. 




