#!/bin/bash
#
# Shows summaries of all the local sixarm repositories.
#
# Example:
#   cd ~sixarm/git/
#   ls -1d sixarm_* | git-repo-summaries.sh > out.tsv
#
# The pipe input is a list of directories.
#
# The pipe output is a spreadsheet of tab-separated-value rows,
# where each row is one repo and has this information:
#
#   * the repository name, e.g. "my_foo_bar".
#   * the first commit's date, i.e. whatever git log shows as first by date, e.g. "2010-01-01".
#   * the last commit's date, i.e. whatever git log shows as most recent by date, e.g. "2010-12-31".
#   * the number of files (omitting some directories e.g. Ruby gem auto-generated directories).
#   * the number of lines in the files.
#   * the version number; this looks for a file "VERSION*" or a "*-*.deb" package version, e.g. "1.2.3".
#   * the headline; this looks for a file "README*" and uses the first line e.g. "My Foo Bar".

echo -e "SixArm Repository Summaries"
echo -e "Files and Lines columns omit some directories, e.g. Ruby gem auto-generated directories \"coverage\" and \"doc\"."
echo -e ""
echo -e "Repository\tFirst Commit\tLast Commit\tFiles\tLines\tVersion\tHeadline"

while read dir
do
 cd $dir
 echo -e -n "$dir"

 if [ -e .git/config ] 
 then
   first_commit_date=`git log --date-order --date=iso --pretty="format:%ad" --reverse | head -1 | sed 's/ .*//'`
   last_commit_date=`git log --date-order --date=iso --pretty="format:%ad" | head -1 | sed 's/ .*//'` 
 else
   first_commit_date=""
   last_commit_date=""
 fi
 echo -e -n "\t$first_commit_date\t$last_commit_date"

 file_count=`find ./ -path ./.git -prune -o -path ./coverage -prune -o -path ./doc -prune -o -type f -print | wc -l`
 echo -e -n "\t$file_count"

 line_count=`( find ./ -path ./.git -prune -o -path ./coverage -prune -o -path ./doc -prune -o -type f -print0 | xargs -I{} -0 cat "{}" ) | wc -l`
 echo -e -n "\t$line_count"

 version=""
 find=`find VERSION*`
 if [ $? -eq 0 ]
 then
   file=`find VERSION* | sort | head -1`
   version=`head -1 $file` 
 else
   file=`find *.deb | sort | tail -1`
   if [ $? -eq 0 ]
   then
     version=`echo "$file" | sed 's/.*-//; s/\.deb$//'`
   fi
 fi
 echo -e -n "\t$version"

 head=""
 find=`find README*`
 if [ $? -eq 0 ]
 then
   file=`find README* | sort | head -1`
   head=`grep "SixArm" $file | sed 's/^# //; s/^= //;' | head -1`
 fi
 echo -e -n "\t$head"
 
 echo ""

 cd ..

done
