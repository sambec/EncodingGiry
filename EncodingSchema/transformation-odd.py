from lxml import etree

# Define paths
saxon_stylesheet_path = "oddbyexample.xsl"
odd2relaxng_stylesheet_path = "odd2relaxng.xsl"
#odd2html_stylesheet_path = "/path/to/Stylesheets/odds/odd2html.xsl"

input_xml_path = "template.xml"  # Input XML file
output_odd_path = "generated.odd"  # Output ODD file
output_rng_path = "generated.rng"  # Output RNG file
#output_html_path = "generated.html"  # Output HTML file

def transform_xml(input_xml, xslt_path, output_file):
    """
    Apply an XSLT transformation to an XML file.

    :param input_xml: Path to the input XML file.
    :param xslt_path: Path to the XSLT stylesheet.
    :param output_file: Path to the output file.
    """
    # Parse XML and XSLT
    xml_doc = etree.parse(input_xml)
    xslt_doc = etree.parse(xslt_path)
    transform = etree.XSLT(xslt_doc)

    # Apply transformation
    result = transform(xml_doc)

    # Write the result to a file
    with open(output_file, "wb") as f:
        f.write(etree.tostring(result, pretty_print=True, encoding="UTF-8"))

    print(f"Transformation completed. Output written to: {output_file}")

# Step 1: Generate ODD from XML using oddbyexample.xsl
transform_xml(input_xml_path, saxon_stylesheet_path, output_odd_path)

# Step 2: Convert ODD to RNG schema using odd2relaxng.xsl
transform_xml(output_odd_path, odd2relaxng_stylesheet_path, output_rng_path)

# Step 3: Generate HTML documentation using odd2html.xsl
#transform_xml(output_odd_path, odd2html_stylesheet_path, output_html_path)
