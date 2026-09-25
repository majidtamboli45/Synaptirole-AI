# Node.js File System Complete Reference

> Source: https://www.geeksforgeeks.org/node-js/node-js-file-system-complete-reference/

Node.js File System module is used to handle file operations like creating, reading, deleting, etc. Node.js provides an inbuilt module called FS (File System). Node.js gives the functionality of file I/O by providing wrappers around the standard POSIX functions. All file system operations can have synchronous and asynchronous forms depending on user requirements
Asynchronous vs Synchronous Methods
The fs module offers both asynchronous and synchronous methods. Asynchronous methods are non-blocking and typically use callbacks or Promises for handling operations, while synchronous methods block the execution until the operation completes.
Example: Below is an example of a NodeJS file System.
    // Node.js program to demonstrate the
    // fsPromises.opendir() method
    // Import the filesystem module
    const fs = require('fs');
    const fsPromises = fs.promises;
    fsPromises.opendir(__dirname)
        .then(function(result) {
            console.log(result);
        })
        .catch(function(error) {
            console.log(error);
        });
Output:
Dir {
[Symbol(kDirHandle)]: DirHandle {},
[Symbol(kDirBufferedEntries)]: [],
[Symbol(kDirPath)]: 'C:\\Users\\Lenovo\\Downloads\\Internship\\Program',
[Symbol(kDirClosed)]: false,
[Symbol(kDirOptions)]: { bufferSize: 32, encoding: 'utf8' },
[Symbol(kDirReadPromisified)]: [Function: bound [kDirReadImpl]],
[Symbol(kDirClosePromisified)]: [Function: bound close]
}
The Complete NodeJS File System are listed below:
| Node.js File System | Description | 
|---|---|
| Node.js fs.readFile() Method | This method read the entire file into buffer. To load the fs module we use require() method. | 
| Node.js fs.exists() Method | The fs.exists() method is used to test whether the given path exists or not in the file system. | 
| Node.js fs.existsSync() Method | The fs.existsSync() method is used to synchronously check if a file already exists in the given path or not. | 
| Node.js fs.mkdir() Method | The fs.mkdir() method i Node.js is used to create a directory asynchronously. | 
| Node.js fs.truncate() Method | The fs.truncate() method in node.js is used to change the size of the file i.e either increase or decrease the file size. | 
| Node.js fs.renameSync() Method | The fs.renameSync() method is used to synchronously rename a file at the given old path to the given new path. | 
| Node.js fs.rmdir() Method | The fs.rmdir() method is used to delete a directory at the given path. | 
| Node.js fs.stat() Method | The fs.stat() method is used to return information about the given file or directory. | 
| Node.js fs.mkdtempSync() Method | The fs.mkdtempSync() method is an inbuilt application programming interface of fs module | 
| Node.js fs.realpath() Method | The fs.realPath() method is used to compute the canonical pathname of the given path. | 
| Node.js fs.open() Method | This is used. fs.readFile() is only for reading the file and similarly fs.writeFile() | 
| Node.js fs.mkdirSync() Method | This is an inbuilt application programming interface of fs module which provides an API for interacting with the file system in a manner closely modeled around standard POSIX functions. | 
| Node.js fs.statSync() Method | The fs.statSync() method is used to synchronously return information about the given file path. | 
| Node.js fs.write() Method | The fs.write() method is an inbuilt application programming interface of fs module which is used to specify the position | 
| Node.js fs.createReadStream() Method | This is an inbuilt application programming interface of fs module which allow you to open up a file/stream and read the data present in it. | 
| Node.js fs.openSync() Method | This is an inbuilt application programming interface of fs module which is used to return an integer value that represents the file descriptor. | 
| Node.js fs.rmdirSync() Method | The fs.rmdirSync() method is used to synchronously delete a directory at the given path. | 
| Node.js fs.ftruncate() Method | The fs.ftruncate() method is used to change the size of the file i.e. either increase or decrease the file size. | 
| Node.js fs.truncateSync() Method | The fs.truncateSync() method is used to synchronously change the size of the file | 
| Node.js fs.readdir() Method | The fs.readdir() method is used to asynchronously read the contents of a given directory. | 
| Node.js fs.writeFileSync() Method | The ‘fs’ module of Node.js implements the File I/O operation. Methods in the fs module can be synchronous as well as asynchronous. | 
| Node.js fs.readFileSync() Method | The fs.readFileSync() method is an inbuilt application programming interface of fs module which is used to read the file and return its content. | 
| Node.js fs.lstat() Method | The fs.lstat() method is similar to the fs.stat() method except that it is used to return | 
| Node.js fs.symlinkSync() Method | The fs.symlinkSync() method is used to synchronously create a symlink to the specified path. | 
| Node.js fs.realpathSync() Method | The fs.realpathSync() method is used to synchronously compute the canonical pathname of a given path. | 
| Node.js fs.fstat() Method | The fs.fstat() method is used to return information about the given file descriptor. | 
| Node.js fs.mkdtemp() Method | The fs.mkdtemp() method is used to create a unique temporary directory. | 
| Node.js fs.lstatSync() Method | This is used to synchronously return information about the symbolic link that is being used to refer to a file or directory. | 
| Node.js fs.readdirSync() Me thod | This is used to synchronously read the contents of a given directory. | 
| Node.js fs.writeFile() Method | The fs.writeFile() method is used to asynchronously write the specified data to a file. | 
| Node.js fs.fstatSync() Method | The fs.fstatSync() method is used to synchronously return information about the given file descriptor. | 
| Node.js fs.copyFileSync() Function | This is used to synchronously copy a file from the source path to destination path. | 
| Node.js fs. lchown() Method | fs.chownSync() method which does dereference the links to their path. | 
| Node.js fs. lchownSync() Method | fs.chownSync() method which does dereference the links to their path. | 
| Node.js fs.closeSync() Method | fs.closeSync() on a file descriptor while some other operation is being performed on it may lead to undefined behavior. | 
| Node.js fs.close() Method | This is used to asynchronously close the given file descriptor thereby clearing the file that is associated with it. | 
| Node.js fs.fchmod() Method | The fs.fchmod() method is used to change the permissions of a given file descriptor. | 
| Node.js fs.link() Method | The fs.link() method is used to create a hard link to the given path. | 
| Node.js fs.symlink() Function | The fs.symlink() method is used to create a symlink to the specified path. | 
| Node.js fs.unlinkSync() Method | The fs.unlinkSync() method is used to synchronously remove a file or symbolic link from the filesystem. | 
| Node.js fs.chmodSync() Method | The fs.chmodSync() method is used to synchronously change the permissions of a given path. | 
| Node.js fs.chmod() Method | These permissions can be specified using string constants or octal numbers that correspond to their respective file modes. | 
| Node.js fs.unlink() Method | The fs.unlink() method is used to remove a file or symbolic link from the filesystem. | 
| Node.js fs.fchmodSync() Method | The fs.fchmodSync() method is an inbuilt application programming of fs module which is used to synchronously change the permissions of a given file descriptor. | 
| Node.js fs.readlinkSync() Method | This is used to synchronously return a symbolic link’s value, i.e. the path it is linked to. | 
| Node.js fs. linksync() Method | The hard link created would still point to the same file even if the file is renamed. | 
| Node.js fs.futimesSync() Method | This is used to synchronously change the modification and access timestamps of given file descriptor. T | 
| Node.js fs.utimesSync() Method | The fs.utimesSync() method is used to synchronously change the modification and access timestamps of a file. | 
| Node.js fs.utimes() Method | The fs.utimes() method is used to asynchronously change the modification and access timestamps of a file. | 
| Node.js fs.opendirSync() Method | The fs.opendirSync() method is used to synchronously open a directory in the file system. | 
| Node.js fs.opendir() Method | It creates an fs.Dir object that is used to represent the directory. | 
| Node.js fs.appendFile() Function | The fs.appendFile() method is used to asynchronously append the given data to a file. A new file is created if it does not exist. | 
| Node.js fs.chown() Method | The fs.chown() method is used to asynchronously change the owner and group of the given path. | 
| Node.js fs.fchown() Function | The fs.fchown() method is used to change the owner and group of the given file descriptor. | 
| Node.js fs.copyFile() Function | The fs.copyFile() method is used to asynchronously copy a file from the source path to destination path. | 
| Node.js fs.appendFileSync() Function | A new file is created if it does not exist. The optional options parameter can be used to modify the behavior of the operation. | 
| Node.js fs. fchownSync() Method | The function accepts a user id and group id that can be used to set the respective owner and group. It does not return anything. | 
| Node.js fs.chownSync() Method | The fs.chownSync() method is used to synchronously change the owner and group of the given path. | 
| Node.js fs.accessSync() Method | The fs.accessSync() method is used to synchronously test the permissions of a given file or directory. | 
| Node.js fs.access() Method | The permissions to be checked can be specified as a parameter using file access constants. | 
| Node.js fs.watchFile() Method | The fs.watchFile() method is used to continuously watch for changes on the given file. | 
| Node.js fsPromises.mkdtemp() Method | The fsPromises.mkdtemp() method is an inbuilt method which creates a unique temporary directory and resolves the Promise with the created directory path. | 
| Node.js fsPromises.chmod() Method | The fsPromises.chmod() method is used to change the permissions of a given path. | 
| Node.js fs.unwatchFile() Method | The fs.unwatchFile() method is used to stop watching for changes on the given file. | 
| Node.js fsPromises.open() Method | The fsPromises.open() method is used to asynchronously open a file that returns a Promise that, when resolved, yields a FileHandle object. | 
| Node.js fsPromises.mkdir() Method | This is used to asynchronously create a directory then resolves the Promise with either no arguments, or the first directory path created if recursive is true. | 
| Node.js fs.promise.readdir() Method | The fs.promise.readdir() method defined in the File System module of Node.js. | 
| Node.js fsPromises.appendFile() Function | The fsPromises.appendFile() method is used to asynchronously append the given data to a file. | 
| Node.js fsPromise.lstat() Method | The fs.promise.lstat() method is defined in the File System module of Node.js. | 
| Node.js fsPromises.stat() Method | The fsPromises.stat() method is used to return information about the given file or directory. | 
| Node.js fsPromises.realpath() Method | The fsPromises.realPath() method determines the actual location of path using the same semantics as the fs.realpath.native() function | 
| Node.js fs.read() Method | Node.js is used for server-side scripting. Reading and writing files are the two most important operations that are performed in any application. | 
| Node.js fsPromises.chown() Method | The fsPromises.chown() method is used to change the ownership of a file then resolves the Promise with no arguments upon success. | 
| Node.js fs.createWriteStream() Method | This is an inbuilt application programming interface of fs module which allows to quickly make a writable stream for the purpose of writing data to a file. | 
| Node.js fs.futimes() Method | The fs.futimes() method is used to asynchronously change the modification and access timestamps of given file descriptor. | 
| Node.js fsPromises.truncate() Method | The fsPromises.truncate() method is defined in the File System module of Node.js. | 
| Node.js fsPromises.symlink() Method | The fsPromises.symlink() method is used to create a symlink to the specified path then resolves the Promise with no arguments upon success. | 
| Node.js fsPromises.lchmod() Method | The fsPromises.lchmod() method is used to change the permissions of a given path. | 
| Node.js fsPromises.lchown() Method | The fsPromises.lchown() method is used to change the ownership of a file then resolves the Promise with no arguments upon success | 
| Node.js fsPromises.truncate() Method | The fsPromises.truncate() method in node.js is used to change the size of the file i.e. either increase or decrease the file size. | 
| Node.js fsPromises.opendir() Method | The fsPromises.opendir() method is used to asynchronously open a directory in the file system. | 
| Node.js fsPromises.utimes() Method | The fsPromises.utimes() method is used to asynchronously change the modification and access timestamps of a file. | 
| Node.js fsPromises.copyFile() Method | The fsPromises.copyFile() method is used to asynchronously copy a file from the source path to destination path. | 
| Node.js fsPromises.rename() Method | The fsPromises.rename() method is used to asynchronously rename a file at the given old path to a given new path. | 
| Node.js fs.promises.appendFile() Method | The fs.promises.appendFile() method of File System module in Node.js is used to interact with the hard disk of the user’s computer. | 
| Node.js fsPromises.rmdir() Method | The fsPromises.rmdir() method is used to delete a directory at the given path. It can also be used recursively to remove nested directories. | 
| Node.js fsPromises.writeFile() Method | The fsPromises.writeFile() method is used to asynchronously write the specified data to a file. By default, the file would be replaced if it exists. | 
| Node.js fsPromises.readFile() Method | The fsPromises.readFile() method is used to read the file. This method read the entire file into buffer. | 
| Node.js fsPromises.access() Method | The fsPromises.access() method is used to test the permissions of a given file or directory specified by path. | 
| Node.js stats.ino Property | The stats.ino property is an inbuilt application programming interface of the fs.Stats class is used to get the “Inode” number of the file specified by the file system. | 
| Node.js stats.birthtimeNs Property | This is an inbuilt application programming interface of the fs.Stats class is used to get the timestamp when the file is created since the POSIX epoch expressed in milliseconds. | 
| Node.js stats.atimeNs Property | This is an inbuilt application programming interface of the fs.Stats class is used to get the timestamp when the file is accessed last time since the POSIX epoch expressed in nanoseconds. | 
| Node.js fsPromises.opendir() Method | The File System module is basically to interact with the hard disk of the user’s computer. The method is used to asynchronously open a directory. | 
| Node.js stats.mtimeNs Property | The stats.mtimeNs property is an inbuilt application programming interface of the fs. | 
| Node.js stats.isFIFO() Method | This is an inbuilt application programming interface of the fs.Stats class which is used to check whether fs.Stats object describes a first-in-first-out (FIFO) pipe or not. | 
| Node.js stats.isSymbolicLink() Method | This is an inbuilt application programming interface of the fs.Stats class which is used to check whether fs.Stats object describes a symbolic link or not. | 
| Node.js stat.isSocket() Method | The stats.isSocket() method is an inbuilt application programming interface of the fs. | 
| Node.js stats.dev Property | The stats.dev property is an inbuilt application programming interface of the fs. | 
| Node.js stats.mtime Property | The stats.mtime property is an inbuilt application programming interface of the fs.Stats class is used to get the timestamp when the file is modified last time. | 
| Node.js filehandle.readFile() Method | The filehandle.readFile() method is used to asynchronously read the file contents. This method reads the entire file into the buffer. It Asynchronously reads the entire contents of a file. | 
| Node.js stats.ctimeNs Property | The stats.ctimeNs property is an inbuilt application programming interface of the fs. | 
| Node.js stats.atime Property | This used to get the time and date when the file is accessed last time. | 
| Node.js stats.birthtime Property | This is used to get the timestamp when the file is created. | 
| Node.js stats.ctime Property | The stats.ctime property is an inbuilt application programming interface of the fs. | 
| Node.js stats.ctimeMs Property from fs.Stats Class | The stats.ctimeMs property is an inbuilt application programming interface of the fs. | 
| Node.js stats.mtimeMs Property from fs.Stats Class | The stats.mtimeMs property is an inbuilt application programming interface of the fs.Stats class is used to get the timestamp | 
| Node.js stats.blocks Property from fs.Stats Class | The stats.blocks property is an inbuilt application programming interface of the fs.Stats class is used to get the number of blocks allocated for the file. | 
| Node.js stats.isCharacterDevice() Method from fs.Stats Class | The stats.isCharacterDevice() method is an inbuilt application programming interface of the fs.Stats class which is used to check whether fs.Stats object is of a character device or not. | 
| Node.js stats.atimeMs Property from fs.Stats Class | The stats.atimeMs property is an inbuilt application programming interface of the fs.Stats class is used to get the timestamp | 
| Node.js stats.birthtimeMs Property from fs.Stats Class | This is used to get the timestamp when the file is created since the POSIX epoch expressed in milliseconds. | 
| Node.js filehandle.stat() Method from class: FileHandle | The File System module is basically to interact with the hard disk of the user’s computers. | 
| Node.js stats.blksize Property from fs.Stats Class | The stats.blksize property is an inbuilt application programming interface of the fs.Stats class is used to get the block size for I/O operations in the file system in bytes. | 
| Node.js stats.size Property from fs.Stats Class | The stats.size property is an inbuilt application programming interface of the fs.Stats class is used to get the size of the file in bytes. | 
| Node.js stats.nlink Property from fs.Stats Class | The stats.nlink property is an inbuilt application programming interface of the fs.Stats class which is used to get the number of hard-links for the file. | 
| Node.js stats.mode Property from fs.Stats Class | The stats.mode property is an inbuilt application programming interface of the fs.Stats class which is used to get the file type and mode as bit-field. | 
| Node.js stats.isFile() Method from fs.Stats Class | The stats.isFile() method is an inbuilt application programming interface of the fs.Stats class which is used to check whether fs.Stats object describes a file or not. | 
| Node.js stats.gid Property from fs.Stats Class | This is used to get the numeric (number / bigint) identity of the group to which the file belongs to. | 
| Node.js stats.uid Property from fs.Stats Class | The stats.uid property is an inbuilt application programming interface of the fs.Stats class is used to get the numeric (number / bigint) identity of the user to which the file belongs to. | 
| Node.js stats.rdev Property from fs.Stats Class | This is used to get the numeric (number / bigint) identity of the device in which the file is stored in the file is considered to be “special”. | 
| Node.js fs.filehandle.utimes() Method | The fs.filehandle.utimes() method is an inbuilt application programming interface of class fs.filehandle within File System | 
| Node.js fs.filehandle.truncate() Method | This is used to truncate the particular file object and only that much byte will be retained which passed as an integer in truncate() method. | 
| Node.js fs.Dirent.isFIFO() Method | This is used to check if the particular dirent describes a first in first out pipe or not. | 
| Node.js fs.filehandle.fd() Method | This is used to provide the numeric file descriptor of this file handle object. | 
| Node.js fs.Dirent.isSocket() Method | This is used to check if the particular dirent describes a Socket or not. | 
| Node.js fs.Dirent.isFile() Method | This is used to check if the particular dirent describes a File or not. | 
| Node.js fs.filehandle.write() Method | This is an inbuilt application programming interface of class fs.filehandle within File System module which is used to write the data form the buffer to that particular file. | 
| Node.js fs.Dir.close() Method | This is used to close the directory’s underlying resource handle asynchronously. | 
| Node.js fs.Dirent.isCharacterDevice() Method | This is used to check if the particular dirent describes a character device or not. | 
| Node.js fs.Dir.read() Method | This is used to read the each next directory (dirent) one by one asynchronously. | 
| Node.js fs.Dirent.isBlockDevice() Method | This is used to check if the particular dirent describes a block device or not. | 
| Node.js filehandle.close() Method | This is used to asynchronously close the given file descriptor thereby clearing the file that is associated with it. | 
| Node.js filehandle.read() Method | In order to read files without file descriptor the readFile() method of the filehandle package can be used. | 
| Node.js stats.isDirectory() Method from fs.Stats Class | This is used to check whether fs.Stats object describes a file system directory or not. | 
| Node.js filehandle.writeFile() Method from class: FileHandle | This is used to defined in the File System module of Node.js. The File System module is basically to interact with the hard disk of the user’s computer. | 
| Node.js fs.Dir.path() Method | This is used to defined in the File System module of Node.js. The File System module is basically to interact with the hard disk of the user’s computer. | 
| Node.js fs.filehandle.datasync() Method | fs.filehandle within File System module which is used to sync the data of the file. | 
| Node.js fs.filehandle.chmod() Method | fs.filehandle within File System module which is used to change the permission of the particular file. | 
| Node.js stats.isBlockDevice() Method from fs.Stats Class | This is used to check whether fs.Stats object is of a block device or not. | 
| Node.js fs.filehandle.chown() Method | This is used to change the ownership of the particular file. | 
| Node.js fs.filehandle.sync() Method | fs.filehandle within File System module which is used to synchronize this file’s in-core state with the storage device. | 
| Node.js filehandle.truncate() Method | The truncate() method used to modify the inner contents of the file by ‘len’ bytes. | 
| Node.js fs.dirent.name Property | The fs.Dirent.name property is an inbuilt application programming interface of class fs.Dirent | 
| Node.js filehandle.appendFile() Method | The File System module is basically to interact with the hard disk of the user’s computer. | 
| Node.js fs.Dirent.isDirectory() Method | This is used to check if the particular dirent describes a Directory or not. | 
| Node.js fs.Dirent.isSymbolicLink() Method | This is used to check if the particular dirent describes a SymbolicLink or not. | 
| Node.js fs.Dir.readSync() Method | fs.Dir within File System module which is used to read the each next dirent of directory. | 
| Node.js fs.Dir.closeSync() Method | This is used to close the directory’s underlying resource handle synchronously. | 
| Node.js fs.promises.link() Method | The fs.promises.link() method is an inbuilt application programming interface of the fs.promises class which is used to make a new name for a file. | 
| Node.js fs.watch() Method | fs module which is used to continuously watch for changes in the given file or directory. | 
| Node.js fs.readlink() Method | The fs.readlink() method is an inbuilt application programming interface of fs module which is used to asynchronously return a symbolic link’s value. | 
| Node.js fs.fdatasync() Method | The fs.fdatasync() (Added in v0.1.96) method is an inbuilt application programming interface of the fs module which is similar to fs.fsync() | 
| Node.js fs.fsync() Method | It has both synchronous and asynchronous forms. The asynchronous form always takes a completion callback as its last argument. | 
| Node.js fs.rmSync() Method | The fs.rmSync() method is used to synchronously delete a file at the given path. | 
| Node.js fs.rm() Method | The fs.rm() method is used to delete a file at the given path. It can also be used recursively to remove directories. | 
| Node.js fs.writeSync() Method | This is used to work with files on the computer. The functions of the module can be used by importing the fs module. |
