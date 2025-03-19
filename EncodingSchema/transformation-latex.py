from pathlib import Path
from lxml import etree

# Define input and output folders
input_folder = Path("EncodingGiry/XSLT-project/letters-encoding")  # Folder containing XML letters
output_folder = Path("EncodingGiry/XSLT-project/output")  # Folder for generated LaTeX files
output_folder.mkdir(parents=True, exist_ok=True)  # Create if not exists

# Load the XSLT file for LaTeX transformation
xslt_path = Path("EncodingGiry/XSLT-project/encoding-schemas/transformLATEX.xslt")  # Path to your XSLT file

if not xslt_path.exists():
    print(f"❌ ERROR: XSLT file not found at {xslt_path.resolve()}")
    exit(1)

# Load the XSLT file
try:
    xslt = etree.parse(str(xslt_path))
    transform = etree.XSLT(xslt)
except Exception as e:
    print(f"❌ Error loading XSLT: {e}")
    exit(1)

# Define the final output LaTeX file
output_tex = output_folder / "all_letters.tex"

# Start writing the LaTeX document
with open(output_tex, "w", encoding="utf-8") as f:
    # Write LaTeX Preamble
    f.write(r"""\documentclass[12pt]{article}
\usepackage{geometry}
\usepackage{fontspec}
\usepackage{hyperref}
\usepackage{titlesec}
\usepackage{tocloft}

\geometry{a4paper, margin=1in}
\setmainfont{Times New Roman}

\hypersetup{
    colorlinks=true,
    linkcolor=blue,
    urlcolor=blue
}

\title{Correspondence of Arthur Giry}
\author{Encoded from TEI using XSLT}
\date{\today}

\begin{document}

\maketitle

\tableofcontents
\newpage
""")

    # Process each XML letter and append its LaTeX content
    xml_files = list(input_folder.glob("*.xml"))
    for xml_file in xml_files:
        try:
            print(f"📄 Processing: {xml_file.name}")
            xml = etree.parse(str(xml_file))

            # Apply XSLT transformation
            result = transform(xml)

            # Append transformed LaTeX content to the file
            f.write("\n\\section{" + xml_file.stem.replace("_", " ") + "}\n")
            f.write(str(result) + "\n")

            print(f"✅ Added: {xml_file.name}")

        except Exception as e:
            print(f"❌ Error processing {xml_file.name}: {e}")

    # End document
    f.write("\n\\end{document}")

print(f"✨ All letters combined into: {output_tex}")

# import subprocess

# # Compile LaTeX file to PDF
# try:
#     print("📄 Compiling LaTeX to PDF...")
#     subprocess.run(["pdflatex", "-output-directory", str(output_folder), str(output_tex)], check=True)
#     print(f"✅ PDF generated: {output_folder / 'all_letters.pdf'}")
# except subprocess.CalledProcessError as e:
#     print(f"❌ Error compiling LaTeX: {e}")
