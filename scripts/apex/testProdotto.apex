List<ProdottoService.ProdottoDTO> prodotti = ProdottoService.getProdotti();

System.debug('=== LISTA PRODOTTI APEX ===');
for (ProdottoService.ProdottoDTO p : prodotti) {
    System.debug('ID: ' + p.id + ' | Nome: ' + p.nome + ' | Prezzo: €' + p.prezzo);
}
System.debug('============================');