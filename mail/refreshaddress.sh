#!/bin/sh

#!/bin/sh

acc1=~/Mail/acc1/acc1.sent/cur
acc2=~/Mail/acc2/acc2.Sent/cur

parsemail () {
    cat $1 | lbdb-fetchaddr
}

parsemaildir () {
    for mailfile in $( find $1 -type f -mtime -5 ) ; do
        parsemail ${mailfile}
    done
}

# The IFS variable saves the file name separator which we will temporarily set to \n so that the
# spaces in Gmail folders will work

for i in "${acc1}" "${acc2}" ; do 
    o=${IFS}
    IFS=$(echo -en "\n\b")
    parsemaildir "${i}"
    IFS=o
done
