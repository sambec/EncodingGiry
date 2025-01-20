
# 📜 Arthur Giry's Correspondence: Letters from Colleagues and Students Across Europe

Welcome to this repository, which aims to preserve and showcase the scholarly correspondence received by **Arthur Giry** from his colleagues and former students across Europe. This project focuses on the letters sent to Giry as part of his research for his monumental work, *Manuel de diplomatique* published in 1894.

## 📝 Project Overview

Arthur Giry, a renowned French historian and paleographer, played a key role in the development of **diplomatics**, the critical study of historical documents. His book, *Manuel de diplomatique*, remains an essential reference in the field. Throughout the years leading up to its publication, Giry corresponded with many scholars, researchers, and former students who provided critical insights and resources to aid in his research.

This repository contains XML-encoded transcriptions of letters Giry received in french 🇫🇷, highlighting the intellectual exchanges that contributed to the **formation of his ideas** and **methodological advancements** in diplomatics.

## 💡 Objectives of this Project

The purpose of this project is to:
1. **Preserve historical correspondence**: By digitizing and encoding these letters, we aim to make this valuable scholarly exchange accessible to a wider audience.
2. **Highlight Giry's research network**: Show how Arthur Giry’s collaborations across Europe influenced his work on diplomatics.
3. **Facilitate analysis**: Using XML to structure the content enables thematic and contextual analysis, which can support deeper research into Giry's contributions to history and diplomatics.
4. **Provide open access**: All XML files are published under an open license to encourage further research and academic use.

## 📂 Repository Structure

```plaintext
📦 Arthur-Giry-Correspondence/
│
├── 📂 EncodingSchema/            # Schema and transformation files for encoding
│   ├── my_generated.html         # HTML output generated from the ODD file
│   ├── my_generated.odd          # Main ODD customization file
│   ├── odd2relaxng.xsl           # XSLT stylesheet for ODD to RNG conversion
│   ├── oddbyexample.xsl          # XSLT stylesheet for generating ODD by example
│   ├── template.dtd              # Base DTD template for XML validation
│   ├── template.xml              # XML template for encoding
│   ├── transform.xsl             # XSLT stylesheet for transformations
│   ├── transformation-html.py    # Python script for HTML transformation
│   └── transformation-odd.py     # Python script for ODD transformation
│
├── 📂 LettersEncoding/           # Encoded letters following TEI guidelines
│   ├── georges_guigue.xml        # Letter from Georges Guigue
│   ├── leon_dorez.xml            # Letter from Léon Dorez
│   └── theophile_dufour.xml      # Letter from Théophile Dufour
│
├── 📂 Resources/                 # Supporting materials and resources
│   ├── LettersDigital/           # Digitized scans of the letters
│   ├── LettersTranscription/     # Transcriptions of the letters
│   └── XML-project-30oct/        # Additional XML-related resources
│
├── LICENSE                       # License for the project
└── README.md                     # Documentation of the repository
```

### **`EncodingSchema/`**  
Contains all resources related to the encoding schema:  

- **`giry_correspondence.dtd`**: Defines the DTD used to encode Giry’s correspondence.  
- **`my_generated.odd`**: ODD file defining custom encoding rules.  
- **`transform.xsl`**: Transformation file for converting XML into other formats.  
- **Support files**: Includes templates (`template.dtd`, `template.xml`) and auxiliary scripts (`transformation-odd.py`, `transformation-html.py`) for encoding and processing.  

### **`LettersEncoding/`**  
This folder contains XML-encoded letters, adhering to TEI guidelines:  

- **`georges_guigue.xml`**: A letter from Georges Guigue.  
- **`leon_dorez.xml`**: A letter from Léon Dorez.  
- **`theophile_dufour.xml`**: A letter from Théophile Dufour.  

Each letter includes metadata (sender, recipient, date) and a full transcription.  

### **`Resources/`**  
Contains supplementary materials:  

- **`LettersDigital/`**: Digitized scans of the original letters.  
- **`LettersTranscription/`**: Text-based transcriptions of the letters.  
- **`XML-project-30oct/`**: Additional reference files and working drafts.  

---

## ⚙️ Encoding Standards  

All letters in this repository are encoded in XML following the TEI (Text Encoding Initiative) guidelines. Key features include:  

- **Metadata**: Sender, recipient, date, and location information.  
- **Letter transcription**: Complete text of each letter.  
- **Annotations**: Notes on historical figures, places, and key concepts.  

Validation is performed using:  
- RelaxNG schema generated from the ODD file.  
- Schematron rules to enforce additional constraints (e.g., mandatory attributes).  

## 🛠️ How to Use This Repository

1. **Browse the XML files** to read through the encoded letters.
2. **Download and parse** the XML data for further research or integration with digital humanities projects.
3. **Use schema files**: Refer to the **`EncodingSchema/`** folder for encoding and validation rules.  

## 🏛️ Historical Significance

These letters not only shed light on the creation of Giry's *Manuel de diplomatique* but also offer insights into the broader academic network in **19th-century Europe**. The letters demonstrate how scholars across borders collaborated to shape the understanding of medieval documentation and diplomatic practices.

## 📖 Further Reading

- **Arthur Giry**: [Wikipedia Entry](https://en.wikipedia.org/wiki/Arthur_Giry)
- **Manuel de diplomatique (1894)**: [Full text on Gallica](https://gallica.bnf.fr/)
- **TEI Guidelines**: [TEI-C](https://tei-c.org/guidelines/)

## 🤝 Contributions

Contributions to this project are welcome! If you have additional letters or materials related to Arthur Giry or would like to improve the encoding, feel free to open an issue or submit a pull request.

## 📄 License

This project is licensed under the **Creative Commons Attribution 4.0 International (CC BY 4.0)**. You are free to share, copy, and adapt the material as long as appropriate credit is given.
