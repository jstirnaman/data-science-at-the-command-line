Contrived example. Search for CSV rows, use Awk to return a delimited field, sort the results, get unique values.
`csvgrep -r '.*' ~/Downloads/importtable_20160504.csv -d ',' -c "Last Name" | awk 'BEGIN { FS = "," } ; { print $1 }' | sort`

Paste a number sequence to a single line with specified delimiter.
`seq 10 | paste -s -d\,`

Preview some CSV. Works even when CSV file contains Windows' Beginning Of File character, which chokes Ruby's CSV.
`in2csv /vagrant/usersourcesettings_20160721.csv | head | csvcut -c 1`

top-words-1.sh, chap. 4 Data Science at the Command Line
`curl -s http://www.gutenberg.org/cache/epub/76/pg76.txt |
tr '[:upper:]' '[:lower:]' | grep -oE '\w+' | sort |
uniq -c | sort -nr | head -n 10`

Convert XLSX to CSV and return a single column by header value.
`in2csv ./InfoEDSponsorHierarchy.xlsx | cols -c "Orig Spon Type Desc Level 2" body grep -i -e '.'`

SQL query a CSV file
`in2csv ./InfoEDSponsorHierarchy.xlsx | csvsql --query 'SELECT "Custom Originating Sponsors Long" FROM stdin LIMIT 1'`

`in2csv ./InfoEDSponsorHierarchy.xlsx | csvsql --query 'SELECT DISTINCT "Originating Spon Abbreviation" FROM stdin WHERE "Custom Originating Sponsors Long"="Other Non-Federal"'`
