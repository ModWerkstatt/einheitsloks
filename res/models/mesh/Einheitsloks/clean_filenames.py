#!/usr/bin/env python3
# v.0.0.1
# 2021-04-21 trunky ModWerkstatt
#
# released under GPL v3

# USAGE
# put the file into the folder with the meshes
# open a console or terminal, switch to the directory and run the command
# python3 clean_filename.py



# set current folder as working directory.
# can be adjusted if you know what you are doing
folder = './'

# import the needed requirements
import re
import os

# set the required regular expression to match the filename
# TPF2 Model Editor tends to add ".001" and sometimes ".002" and up to the file names
# So we try to catch this inserts here with the regex
file_pattern = re.compile("(\.0{2}\d)")

# scan all files in selected folder
for root, dirs, filenames in os.walk(folder):
    to_write = [] # initialize variable as array

    for filename in filenames:
        # if the current file is NOT the python script itself we will execute the rest
        if filename != os.path.basename(__file__):
            # if our current filename matches our regex from above
            if file_pattern.search(filename):
                newname = file_pattern.sub("", filename) # replace the found regex with nothing as new filename
                tu = (os.path.join(root, filename), os.path.join(root, newname))

                to_write.append('%s --> %s\n' % tu) # put it to the export array
                os.rename(*tu) # write file!

    print("\n".join(to_write)) # shows files processed
    print("all done") # end of output

# done and happy :)
