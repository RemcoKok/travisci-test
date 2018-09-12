project="project_name_goes_here"

#try placing $project everywhere project_name_goes_here is located...in theory it should work, but that wasn't how I set it up so there might be a reason for that; I will update this file when I test



mkdir project_name_goes_here
mv $(pwd)/windows/$project.exe project_name_goes_here
mv $(pwd)/windows/$project_Data project_name_goes_here


zip -r project_name_goes_here.zip project_name_goes_here


echo "Deploy to Itch"
wget http://dl.itch.ovh/butler/darwin-amd64/head/butler
chmod +x butler
touch butler_creds
echo -n $ITCH_API_KEY > butler_creds

./butler push project_name_goes_here.zip hacktavist/itchio_game_name_goes_here:windows -i butler_creds

echo "Cleaning"

./butler logout -i butler_creds --assume-yes
rm butler