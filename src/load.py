from extract_transform import  modello
import pymysql

# Funzione per ottenere la stringa di connessione
def _getconnection():
    return pymysql.connect(
        host="localhost",
        port=3306,
        user="root",
        password="",
        database="customer_purchases"
    )

# Funzione per il caricamento dei dati nel db (per tabelle di decodifica)
def load_decodifica(df):
    with _getconnection() as connection:
        with connection.cursor() as cursor:
            customer_unici = df["name"].unique()
            product_category_unici = df["product_category"].unique()
            store_location_unici = df["store_location"].unique()

            valori_customer = [(cus,) for cus in customer_unici]
            valori_product_category = [(pro,) for pro in product_category_unici]
            valori_store_location = [(sto,) for sto in store_location_unici]

            # Caricamento dati nelle diverse tabelle
            cursor.executemany("INSERT INTO customer(name) VALUES (%s)", valori_customer)
            cursor.executemany("INSERT INTO product_category(name) VALUES (%s)", valori_product_category)
            cursor.executemany("INSERT INTO store_location(name) VALUES (%s)", valori_store_location)

            connection.commit()

            print("Dati caricati con successo")
# Funzione per il caricamento dei dati nella main table
def load(df):
    with _getconnection() as connection:
        with connection.cursor() as cursor:
            sql = ("INSERT INTO purchase(fk_id_customer, email, purchase_amount, purchase_date, fk_id_product_category, quantity, discount_applied, fk_id_store_location) "
                   "VALUES (%s, %s, %s, %s, %s, %s, %s, %s)")
            valori = [(row["customer_id"],
                       row["email"],
                       row["purchase_amount"],
                       row["purchase_date"],
                       row["product_category_id"],
                       row["quantity"],
                       row["discount_applied"],
                       row["store_location_id"]) for _, row in df.iterrows()]
            cursor.executemany(sql, valori)

            connection.commit()
            print("Dati caricati con successo")


#load_decodifica(modello.dataframe_sistemato)
#load(modello.dataframe_sistemato)