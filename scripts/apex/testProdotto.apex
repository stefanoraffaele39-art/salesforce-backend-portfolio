List<ProdottoService.ProdottoDTO> prodotti = ProdottoService.getProdottiMock();

// Cicla sui prodotti e stampa i dati nel log di debug
System.debug('=== LISTA PRODOTTI APEX ===');
for (ProdottoService.ProdottoDTO p : prodotti) {
    System.debug('ID: ' + p.id + ' | Nome: ' + p.nome + ' | Prezzo: €' + p.prezzo);
}
System.debug('===========================');

List<Product2> prodottiReali = ProdottoService.getProdottiDB();

System.debug('=== QUERY SQL ESEGUITA ===');
System.debug('Numero di prodotti trovati nel DB: ' + prodottiReali.size());
for (Product2 p : prodottiReali) {
    System.debug('ID: ' + p.Id + ' | Nome: ' + p.Name + ' | Codice: ' + p.ProductCode);
}
System.debug('============================');

System.debug('=== INIZIO CREAZIONE PRODOTTI ===');
List<Product2> nuoviProdotti = ProdottoService.creatProdotto(5, 'Router Modello', 'RTR', 'Router ad alta velocitá');
System.debug('=== BULK INSERT COMPLETATO');
System.debug('Numero di prodotti inseriti: ' + nuoviProdotti.size());

for(Product2 p : nuoviProdotti){
    System.debug('ID: ' + p.Id + ' | Nome: ' + p.Name + ' | Codice: ' + p.ProductCode);
}

//ProdottoService.deleteProdotto(4);
