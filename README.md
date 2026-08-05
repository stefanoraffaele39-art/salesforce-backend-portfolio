# ⚡ Salesforce Apex Backend Portfolio

Un progetto moderno basato sull'architettura **Salesforce DX (SFDX)** sviluppato in **Apex**, focalizzato sulla progettazione di servizi backend scalabili, gestione del database con query **SOQL** e operazioni **DML bulkified**.

---

## 🚀 Funzionalità & Architettura Backend

Il progetto implementa un servizio di gestione prodotti (`ProdottoService.cls`) con architettura enterprise:

* **Data Transfer Object (DTO):** Disaccoppiamento dei dati tramite classi DTO (`ProdottoDTO`) per un trasferimento dati efficiente e sicuro.
* **Query SOQL Dinamiche:** Ricerca, rilevamento e filtraggio dei dati direttamente a livello di database tramite `SOQL` (wildcards `LIKE`, bind variables `:counter` e clausole `LIMIT`).
* **Operazioni DML Bulkified:** Creazione (`insert`) ed eliminazione (`delete`) massiva dei record gestiti su collezioni (`List<Product2>`), garantendo il totale rispetto dei **Governor Limits** di Salesforce.
* **Clean Code & Security:** Utilizzo rigoroso della direttiva `with sharing` per il rispetto dei permessi dell'utente loggato.

## **Esempi di esecuzione del codice
### **1. Recupero e stampa dei prodotti fittizi (Mock) tramite DTO**
Execute Anonymous: List<ProdottoService.ProdottoDTO> prodotti = ProdottoService.getProdottiMock();
Execute Anonymous: 
Execute Anonymous: System.debug('=== LISTA PRODOTTI APEX ===');
Execute Anonymous: for (ProdottoService.ProdottoDTO p : prodotti) {
Execute Anonymous:     System.debug('ID: ' + p.id + ' | Nome: ' + p.nome + ' | Prezzo: €' + p.prezzo);
Execute Anonymous: }
Execute Anonymous: System.debug('===========================');
//inserire immagine//

### **2. Lettura dei prodotti reali dal database tramite query SOQL**
Execute Anonymous: List<Product2> prodottiReali = ProdottoService.getProdottiDB();
Execute Anonymous: 
Execute Anonymous: System.debug('=== QUERY SOQL ESEGUITA ==='); // Nota: SOQL anziché SQL
Execute Anonymous: System.debug('Numero di prodotti trovati nel DB: ' + prodottiReali.size());
Execute Anonymous: for (Product2 p : prodottiReali) {
Execute Anonymous:     System.debug('ID: ' + p.Id + ' | Nome: ' + p.Name + ' | Codice: ' + p.ProductCode);
Execute Anonymous: }
Execute Anonymous: System.debug('============================');
Execute Anonymous: 
//inserire immagine//

### **3. Creazione ed inserimento massivo (Bulk Insert) di 5 nuovi record**
Execute Anonymous: System.debug('=== INIZIO CREAZIONE PRODOTTI ===');
Execute Anonymous: List<Product2> nuoviProdotti = ProdottoService.creatProdotto(5, 'Router Modello', 'RTR', 'Router ad alta velocitá');
Execute Anonymous: System.debug('=== BULK INSERT COMPLETATO');
Execute Anonymous: System.debug('Numero di prodotti inseriti: ' + nuoviProdotti.size());
Execute Anonymous: 
Execute Anonymous: for(Product2 p : nuoviProdotti){
Execute Anonymous:     System.debug('ID: ' + p.Id + ' | Nome: ' + p.Name + ' | Codice: ' + p.ProductCode);
Execute Anonymous: }
Execute Anonymous: 
//inserire immagini//
### **4. Eliminazione selettiva tramite DML Delete di massimo 5 prodotti**
Execute Anonymous: ProdottoService.deleteProdotto(5);
//inserire immagini//
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

