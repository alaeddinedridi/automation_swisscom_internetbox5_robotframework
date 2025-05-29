import xml.etree.ElementTree as ET

# Load and parse the XML file
tree = ET.parse("results/output.xml")
root = tree.getroot()

# Find the <tag> section under <statistics>
tag_stats = root.find(".//statistics/tag")

# Extract and print each tag's stats
for stat in tag_stats.findall("stat"):
    name = stat.text
    passed = stat.attrib.get("pass")
    failed = stat.attrib.get("fail")
    skipped = stat.attrib.get("skip")
    print(f"Tag: {name}, Pass: {passed}, Fail: {failed}, Skip: {skipped}")
    if passed != 0 and failed == 0:
        print("yes passed")