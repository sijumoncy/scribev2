# pwd is vscode
echo " start downloading theme"
# wget https://open-vsx.org/api/sjsepan/sjsepan-redalertish/0.0.2/file/sjsepan.sjsepan-redalertish-0.0.2.vsix
echo "downloaded theme"
# if [[ -f  "./sjsepan.sjsepan-redalertish-0.0.2.vsix" ]]; then
#   unzip ./sjsepan.sjsepan-redalertish-0.0.2.vsix -d ./extensions
# fi
# mv "" ""

# wget https://marketplace.visualstudio.com/_apis/public/gallery/publishers/satyam11/vsextensions/christmas-theme/0.0.1/vspackage
# unzip ../scribe-patches/satyam11.christmas-theme-0.0.1 -d ./extensions

# wget https://raw.githubusercontent.com/bible-technology/scribe-scripture-editor/development/package.json

jsonfile=$(wget -O - https://raw.githubusercontent.com/vipinpaul/oak-extensions/main/extensions.json)
# jsonfile='{
#   "redalertish":"https://open-vsx.org/api/sjsepan/sjsepan-redalertish/0.0.2/file/sjsepan.sjsepan-redalertish-0.0.2.vsix"
# }'
echo "$jsonfile" | jq -r 'to_entries | .[] | "\(.key)=\(.value)"' |
while IFS='=' read -r name url; do
    echo ${url} test ${name}
  wget "$url" -O "$name".zip
  unzip "$name".zip -d ./extensions/"$name"
  mv ./extensions/"$name"/extension/* ./extensions/"$name"/
done