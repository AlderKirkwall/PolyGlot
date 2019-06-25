#!/bin/bash
# Copies Distribution to an archive which can be renamed and uploaded

dist_dest="../polyglot_dist.zip"
readme_remove="dist/README.txt"
tmp_folder="PolyGlot"
frontend="frontends/PolyGlot/PolyGlot Frontend/bin/Debug/PolyGlot Frontend.exe"
example_lexicons="Example Lexicons"

echo "Creating distribution package..."

if [ -f "$dist_dest" ]
then
    rm "${dist_dest}"
fi

if [ -f "$readme_remove" ]
then
    rm "${readme_remove}"
fi

mkdir "${tmp_folder}"
cp -r dist/lib PolyGlot/
cp dist/PolyGlot.jar PolyGlot/
cp -r docs/assets PolyGlot
cp -r docs/stylesheets PolyGlot
cp -r "${example_lexicons}" PolyGlot
cp docs/favicon.ico PolyGlot
cp docs/readme.html PolyGlot
cp "${frontend}" PolyGlot
cp dist_files/PolyGlot.Desktop PolyGlot
cp dist_files/PolyGlot.sh PolyGlot

zip -r "${dist_dest}" "${tmp_folder}"
rm -r "${tmp_folder}"


# Copies BETA version to relevant space to be uploaded via Google Drive

file_dest="/Users/draque/Google Drive/Permanent_Share/PolyGlot_BETA.zip"
file_orig="PolyGlot_BETA.zip"
beta_warn_dest="dist/BETA_WARNING.txt"
beta_warn_orig="BETA_WARNING.txt"

if [ -f "$file_dest" ]
then
        echo "Creating Beta Build to upload..."
	cp "${beta_warn_orig}" "${beta_warn_dest}" 
        cp "${frontend}" dist
	echo -e "\n\nCompiled:" >> "${beta_warn_dest}"
	date >> "${beta_warn_dest}"
	cat >> "${beta_warn_dest}"
	echo Archiving PolyGlot Beta...
	zip -r "${file_orig}" dist
	echo Copying to public share folder...
	mv "${file_orig}" "${file_dest}"
else
	echo "Expected folder structure mission. Beta not uploaded."
fi