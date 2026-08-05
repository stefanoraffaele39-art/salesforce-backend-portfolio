// 1. Recupero e stampa dei prodotti fittizi (Mock) tramite DTO
List<ProdottoService.ProdottoDTO> prodotti = ProdottoService.getProdottiMock();

System.debug('=== LISTA PRODOTTI APEX ===');
for (ProdottoService.ProdottoDTO p : prodotti) {
    System.debug('ID: ' + p.id + ' | Nome: ' + p.nome + ' | Prezzo: €' + p.prezzo);
}
System.debug('===========================');

// 2. Lettura dei prodotti reali dal database tramite query SOQL
List<Product2> prodottiReali = ProdottoService.getProdottiDB();

System.debug('=== QUERY SOQL ESEGUITA ==='); // Nota: SOQL anziché SQL
System.debug('Numero di prodotti trovati nel DB: ' + prodottiReali.size());
for (Product2 p : prodottiReali) {
    System.debug('ID: ' + p.Id + ' | Nome: ' + p.Name + ' | Codice: ' + p.ProductCode);
}
System.debug('============================');

// 3. Creazione ed inserimento massivo (Bulk Insert) di 5 nuovi record
System.debug('=== INIZIO CREAZIONE PRODOTTI ===');
List<Product2> nuoviProdotti = ProdottoService.creatProdotto(5, 'Router Modello', 'RTR', 'Router ad alta velocitá');
System.debug('=== BULK INSERT COMPLETATO');
System.debug('Numero di prodotti inseriti: ' + nuoviProdotti.size());

for(Product2 p : nuoviProdotti){
    System.debug('ID: ' + p.Id + ' | Nome: ' + p.Name + ' | Codice: ' + p.ProductCode);
}

// 4. Eliminazione selettiva tramite DML Delete di massimo 5 prodotti
ProdottoService.deleteProdotto(5);