# gunzip Command in Linux with Examples

> Source: https://www.geeksforgeeks.org/linux-unix/gunzip-command-in-linux-with-examples/

The gunzip command in Linux is used to decompress files that were compressed using the gzip command, restoring them to their original form.
- It automatically removes the .gz extension after decompression.
- Can decompress multiple files at once.
- Supports options like -k,-f, and -r for flexibility.
- Useful for extracting logs, backups, and archives compressed with gzip.
Example: Decompress a Single .gz File
Extracts example.txt.gz and restores it as example.txt, deleting the .gz file after decompression.
Command:
gunzip example.txt.gz
Output:
Syntax
gunzip [options] archivename.gz
- gunzip: Command used to decompress .gz (gzip) compressed files.
- [options]: Optional flags that modify the behavior of the command.
- archive_name.gz: The compressed file to be decompressed.
Commonly Used gunzip Command Options
1. '-c': Write output to standard output (stdout)
Displays decompressed content directly on the terminal instead of saving it. Useful for viewing file content without extracting to disk.
Command:
gunzip -c geeksforgeeks.txt.tar.gz
Output:
2. '-k': Keep original compressed file
Decompresses the .gz file but retains the original file.txt.gz. Handy when you want both compressed and uncompressed versions.
Command:
gunzip -k example1.txt.gz
Output:
3. '-f': Force decompression
Automatically overwrites existing files without prompting for confirmation. Useful in scripts or batch operations where manual confirmation isn’t possible.
Command:
gunzip -f example1.txt.gz
Output:
4. '-r': Recursive decompression
Decompresses all .gz files within the specified directory and its subdirectories. Saves time when handling multiple compressed files in nested folders.
Command:
gunzip -r /home/vboxuser/gfg/
Output:
5. '-v': Verbose mode
Displays detailed information while decompressing each file. Helps monitor the progress and confirms which files are being processed.
Command:
gunzip -v file1.txt.gz
Output:
6. '-t': Test integrity of file
Verifies whether a .gz file is valid and not corrupted. Does not decompress the file; only checks its consistency.
Command:
gunzip -t example2.txt.gz
Output:
7. '-l': List compression details
Displays compression statistics like original size, ratio, and name. Useful for checking space savings and compression efficiency.
Command:
gunzip -l example2.txt.gz
Output:
8. '-h': Display Help
Shows help information and exits. Lists available options for the gunzip command.
Command:
gunzip -help
Output:
Some Other Options:
- -n: This option does not save or restore the original name and time stamp while decompressing a file.
- -N: This option saves or restore the original name and time stamp while decompression.
- -q: This option suppresses all the warnings that arise during the execution of the command.
- -s: This option use suffix SUF on compressed files.
