# Changes

## 1.0.0 - 2024-10-14

This is the first actual release. Before this point, download-windows-esd was a rolling repository. All changes here are from the original version.

1.  Added commands to print SHA-1 checksums in "shasum -c" format and download URLs for use with other tools.

2.  Fixed a potential issue where a tar archiver without the capability to read Microsoft's product catalog might get selected, thanks to @CaledoniaProject on GitHub.

3.  Fixed an issue where we were accidentally using a program to check SHA-1 sums of downloaded images that wasn't included in macOS, thanks to @evanwurden on GitHub.

4.  Improvements to download reliability in case of HTTP server errors or redirects. Based on proposed changes by @electriquo on GitHub.

5.  Various improvements to code quality and portability, including removing a few Bashisms that snuck in.
