## Synopsis

Scripted process to run command and put output data into unique txt file name and upload to central location via BITS.
The intent behind this is to package it within SCCM to run and collect the data back into a central location, saving the trouble of going to large lists of systems
and manually running the process on each one.

## Upload website Setup

Setup a IIS webpage with BITS upload and Windows Authentication enabled. Example utilizes a local account with permission to the folder for the website called 'bitsupload'. It is enabled only when the job is being done.

Since SCCM will cache the content of packages on the local system, we utilize a call script to run the get-kpmgdata.ps1 script and then delete it at completion. This way we don't keep a file around with plaintext password in it. Not necessary if there is a secrets vault solution in place.