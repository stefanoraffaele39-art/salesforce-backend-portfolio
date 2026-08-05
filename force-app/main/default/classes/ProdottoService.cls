public with sharing class ProdottoService {
    public class ProdottoDTO {
        public String id { get; set; }
        public String nome { get; set; }
        public Decimal prezzo { get; set; }

        public ProdottoDTO(String id, String nome, Decimal prezzo) {
            this.id = id;
            this.nome = nome;
            this.prezzo = prezzo;
        }
    }

    public static List<ProdottoDTO> getProdottiMock(){
        List<ProdottoDTO> listaProdotti = new List<ProdottoDTO>();
        listaProdotti.add(new ProdottoDTO('1', 'Router Enterprise SF', 350.00));
        listaProdotti.add(new ProdottoDTO('2', 'Switch Managed 24P', 180.50));
        return listaProdotti;
    }

    public static List<Product2> getProdottiDB(){
        List<Product2> prodottoDB = [
            SELECT Id, Name, ProductCode, Description, IsActive 
            FROM Product2
            WHERE IsActive = true 
            LIMIT 50
        ];

        return prodottoDB;
    }

    public static List<Product2> creatProdotto(Integer counter, String nome, String codiceProdotto, String descrizione){
        List<Product2> prodottiDaAggiungere = new List<Product2>();
        for(Integer i = 0; i < counter; i++){
            Product2 nuovoProdotto = new Product2();
            nuovoProdotto.Name = nome + i;
            nuovoProdotto.ProductCode = codiceProdotto;
            nuovoProdotto.Description = descrizione;
            nuovoProdotto.IsActive = true;

            prodottiDaAggiungere.add(nuovoProdotto);
        }
        insert prodottiDaAggiungere;

        return prodottiDaAggiungere; 
    }

    public static void deleteProdotto(Integer counter){
        System.debug('=== INIZIO ELIMINAZIONE PRODOTTI ===');
        List<Product2> prodottiToDelete = [
        SELECT Id, Name
        FROM Product2
        WHERE Name LIKE 'Router Modello%'
        LIMIT :counter
         ];

        System.debug('Prodotti trovati da eliminare: ' + prodottiToDelete.size());
        if (!prodottiToDelete.isEmpty()) {
        for (Product2 p : prodottiToDelete) {
            System.debug('Elimino ID: ' + p.Id + ' | Nome: ' + p.Name);
        }
        
         delete prodottiToDelete;
            System.debug('=== ELIMINAZIONE COMPLETATA CON SUCCESSO ===');
        } else {
            System.debug('Nessun prodotto trovato da eliminare.');
        }
    }
}