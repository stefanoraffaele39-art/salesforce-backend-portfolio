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
<img width="967" height="126" alt="Screenshot 2026-08-05 163606" src="https://github.com/user-attachments/assets/616f29e2-5630-41ba-affe-054d2f516e2a" />

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
<img width="1282" height="465" alt="Screenshot 2026-08-05 163943" src="https://github.com/user-attachments/assets/2e546d43-779f-4438-b852-34abd97dd2b5" />


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
<img width="1070" height="211" alt="Screenshot 2026-08-05 164105" src="https://github.com/user-attachments/assets/5ee28b83-d6eb-4fc8-88e6-d33746bfbce6" />
<img width="1264" height="569" alt="Screenshot 2026-08-05 164157" src="https://github.com/user-attachments/assets/5ec1018c-666b-44a3-a60c-a5a72e89bc47" />

### **4. Eliminazione selettiva tramite DML Delete di massimo 5 prodotti**
Execute Anonymous: ProdottoService.deleteProdotto(5);
<img width="965" height="210" alt="Screenshot 2026-08-05 164318" src="https://github.com/user-attachments/assets/48bca694-60d1-453b-b140-0ad84f73fef9" />
<img width="1282" height="465" alt="Screenshot 2026-08-05 163943" src="https://github.com/user-attachments/assets/d9b2f4ce-2ae9-4093-9ae9-96f03e0ca2f2" />

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

