#! /bin/bash

function total_folders() {
    echo "Total number of folders (including all nested ones) =`find $1 -type d | wc -l`"
}

function top_5_folders() {
    echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
    sudo du -h -- $1* | sort -rh | head -5 | cat -n | awk '{print $1" - "$3", "$2}'
}

function total_files() {
    echo "Total number of files = `find $1 -type f | wc -l`"
}

function type_files() {
    echo "Configuration files (with the .conf extension) = `find $1 -name "*.conf" | wc -l`"
    echo "Text files = `find $1 -name "*.txt" | wc -l`"
    echo "Executable files = `find $1 -type f -executable | wc -l`"
    echo "Log files (with the extension .log) = `find $1 -name "*.log" | wc -l`"
    echo "Archive files = `find $1 -name "*.tar"  | wc -l`"
    echo "Symbolic links = `find $1 -type l | wc -l`"
}

function top_10_files() {
    echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
	for i in {1..10}
	do
		files=$(find $1 -type f -exec du -h {} + | sort -rh | head -10 | sed "${i}q;d") 
		if ! [[ -z $files ]]
		then
			echo -n "$i - "
			echo -n "$(echo $files | awk '{print $2}'), " 
			echo -n "$(echo $files | awk '{print $1}'), " 
			echo "$(echo $files | grep -o -E "\.[^/.]+$" | awk -F . '{print $2}')" 
		fi
	done
}

function top_10_exe_files() {
    echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
    for i in {1..10}
	do
		files=$(find $1 -type f -executable -exec du -h {} + | sort -rh | head -10 | sed "${i}q;d") 
		if ! [[ -z $files ]]
		then
			echo -n "$i - "
            path=`echo $files | awk '{print $2}'`
			echo -n "$path, " 
			echo -n "$(echo $files | awk '{print $1}'), " 
			echo `md5sum $path | awk '{print $1}'`
		fi
	done
}