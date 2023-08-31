# maer
Implement https certificate installation that automatically assigns authority to administrator rights.

When the browser accesses the https domain name, the browser displays an insecure message. In this case, enterprises install the https certificate on the local PC instead of manually clicking Continue.
Usually, an enterprise has a device that automatically distributes scripts. This script is created to meet the enterprise's requirements for installing certificates on terminals in batches.

Note:

The script type is windows batch. You can follow the instructions to build other types.
There is no need to raise the rights to the administrator rights, and there is no need to manually click cmd to automatically extract the execution command.
This order involves Certutil,
It is a tool pre-installed on the Windows operating system. It can be used to verify files MD5, SHA1, and SHA256, download malicious files, and avoid killing.

Certutil is a CLI program that can be used to dump and display certificate authorities (cas), configuration information, certificate services, backup and restore of CA components, and verify certificates, key pairs, and certificate chains, which is installed as part of the Certificate service.

The script uses a total of three commands about Certutil and can remove the required commands.
