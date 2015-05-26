DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd $DIR
ECHO "[COMPILING]"
cd ..
mkdir minify/total.js/bin/
ECHO "....... builders.js"
cp builders.js minify/total.js/builders.js
#uglifyjs builders.js -o minify/total.js/builders.js
ECHO "....... image.js"
cp image.js minify/total.js/image.js
#uglifyjs image.js -o minify/total.js/image.js
ECHO "....... index.js"
cp index.js minify/total.js/index.js
#uglifyjs index.js -o minify/total.js/index.js
ECHO "....... internal.js"
cp internal.js minify/total.js/internal.js
#uglifyjs internal.js -o minify/total.js/internal.js
ECHO "....... mail.js"
cp mail.js minify/total.js/mail.js
#uglifyjs mail.js -o minify/total.js/mail.js
ECHO "....... nosql.js"
cp nosql.js minify/total.js/nosql.js
#uglifyjs nosql.js -o minify/total.js/nosql.js
ECHO "....... utils.js"
cp utils.js minify/total.js/utils.js
#uglifyjs utils.js -o minify/total.js/utils.js
ECHO "....... binary - total"
uglifyjs bin/total -o minify/total.js/bin/total
ECHO "....... binary - tpm"
uglifyjs bin/tpm -o minify/total.js/bin/tpm

chmod 777 minify/total.js/bin/total
chmod 777 minify/total.js/bin/tpm

cp readme.md minify/total.js/readme.md
cp package.json minify/total.js/package.json
cp license.txt minify/total.js/license.txt

cd minify
node minify.js
node merge.js