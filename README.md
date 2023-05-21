# download-windows-esd

A tool to download Windows 11 electronic software distributions (ESD) directly from Microsoft.

Since Microsoft does not distribute Windows ARM ISO images, this tool plus [a way to convert ESD to ISO](#iso-conversion) allows you to obtain a Windows ARM ISO image—e.g. for use in a virtual machine, such as [UTM](https://getutm.app) or [the free VMware Fusion Player](https://www.vmware.com/go/getfusionplayer).

## Requirements

All requirements are already included in macOS. Patches are welcome for portability.

## Usage

```
download-windows-esd languages
```

Lists the available language codes.

```
download-windows-esd editions LANGUAGE
```

Given a language code, lists the available Windows editions.

```
download-windows-esd architectures LANGUAGE EDITION
```

Given a language code and edition name, lists the available architectures.

```
download-windows-esd download LANGUAGE EDITION ARCHITECTURE
```

Downloads the ESD listed for the given language, edition, and architecture. This image may have more than one edition.

## How it works

[download-windows-esd](./download-windows-esd) will use a Microsoft redirect link to download an XML catalog file listing all variations of Windows 11 ESDs.

This catalog file, and the cabinet (.cab) file that contains it, will be cached locally.

If the cabinet file is more than 24 hours old or missing, this tool will automatically attempt to retrieve a new catalog file, which is only downloaded if its modified date is newer than what has already been downloaded.

Once the download is complete, it is checked against the SHA1 checksum present in the catalog.

## Bash autocomplete

Though the tool is not specific to [Bash](https://tiswww.case.edu/php/chet/bash/bashtop.html), [a Bash completion script](./download-windows-esd.completion.bash) is included.

This script, when sourced or installed with other Bash completions, will provide autocomplete suggestions for the commands that download-windows-esd supports, as well as providing valid values for language, edition, and architecture where appropriate.

(Note: Bash completions can also be used in [zsh](https://zsh.sourceforge.io) via [bashcompinit](https://zsh.sourceforge.io/Doc/Release/Completion-System.html#Use-of-compinit); in fact, as a zsh user, I developed the completions this way.)

## ISO conversion

There are a few ways you can convert the ESD to an ISO image.

- [My own windows-esd-to-iso tool](https://github.com/mattieb/windows-esd-to-iso) will flexibly convert ESD with any number of images (i.e. editions) inside into an ISO that is intended to closely match Microsoft's own x64 ISOs as generated by the [Media Creation Tool](https://www.microsoft.com/software-download/windows11).
- Paul Rockwell's [w11arm_esd2iso](https://communities.vmware.com/t5/VMware-Fusion-Documents/w11arm-esd2iso-a-utility-to-create-Windows-11-ARM-ISOs-from/ta-p/2957381) does both downloading and conversion of ARM images in a single shot.
- Michael Niehaus writes about [how to create an ISO in Windows using the ADK](https://oofhours.com/2022/09/14/want-your-own-windows-11-21h2-arm64-isos/).
- [Parallels Desktop](https://www.parallels.com/products/desktop/) has an internal tool called prl_esd2iso located inside the application bundle.

## Licensing

While this tool itself is [already licensed to you](./LICENSE.md), Windows itself may require licensing and activation.

You must address this; this tool does not.
