<p align="center">
  <img src="assets/Logo_SpellMetrics.png" alt="Wizarding Spell Metrics Logo" width="600"/>
</p>


# Verhoogde/verlaagde genexpressie in patienten met reumatoïde artris

Welkom in **Wizarding Spell Metrics**, waar de data nep is, maar de structuur *verrassend oké* is. Deze repo is gemaakt om te laten zie hoe je een bio-informatica project structureert in GitHub met behulp van een onzin dataset. files mogen gedownload en hergebruikt worden (zoals [deze README.md file](README.md)). Vraag ook gerust AI voor tips!

Perfect voor:
- Wegwijs worden in GitHub
- Het leren structureren van data

> `I will not have you in my class if you continue to be a babbling, bumbling band of baboons who can't even SORT their data!`

## 📁 Inhoud/structuur

- `README.md` - het document om de tekst hier te genereren
- `data/raw/` – fictionele datasets voor de analyse van spreuk effectiviteit, gevaar en welke spreuken het beste samengaan met verschillende types staf.  
- `data/processed` - verwerkte datasets gegenereerd met scripts 
- `scripts/` – Casus script 
- `resultaten/` - grafieken en tabellen
- `bronnen/` - gebruikte bronnen 
- `assets/` - overige documenten voor de opmaak van deze pagina
- `data_stewardship/` - Voor de competentie beheren ga je aantonen dat je projectgegevens kunt beheren met behulp van GitHub. In deze folder kan je hulpvragen terugvinden om je op gang te helpen met de uitleg van data stewardship. 

---

## Introductie

Reumatoïde artritis (RA) is een systemische auto-immuunziekte waar de precieze oorzaak nog niet bekent van is, maar het lijkt op een combinatie van genetische aanleg, omgevingsfactoren en een ontspoort immuunsysteem te zijn [(Gabriel, 2001)](bronnen/The%20epidemiology%20of%20Rheumatoid%20Arthritis.pdf). Typisch voor RA is ontsteking van gewrichtsslijmvlies (synovitis) met gewichtschade als gevolg [(Radu & Bungau, 2021)](bronnen/Management%20of%20Rheumatoid%20Arthritis%20An%20Overview.pdf). De diagnose is op basis van klinische syptomen zoals de aanwezigheid van autoantistoffen. Voor RA is er geen genezing maar wel vertraging van de symptomen door medicijnen [(Majithia & Geraci, 2007)](bronnen/Rheumatoid%20arthritis%20diagnosis%20and%20managment.pdf). 

Het doel van dit onderzoek is om uit te zoeken welke genen er hoger of lager tot expressie komen in patienten met RA ten opzichte van de controle groep met behulp van een transcriptomics analyse. 

## Methoden

De samples - 4 personen met RA (diagnose van >12 maanden) en 4 personen zonder RA - zijn verkregen via synoviumbiopt: weefsel afkomstig uit gewirchtsslijmvlies. 
Met behulp van R studios wordt een transcriptomics analyse uitgevoerd van [ruwe data](data\raw). Om zo uiteindelijk te kijken welke genen meer of minder tot expressie komen bij personen met RA in vergelijking met de controlegroep. Ook kijkend naar de pathways die bij RA betrokken zijn met behulp van een Gene Ontology analyse (GO) aan de hand van dit [script](scripts) waaruit ook [verwerkte dataset](data\processed\Data_RA_raw\GCF_000001405.25_GRCh37.p13_genomic.gtf\DATA\Data_RA_raw) kwam. 

## Resultaten

Om inzicht te krijgen in eigenschappen van de te gebruiken spreuken is er een overzicht gemaakt, te vinden in [deze tabel](resultaten/top_10_spells.csv). Onvergeeflijke vloeken zijn niet meegenomen in dit overzicht. 

Om een afweging te maken welke spreuken het meest effectief zijn, is er onderzocht of er een verband te vinden is tussen kracht en accuraatheid. In [het resultaat hiervan](resultaten/spell_power_vs_accuracy.png) is te zien dat er een negatieve daling lijkt te zijn in kracht als de accuraatheid toeneemt. Een uitschieter is de onvergeeflijke vloek *Avada Kedavra*, met zowel hoge kracht als accuraatheid. 

## Conclusie

Spreuken met meer accuraatheid lijken minder krachtig te zijn. Een uitzondering op deze trend is de onvergeeflijke vloek *Avada Kedavra*, welke beter niet gebruikt kan worden. 




