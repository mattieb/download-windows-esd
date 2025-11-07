# Changes

## 1.0.0 - 2024-10-14

This is the first actual release. Before this point, download-windows-esd was a rolling repository. All changes here are from the original version.

1.  Added commands to print SHA-1 checksums in "shasum -c" format and download URLs for use with other tools.

2.  Fixed a potential issue where a tar archiver without the capability to read Microsoft's product catalog might get selected, thanks to @CaledoniaProject on GitHub.

3.  Fixed an issue where we were accidentally using a program to check SHA-1 sums of downloaded images that wasn't included in macOS, thanks to @evanwurden on GitHub.

4.  Improvements to download reliability in case of HTTP server errors or redirects. Based on proposed changes by @electriquo on GitHub.

5.  Various improvements to code quality and portability, including removing a few Bashisms that snuck in.

## 2.0.0 - 2025-10-28

1.  The link to enumerate ESD images wasn't being updated for Windows 11 25H2, so it has been replaced with a new flow that uses Windows Update services, like [Media Creation Tool](https://www.microsoft.com/software-download/windows11) does now. Thanks to [FFU](https://github.com/rbalsleyMSFT/FFU/commit/1daa14584a6e807cc6a57153bd5b822cda4541c0) for an example of how to do this.

2.  Now that we're using a different catalog, we have SHA-256 checksums instead of SHA-1 for the ESD images. Therefore, the "shasum" command was removed, and a "sha256sum" command was added that does the same thing but with SHA-256.

3.  The logic for caching products.xml (only query once a day, only redownload if the remote file is newer) was fixed.
