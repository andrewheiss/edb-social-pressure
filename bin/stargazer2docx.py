#!/usr/bin/env python3
import os
from bs4 import BeautifulSoup
from glob import glob

output_folder = '../output/tables'
tables = [fn for fn in glob(output_folder + '/*.html')
          if 'temp' not in os.path.basename(fn)]

# stargazer outputs unescaped less-than signs, which BeautifulSoup chokes on
bad_stars = '<sup>*</sup>p**p***p'
good_stars = '<sup>*</sup>p &lt; 0.1; <sup>**</sup>p &lt; 0.05; <sup>***</sup>p &lt; 0.01'

document_template = """<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>{0}</title>
</head>
<body>
<p><em>{0}</em></p>
{1}
</body>
</html>
"""

scpt = """set base_folder to "{0}/"
set file_in to base_folder & "{1}.html"
set file_out to base_folder & "{2}.docx"

tell application "Microsoft Word"
    activate
    open file_in

    set view type of view of active window to print view

    save as active document file name file_out file format format document
    close active document
end tell
"""

# Loop through all the stargazer HTML files in the Output directory and convert
# them to clean Word files
for i, table in enumerate(tables):
    # Open the HTML file
    with open(table, 'r') as f:
        raw_html = f.read()

    # Parse the HTML
    soup = BeautifulSoup(raw_html, 'html.parser')

    # Extract the table and caption
    table_html = soup.find('table')

    if table_html.caption is not None:
        title = table_html.caption.get_text()
        table_html.caption.extract()
    else:
        title = ""

    # Clean up the table
    table_clean = str(table_html).replace(bad_stars, good_stars)

    # print(table_clean)
    temp_name = os.path.splitext(os.path.basename(table))[0] + '_temp'

    # Save cleaned up HTML file
    with open('../output/tables/' + temp_name + '.html', 'w') as f:
        f.write(document_template.format(title, table_html))

    # Generate the AppleScript for cleaning and resaving the docx
    scpt_filled = scpt.format(os.getcwd() + "/" + output_folder,
                              temp_name, temp_name.replace('_temp', ''))

    # Run the script
    os.system("osascript -e '{0}'".format(scpt_filled))

    # Delete temporary files
    os.remove('../output/tables/' + temp_name + '.html')
