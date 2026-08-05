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

    public static List<ProdottoDTO> getProdotti(){
        List<ProdottoDTO> listaProdotti = new List<ProdottoDTO>();
        listaProdotti.add(new ProdottoDTO('1', 'Router Enterprise SF', 350.00));
        listaProdotti.add(new ProdottoDTO('2', 'Switch Managed 24P', 180.50));
        return listaProdotti;
    }
}