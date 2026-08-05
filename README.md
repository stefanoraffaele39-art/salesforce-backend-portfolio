# ⚡ Salesforce Apex Backend Portfolio

Un progetto moderno basato sull'architettura **Salesforce DX (SFDX)** sviluppato in **Apex**, focalizzato sulla progettazione di servizi backend scalabili, gestione del database con query **SOQL** e operazioni **DML bulkified**.

---

## 🚀 Funzionalità & Architettura Backend

Il progetto implementa un servizio di gestione prodotti (`ProdottoService.cls`) con architettura enterprise:

* **Data Transfer Object (DTO):** Disaccoppiamento dei dati tramite classi DTO (`ProdottoDTO`) per un trasferimento dati efficiente e sicuro.
* **Query SOQL Dinamiche:** Ricerca, rilevamento e filtraggio dei dati direttamente a livello di database tramite `SOQL` (wildcards `LIKE`, bind variables `:counter` e clausole `LIMIT`).
* **Operazioni DML Bulkified:** Creazione (`insert`) ed eliminazione (`delete`) massiva dei record gestiti su collezioni (`List<Product2>`), garantendo il totale rispetto dei **Governor Limits** di Salesforce.
* **Clean Code & Security:** Utilizzo rigoroso della direttiva `with sharing` per il rispetto dei permessi dell'utente loggato.

---

## 🛠️ Tecnologie Utilizzate

* **Salesforce Apex** (Language Runtime)
* **Salesforce DX (SFDX CLI)** per il ciclo di vita del codice (Deploy, Retrieve, Apex Anonymous)
* **SOQL** (Salesforce Object Query Language)
* **Git & GitHub** per il controllo versione Source-Driven
* **Visual Studio Code** + Salesforce Extension Pack

---

## 📁 Struttura del Progetto

```text
├── force-app/main/default/
│   ├── classes/
│   │   ├── ProdottoService.cls         # Service Class Backend
│   │   └── ProdottoService.cls-meta.xml # Metadati Salesforce Class
├── manifest/
│   └── package.xml                     # Manifest dichiarativo dei metadati
├── scripts/apex/
│   └── testProdotto.apex                      # Anonymous Apex Script per i test di esecuzione
└── sfdx-project.json                   # Configurazione Salesforce DX

