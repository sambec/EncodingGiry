from lxml import etree

# Load XML and XSLT
xml = etree.parse("template.xml")
xslt = etree.parse("transform.xsl")

# Apply transformation
transform = etree.XSLT(xslt)
result = transform(xml)

# Save to HTML file
with open("output.html", "wb") as f:
    f.write(etree.tostring(result, pretty_print=True, method="html"))
