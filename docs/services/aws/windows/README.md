# windows 

- [screenshot](screenshot.md): `Windows logo key + Shift + S`

## Windows 11

### systems requirements


| Thing | Amount |
|----|------------------------------------------------------------------------------------------------------------------------------------------|
| Processor  | 1 gigahertz (GHz) or faster with 2 or more cores on a compatible 64-bit processor or System on a Chip (SoC).                             |
| RAM        | 4 gigabyte (GB).                                                                                                                         |
| Storage    | 64 GB or larger storage device Note: See below under “More information on storage space to keep Windows 11 up-to-date” for more details. |
[Windows 11 Specs and System Requirements  Microsoft](https://www.microsoft.com/en-us/windows/windows-11-specifications)

## Create USB

```console
sudo dnf install WoeUSB
sudo woeusb --device Win10_22H2_EnglishInternational_x64.iso /dev/sda
```

