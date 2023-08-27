import lxml.etree as ET

# Load the XML and XSL files
xml_file = "products.xml"
xsl_file = "transform.xsl"
xsd_file = "product_schema.xsd"

# Load the XSL stylesheet
xslt = ET.XSLT(ET.parse(xsl_file))

# Apply the XSLT transformation to the XML
result_tree = xslt(ET.parse(xml_file))

# Validate the transformed HTML against the XSD schema
xsd = ET.XMLSchema(ET.parse(xsd_file))

if xsd.validate(result_tree):
    print("Validation successful. Saving the HTML...")
    # Save the transformed HTML
    with open("output.html", "wb") as output_file:
        output_file.write(ET.tostring(result_tree, pretty_print=True))
else:
    print("Validation failed.")
    for error in xsd.error_log:
        print(f"Line {error.line}: {error.message}")
