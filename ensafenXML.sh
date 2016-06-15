#! /bin/bash
sed 's|[&]|\&amp;|g' rawXML > safeXML
sed -i 's|[<]|\&lt;|g' safeXML
sed -i 's|[>]|\&gt;|g' safeXML
sed -i 's|-*-xml-*-|text|' safeXML
