from pathlib import Path
from lxml import etree

# Définir les chemins des dossiers
input_folder = Path("/home/sarah/Documents/EncodingGiry/LettersEncoding")  # Remplacez par le chemin de votre dossier XML
output_folder = Path("/home/sarah/Documents/EncodingGiry/XSLT-project/output")  # Remplacez par le chemin de votre dossier output
output_folder.mkdir(parents=True, exist_ok=True)  # Crée le dossier output s'il n'existe pas

# Charger le fichier XSLT
try:
    xslt_path = Path("/home/sarah/Documents/EncodingGiry/XSLT-project/encoding-schemas/transformHTML.xslt")  # Chemin vers votre fichier XSLT
    xslt = etree.parse(str(xslt_path))
    transform = etree.XSLT(xslt)
except Exception as e:
    print(f"Erreur lors du chargement du fichier XSLT : {e}")
    raise SystemExit  # Arrêter l'exécution si le fichier XSLT ne peut pas être chargé

# Lister les fichiers XML
xml_files = list(input_folder.glob("*.xml"))
html_files = []

# Générer les fichiers HTML avec navigation
for i, xml_file in enumerate(xml_files):
    try:
        print(f"Traitement du fichier : {xml_file.name}")
        xml = etree.parse(str(xml_file))

        # Debug : Afficher le contenu du fichier XML
        print(etree.tostring(xml, pretty_print=True).decode())

        html_filename = f"{xml_file.stem}.html"
        output_file = output_folder / html_filename

        prev_letter = f"{xml_files[i - 1].stem}.html" if i > 0 else None
        next_letter = f"{xml_files[i + 1].stem}.html" if i < len(xml_files) - 1 else None

        # Appliquer la transformation XSLT avec debug
        print(f"Applying XSLT transformation on {xml_file.name}")
        result = transform(xml, prev_link=etree.XSLT.strparam(prev_letter or ""),
                                next_link=etree.XSLT.strparam(next_letter or ""))

        with open(output_file, "wb") as f:
            f.write(etree.tostring(result, pretty_print=True, method="html"))

        print(f"Fichier généré : {output_file.name}")

    except Exception as e:
        print(f"Erreur lors du traitement de {xml_file.name}: {e}")


# Générer une page d'index avec des liens vers toutes les lettres
index_html = output_folder / "index.html"
with open(index_html, "w", encoding="utf-8") as f:
    f.write("<html><head><title>Index des Lettres</title></head><body>\n")
    f.write("<h1>Correspondance d'Arthur Giry</h1>\n<ul>\n")
    for html_file in html_files:
        f.write(f'<li><a href="{html_file}">{html_file.replace(".html", "").replace("_", " ")}</a></li>\n')
    f.write("</ul>\n</body></html>")
print("Page d'index générée : index.html")