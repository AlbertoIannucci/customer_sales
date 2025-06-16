# 🛍️ ETL - Customer Sales Data Project

Questo progetto rappresenta un flusso ETL completo (Estrazione, Trasformazione, Caricamento) per l'analisi e il salvataggio dei dati di vendita cliente a partire da un file CSV.

## 🔧 Funzionalità

- **Pulizia del dataset** con correzione valori, gestione dei `NaN`, normalizzazione formati e rimappatura.
- **Analisi esplorativa** e identificazione outliers.
- **Creazione e popolamento di un database MySQL** con tabelle normalizzate (customer, product_category, store_location, purchase).

## 🧪 Struttura

- `modello_base.py`: Classe astratta con metodi di analisi esplorativa.
- `extract_transform.py`: Classe `DatasetCleaner` che pulisce e trasforma il CSV.
- `load.py`: Funzioni per caricare i dati nel database MySQL.
- `Dataset/`: Contiene il dataset grezzo (opzionale o da fornire in forma anonimizzata).

## 🧰 Tecnologie utilizzate

- **Linguaggi**: Python
- **Librerie principali**: `pandas`, `pymysql`
- **Database**: MySQL

## 🧪 Funzionalità principali

### 1. Data Cleaning (ET)
- Ricostruzione di colonne mancanti tramite relazioni logiche 
- Conversioni di tipo e gestione dei NaN
- Rimappatura colonne in snake_case
- Creazione di codifiche per chiavi esterne

### 2. Database Design (Modello Relazionale)
- Tabelle: `customer`, `product_category`, `store_location`, `purchase`
- Relazioni gestite tramite foreign key

### 3. Data Loading (L)
- Inserimento automatico dei dati tramite `pymysql`
- Separazione tra dati principali e tabelle di decodifica

### 4. Report Analitico
- Insight strategici
- Raccomandazioni per ottimizzazione vendite, retention e gestione stagionale

## 🔒 Licenza

Distribuito sotto licenza MIT. Vedi il file `LICENSE` per maggiori dettagli.
