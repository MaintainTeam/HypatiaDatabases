#startdate=2013-04-06
#enddate=2017-09-11

startdate=2017-09-14
enddate=2024-04-10

curr="$startdate"
while true; do
    #echo "https://malshare.com/daily/_disabled/$curr/malshare_fileList.$curr.txt"
    echo "https://malshare.com/daily/$curr/malshare_fileList.$curr.txt"
    [ "$curr" \< "$enddate" ] || break
    curr=$( date +%Y-%m-%d --date "$curr +1 day" )
done
