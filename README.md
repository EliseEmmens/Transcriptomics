# Verhoogde/verlaagde genexpressie in patienten met reumatoïde artris
---
<p align="center">
  <img src="assets/6610f7439ffcd635d26addc1797d59d1.jpg " width="600"/>
</p>

---


Welkom in **Wizarding Spell Metrics**, waar de data nep is, maar de structuur *verrassend oké* is. Deze repo is gemaakt om te laten zie hoe je een bio-informatica project structureert in GitHub met behulp van een onzin dataset. files mogen gedownload en hergebruikt worden (zoals [deze README.md file](README.md)). Vraag ook gerust AI voor tips!

Perfect voor:
- Wegwijs worden in GitHub
- Het leren structureren van data

> `I will not have you in my class if you continue to be a babbling, bumbling band of baboons who can't even SORT their data!`

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

Reumatoïde artritis (RA) is een systemische auto-immuunziekte waar de precieze oorzaak nog niet bekent van is, maar het lijkt op een combinatie van genetische aanleg, omgevingsfactoren en een ontspoort immuunsysteem te zijn _[(Gabriel, 2001)](bronnen/The%20epidemiology%20of%20Rheumatoid%20Arthritis.pdf)_. Typisch voor RA is ontsteking van gewrichtsslijmvlies (synovitis) met gewichtschade als gevolg _[(Radu & Bungau, 2021)](bronnen/Management%20of%20Rheumatoid%20Arthritis%20An%20Overview.pdf)_. De diagnose is op basis van klinische syptomen zoals de aanwezigheid van autoantistoffen. Voor RA is er geen genezing maar wel vertraging van de symptomen door medicijnen _[(Majithia & Geraci, 2007)](bronnen/Rheumatoid%20arthritis%20diagnosis%20and%20managment.pdf)_. 

Het doel van dit onderzoek is om uit te zoeken welke genen er meer of minder tot expressie komen in patienten met RA ten opzichte van de controle groep met behulp van een transcriptomics analyse. 

## Methoden

De samples (4 personen met RA (diagnose van >12 maanden) en 4 personen zonder RA) zijn verkregen via synoviumbiopten: weefsel afkomstig uit gewirchtsslijmvlies. 

Met behulp van RStudios wordt een transcriptomics-analyse uitgevoerd op de [ruwe data](data/raw). Voor deze analyse wordt er gebruikgemaakt van het humanereferentiegenoom [NCBI: GCF_000001405.25_GRCh37.p13](https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_000001405.25/). De ruwe data werdt verwerkt aan de hand van dit [script](scripts) waaruit de [verwerkte dataset](data/verwerkt) kwam.

Eerst werdt er een **kwaliteitscontrole** gedaan. Met behulp van `DESeq2` pakket werdt er berekend welke genen significant meer of minder tot expressie kwamen. Vervolgens werden er pathway-analyses gedaan. **Gene Ontology (GO)-analyse** om biologische processen te identificeren die bij RA horen. De **Pathway Weighting Funciton (PWF)** laat de genlengte en bias zien. De **KEGG-pathway** maakt een beeld van de genen die verhogen/verlagen in expressie. 

De methode is ook nog stapsgewijs in het [flowschema](assets/Flowschema%20transcriptomics-analyse%20RA.pdf) te zien. 
 

## Resultaten


Om inzicht te krijgen in eigenschappen van de te gebruiken spreuken is er een overzicht gemaakt, te vinden in [deze tabel](resultaten/top_10_spells.csv). Onvergeeflijke vloeken zijn niet meegenomen in dit overzicht. 

Om een afweging te maken welke spreuken het meest effectief zijn, is er onderzocht of er een verband te vinden is tussen kracht en accuraatheid. In [het resultaat hiervan](resultaten/spell_power_vs_accuracy.png) is te zien dat er een negatieve daling lijkt te zijn in kracht als de accuraatheid toeneemt. Een uitschieter is de onvergeeflijke vloek *Avada Kedavra*, met zowel hoge kracht als accuraatheid. 

## Conclusie

Spreuken met meer accuraatheid lijken minder krachtig te zijn. Een uitzondering op deze trend is de onvergeeflijke vloek *Avada Kedavra*, welke beter niet gebruikt kan worden. 




