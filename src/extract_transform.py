from modello_base import ModelloBase
import pandas as pd
from dateutil import parser
import numpy as np

class DatasetCleaner(ModelloBase):

    # Metodo di inizializzazione
    def __init__(self, dataset_path):
        self.dataframe = pd.read_csv(dataset_path)
        self.dataframe_sistemato = self.sistemazione()

    # Metodo di sistemazione
    def sistemazione(self):
        # Copia del dataframe
        df_sistemato = self.dataframe.copy()

        # Rimappatura variabile Name
        name_mapping = {
            "JANE SMITH": "Jane Smith",
            "mike brown": "Mike Brown",
            "Samanth Lee": "Samantha Lee"
        }
        df_sistemato["Name"] = df_sistemato["Name"].replace(name_mapping)

        df_sistemato = df_sistemato.drop("Customer_ID", axis=1)

        # Rimappatura variabile Email
        df_sistemato["Email"] = df_sistemato["Email"].replace("jane.smith@EMAIL.com", "jane.smith@email.com")

        # Conversione valori negativi Purchase_Amount
        df_sistemato["Purchase_Amount"] = df_sistemato["Purchase_Amount"].abs()

        # Gestione valori nan Purchase_Amount
        df_sistemato["Purchase_Date"] = df_sistemato["Purchase_Date"].replace(np.nan, "2024-01-07")
        # Conversione variabile Purchase_Date
        df_sistemato["Purchase_Date"] = df_sistemato["Purchase_Date"].apply(
            lambda x: parser.parse(x, dayfirst=False).date() if pd.notnull(x) else np.nan)
        df_sistemato["Purchase_Date"] = pd.to_datetime(df_sistemato["Purchase_Date"])

        # Rimappatura Product_Category
        product_category_mapping = {
            "clothing":"Clothing",
            "FURNITURE":"Furniture",
            "Beuty":"Beauty"
        }
        df_sistemato["Product_Category"] = df_sistemato["Product_Category"].replace(product_category_mapping)

        # Rimappatura Quantity
        df_sistemato["Quantity"] = df_sistemato["Quantity"].replace("two", "2")

        # Rimappatura Discount_Applied
        discount_mapping = {
            "yes":"True",
            "no":"False"
        }
        df_sistemato["Discount_Applied"] = df_sistemato["Discount_Applied"].replace(discount_mapping)

        # Rimappatura Store_Location
        store_location_mapping = {
            "los angeles":"Los Angeles",
            "CHICAGO":"Chicago",
            "houston":"Houston"
        }
        df_sistemato["Store_Location"] = df_sistemato["Store_Location"].replace(store_location_mapping)

        # Sostituzione valori nan Email
        # Creo una mappa dai nomi alle Email non nan
        email_map = df_sistemato.dropna(subset=['Email']).drop_duplicates('Name').set_index('Name')['Email']

        # Riempi i valori nan nella colonna Email usando la mappa
        df_sistemato['Email'] = df_sistemato.apply(
            lambda row: email_map[row['Name']] if pd.isnull(row['Email']) and row['Name'] in email_map else row[
                'Email'],
            axis=1
        )

        # Sostituzione valori nan Purchase_Amount
        df_sistemato["Purchase_Amount"] = df_sistemato.groupby(["Product_Category"])["Purchase_Amount"].transform(
            lambda x: x.fillna(x.median())
        )

        # Sostituzione valori nan Quantity
        df_sistemato["Quantity"] = df_sistemato["Quantity"].astype(float)
        df_sistemato["Quantity"] = df_sistemato.groupby([ "Purchase_Amount"])[
            "Quantity"].transform(
            lambda x: x.fillna(x.median())
        )
        df_sistemato["Quantity"] = df_sistemato["Quantity"].astype(int)

        # Gestione valori nan Discount_Applied
        df_sistemato["Discount_Applied"] = df_sistemato.groupby(["Product_Category"])[
            "Discount_Applied"].transform(
            lambda x: x.fillna(x.mode()[0])
        )

        df_sistemato = df_sistemato.rename(columns={
            "Name":"name",
            "Email":"email",
            "Purchase_Amount":"purchase_amount",
            "Purchase_Date":"purchase_date",
            "Product_Category":"product_category",
            "Quantity":"quantity",
            "Discount_Applied":"discount_applied",
            "Store_Location":"store_location"
        })

        # Inserimento colonne di codifica
        nomi_unici = df_sistemato["name"].unique()
        mappa_nome_id = dict(zip(nomi_unici, range(1, len(nomi_unici) + 1)))
        df_sistemato["customer_id"] = df_sistemato["name"].replace(mappa_nome_id)

        mappa_product_category = dict(zip(df_sistemato["product_category"].unique(), range(1, df_sistemato["product_category"].nunique() + 1)))
        df_sistemato["product_category_id"] = df_sistemato["product_category"].replace(mappa_product_category)

        mappa_store_location = dict(zip(df_sistemato["store_location"].unique(), range(1, df_sistemato["store_location"].nunique() + 1)))
        df_sistemato["store_location_id"] = df_sistemato["store_location"].replace(mappa_store_location)

        return df_sistemato

# Estrazione dataset
modello = DatasetCleaner("../Dataset/dataset.csv")
# Trasfromazione
# Passo 1. Analisi generali del dataset
#modello.analisi_generali(modello.dataframe)
# Risultati:
# Osservazioni= 55; Variabili= 9; Tipi= object e float; Valori nan= presenti
# Passo 2. Analisi valori univoci
#modello.analisi_valori_univoci(modello.dataframe)
# Customer_ID -> Rimappatura con una nuova colonna più coerente
# Name -> Rimappatura
# Purchase_Amount -> Presenza di valori negativi e outliers -> conversione in valore assoluto e gestione outliers
# Purchase_Date -> Conversione in formato data
# Product_Category -> Rimappatura
# Quantity -> Rimappatura
# Discount_Applied -> Rimappatura
# Store_Location -> Rimappatura
# Passo 3. Rimappatura variabile Customer_ID
# Passo 4. Rimappatura variabile Name
# Passo 5. Rimappatura variabile Email
# Passo 6. Gestione valori negativi variabile Purchase_Amount
# Passo 7. Conversione variabile Purchase_Date e gestione valori nan (sostituzione nan con data 2024-07-01)
# Passo 8. Rimappatura Product_Category
# Passo 9. Rimappatura Quantity
# Passo 10. Rimappatura Discount_Applied
# Passo 11. Rimappatura Store_Location
# Passo 12. Gestione valori nan Email
# Passo 13. Gestione valori nan Purchase_Amount
# Passo 14. Gestione valori nan Quantity
# Passo 15. Gestione valori nan Discount_Applied
# Passo 16. Rimappatura etichette snake_case
# Passo 17. Inserimento colonne di codifica per agevolare l’implementazione di tabelle di decodifica all'interno di un database MySQL
modello.analisi_generali(modello.dataframe_sistemato)