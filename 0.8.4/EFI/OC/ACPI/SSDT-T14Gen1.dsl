/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASL9jQ31n.aml, Sat Sep 17 17:23:39 2022
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000010B9 (4281)
 *     Revision         0x02
 *     Checksum         0x0B
 *     OEM ID           "Hack"
 *     OEM Table ID     "HackLife"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "Hack", "HackLife", 0x00000000)
{
    External (_GPE.XTFY, MethodObj)    // 2 Arguments
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.GFX0, DeviceObj)
    External (_SB_.PCI0.LPCB, DeviceObj)
    External (_SB_.PCI0.LPCB.EC__, DeviceObj)
    External (_SB_.PCI0.LPCB.EC__.AC__, DeviceObj)
    External (_SB_.PCI0.LPCB.EC__.HKEY.MLCS, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.LPCB.EC__.HKEY.MMTS, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.LPCB.EC__.XQ16, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.EC__.XQ1F, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.EC__.XQ60, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.EC__.XQ61, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.EC__.XQ62, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.EC__.XQ64, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.EC__.XQ66, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.EC__.XQ6A, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.KBD_, DeviceObj)
    External (_SB_.PCI0.RP05, DeviceObj)
    External (_SB_.PCI0.RP05.PXSX, DeviceObj)
    External (_SB_.PCI0.RP05.UPSB.DSB0.NHI0, UnknownObj)
    External (_SB_.PR00, ProcessorObj)
    External (DPTF, FieldUnitObj)
    External (HPTE, IntObj)
    External (HRUS, IntObj)
    External (LNUX, IntObj)
    External (OSYS, FieldUnitObj)
    External (STAS, FieldUnitObj)
    External (WIN8, FieldUnitObj)
    External (WNTF, IntObj)
    External (XPRW, MethodObj)    // 2 Arguments

    Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            DPTF = Zero
            HPTE = Zero
            LNUX = One
            OSYS = 0x07DF
            STAS = One
            WIN8 = One
        }

        Scope (_GPE)
        {
            Method (NTFY, 2, Serialized)
            {
                If (_OSI ("Darwin"))
                {
                    Switch (ToInteger (Arg0))
                    {
                        Case (0x05)
                        {
                            Notify (\_SB.PCI0.RP05.UPSB.DSB0.NHI0, Zero) // Bus Check
                        }

                    }

                    Return (\_GPE.XTFY (Arg0, Arg1))
                }

                Return (Zero)
            }
        }

        Scope (_SB)
        {
            Scope (PCI0)
            {
                Device (GAUS)
                {
                    Name (_ADR, 0x00080000)  // _ADR: Address
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (_OSI ("Darwin"))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }
                }

                Scope (GFX0)
                {
                    Device (PNLF)
                    {
                        Name (_HID, EisaId ("APP0002"))  // _HID: Hardware ID
                        Name (_CID, "backlight")  // _CID: Compatible ID
                        Name (_UID, 0x13)  // _UID: Unique ID
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If (_OSI ("Darwin"))
                            {
                                Return (0x0B)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                    }
                }

                Scope (LPCB)
                {
                    Device (ARTC)
                    {
                        Name (_HID, "ACPI000E" /* Time and Alarm Device */)  // _HID: Hardware ID
                        Method (_GCP, 0, NotSerialized)  // _GCP: Get Capabilities
                        {
                            Return (0x05)
                        }

                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If (_OSI ("Darwin"))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                    }

                    Device (DMAC)
                    {
                        Name (_HID, EisaId ("PNP0200") /* PC-class DMA Controller */)  // _HID: Hardware ID
                        Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                        {
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x01,               // Alignment
                                0x20,               // Length
                                )
                            IO (Decode16,
                                0x0081,             // Range Minimum
                                0x0081,             // Range Maximum
                                0x01,               // Alignment
                                0x11,               // Length
                                )
                            IO (Decode16,
                                0x0093,             // Range Minimum
                                0x0093,             // Range Maximum
                                0x01,               // Alignment
                                0x0D,               // Length
                                )
                            IO (Decode16,
                                0x00C0,             // Range Minimum
                                0x00C0,             // Range Maximum
                                0x01,               // Alignment
                                0x20,               // Length
                                )
                            DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                {4}
                        })
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If (_OSI ("Darwin"))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                    }

                    Scope (EC)
                    {
                        Scope (AC)
                        {
                            If (_OSI ("Darwin"))
                            {
                                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                                {
                                    0x17, 
                                    0x03
                                })
                            }
                        }

                        Name (LED1, Zero)
                        Name (LED2, Zero)
                        Method (_Q6A, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                        {
                            If (_OSI ("Darwin"))
                            {
                                Notify (\_SB.PCI0.LPCB.KBD, 0x036B)
                                If ((LED1 == Zero))
                                {
                                    \_SB.PCI0.LPCB.EC.HKEY.MMTS (0x02)
                                    LED1 = One
                                }
                                Else
                                {
                                    \_SB.PCI0.LPCB.EC.HKEY.MMTS (Zero)
                                    LED1 = Zero
                                }
                            }
                            Else
                            {
                                \_SB.PCI0.LPCB.EC.XQ6A ()
                            }
                        }

                        Method (_Q16, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                        {
                            If (_OSI ("Darwin"))
                            {
                                Notify (\_SB.PCI0.LPCB.KBD, 0x0367)
                            }
                            Else
                            {
                                \_SB.PCI0.LPCB.EC.XQ16 ()
                            }
                        }

                        Method (_Q64, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                        {
                            If (_OSI ("Darwin"))
                            {
                                Notify (\_SB.PCI0.LPCB.KBD, 0x0368)
                            }
                            Else
                            {
                                \_SB.PCI0.LPCB.EC.XQ64 ()
                            }
                        }

                        Method (_Q66, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                        {
                            If (_OSI ("Darwin"))
                            {
                                Notify (\_SB.PCI0.LPCB.KBD, 0x0369)
                            }
                            Else
                            {
                                \_SB.PCI0.LPCB.EC.XQ66 ()
                            }
                        }

                        Method (_Q60, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                        {
                            If (_OSI ("Darwin"))
                            {
                                Notify (\_SB.PCI0.LPCB.KBD, 0x012A)
                                Notify (\_SB.PCI0.LPCB.KBD, 0x0368)
                                Notify (\_SB.PCI0.LPCB.KBD, 0x01AA)
                            }
                            Else
                            {
                                \_SB.PCI0.LPCB.EC.XQ60 ()
                            }
                        }

                        Method (_Q61, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                        {
                            If (_OSI ("Darwin"))
                            {
                                Notify (\_SB.PCI0.LPCB.KBD, 0x011D)
                                Notify (\_SB.PCI0.LPCB.KBD, 0x0448)
                                Notify (\_SB.PCI0.LPCB.KBD, 0x019D)
                            }
                            Else
                            {
                                \_SB.PCI0.LPCB.EC.XQ61 ()
                            }
                        }

                        Method (_Q62, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                        {
                            If (_OSI ("Darwin"))
                            {
                                Notify (\_SB.PCI0.LPCB.KBD, 0x036A)
                            }
                            Else
                            {
                                \_SB.PCI0.LPCB.EC.XQ62 ()
                            }
                        }

                        Method (_Q1F, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                        {
                            If (_OSI ("Darwin"))
                            {
                                If ((LED2 == Zero))
                                {
                                    Notify (\_SB.PCI0.LPCB.KBD, 0x0136)
                                    Notify (\_SB.PCI0.LPCB.KBD, 0x0367)
                                    Notify (\_SB.PCI0.LPCB.KBD, 0x01B6)
                                    \_SB.PCI0.LPCB.EC.HKEY.MLCS (One)
                                    LED2 = One
                                }
                                ElseIf ((LED2 == One))
                                {
                                    Notify (\_SB.PCI0.LPCB.KBD, 0x012A)
                                    Notify (\_SB.PCI0.LPCB.KBD, 0x036A)
                                    Notify (\_SB.PCI0.LPCB.KBD, 0x01AA)
                                    \_SB.PCI0.LPCB.EC.HKEY.MLCS (0x02)
                                    LED2 = 0x02
                                }
                                ElseIf ((LED2 == 0x02))
                                {
                                    Notify (\_SB.PCI0.LPCB.KBD, 0x012A)
                                    Notify (\_SB.PCI0.LPCB.KBD, 0x0367)
                                    Notify (\_SB.PCI0.LPCB.KBD, 0x01AA)
                                    \_SB.PCI0.LPCB.EC.HKEY.MLCS (Zero)
                                    LED2 = Zero
                                }
                                Else
                                {
                                    \_SB.PCI0.LPCB.EC.XQ1F ()
                                }
                            }
                        }
                    }

                    Device (PMCR)
                    {
                        Name (_HID, EisaId ("APP9876"))  // _HID: Hardware ID
                        Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                        {
                            Memory32Fixed (ReadWrite,
                                0xFE000000,         // Address Base
                                0x00010000,         // Address Length
                                )
                        })
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If (_OSI ("Darwin"))
                            {
                                Return (0x0B)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                    }
                }

                Device (MCHC)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (_OSI ("Darwin"))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }
                }

                If (_OSI ("Darwin"))
                {
                    Scope (RP05)
                    {
                        Scope (PXSX)
                        {
                            Name (_STA, Zero)  // _STA: Status
                        }

                        Scope (HRUS)
                        {
                            Name (_STA, Zero)  // _STA: Status
                        }

                        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                        {
                            Return (Zero)
                        }

                        Device (UPSB)
                        {
                            Name (_ADR, Zero)  // _ADR: Address
                            OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                            Field (A1E0, ByteAcc, NoLock, Preserve)
                            {
                                AVND,   32, 
                                BMIE,   3, 
                                Offset (0x18), 
                                PRIB,   8, 
                                SECB,   8, 
                                SUBB,   8, 
                                Offset (0x1E), 
                                    ,   13, 
                                MABT,   1
                            }

                            Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                            {
                                Return (SECB) /* \_SB_.PCI0.RP05.UPSB.SECB */
                            }

                            Method (_STA, 0, NotSerialized)  // _STA: Status
                            {
                                Return (0x0F)
                            }

                            Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                            {
                                Return (Zero)
                            }

                            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                            {
                                If ((Arg2 == Zero))
                                {
                                    Return (Buffer (One)
                                    {
                                         0x03                                             // .
                                    })
                                }

                                Return (Package (0x06)
                                {
                                    "AAPL,slot-name", 
                                    Buffer (0x0C)
                                    {
                                        "Thunderbolt"
                                    }, 

                                    "built-in", 
                                    Buffer (One)
                                    {
                                         0x00                                             // .
                                    }, 

                                    "PCI-Thunderbolt", 
                                    One
                                })
                            }

                            Device (DSB0)
                            {
                                Name (_ADR, Zero)  // _ADR: Address
                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                {
                                    AVND,   32, 
                                    BMIE,   3, 
                                    Offset (0x18), 
                                    PRIB,   8, 
                                    SECB,   8, 
                                    SUBB,   8, 
                                    Offset (0x1E), 
                                        ,   13, 
                                    MABT,   1
                                }

                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                {
                                    Return (0x0F)
                                }

                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                {
                                    Return (Zero)
                                }

                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                {
                                    Return (SECB) /* \_SB_.PCI0.RP05.UPSB.DSB0.SECB */
                                }

                                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                                {
                                    If ((Arg2 == Zero))
                                    {
                                        Return (Buffer (One)
                                        {
                                             0x03                                             // .
                                        })
                                    }

                                    Return (Package (0x06)
                                    {
                                        "AAPL,slot-name", 
                                        Buffer (0x0C)
                                        {
                                            "Thunderbolt"
                                        }, 

                                        "built-in", 
                                        Buffer (One)
                                        {
                                             0x00                                             // .
                                        }, 

                                        "PCIHotplugCapable", 
                                        Zero
                                    })
                                }

                                Device (NHI0)
                                {
                                    Name (_ADR, Zero)  // _ADR: Address
                                    Name (_STR, Unicode ("Thunderbolt"))  // _STR: Description String
                                    Method (_STA, 0, NotSerialized)  // _STA: Status
                                    {
                                        Return (0x0F)
                                    }

                                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                    {
                                        Return (Zero)
                                    }

                                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                                    {
                                        If ((Arg2 == Zero))
                                        {
                                            Return (Buffer (One)
                                            {
                                                 0x03                                             // .
                                            })
                                        }

                                        Return (Package (0x11)
                                        {
                                            "AAPL,slot-name", 
                                            Buffer (0x0C)
                                            {
                                                "Thunderbolt"
                                            }, 

                                            "name", 
                                            Buffer (0x23)
                                            {
                                                "Titan Ridge Thunderbolt Controller"
                                            }, 

                                            "model", 
                                            Buffer (0x2C)
                                            {
                                                "Intel JHL7540 Titan Ridge Thunderbolt 3 NHI"
                                            }, 

                                            "device_type", 
                                            Buffer (0x17)
                                            {
                                                "Thunderbolt-Controller"
                                            }, 

                                            "ThunderboltDROM", 
                                            Buffer (0x65)
                                            {
                                                /* 0000 */  0x5B, 0x00, 0xF2, 0xEE, 0x21, 0x8B, 0xF4, 0x20,  // [...!.. 
                                                /* 0008 */  0x18, 0xFA, 0x28, 0x71, 0x10, 0x01, 0x58, 0x00,  // ..(q..X.
                                                /* 0010 */  0x27, 0x01, 0x11, 0x20, 0x01, 0x01, 0x08, 0x81,  // '.. ....
                                                /* 0018 */  0x80, 0x02, 0x80, 0x00, 0x00, 0x00, 0x08, 0x82,  // ........
                                                /* 0020 */  0x90, 0x01, 0x80, 0x00, 0x00, 0x00, 0x02, 0xC3,  // ........
                                                /* 0028 */  0x02, 0xC4, 0x05, 0x85, 0x50, 0x00, 0x00, 0x05,  // ....P...
                                                /* 0030 */  0x86, 0x50, 0x00, 0x00, 0x02, 0x87, 0x0B, 0x88,  // .P......
                                                /* 0038 */  0x20, 0x01, 0x00, 0x64, 0x00, 0x00, 0x00, 0x00,  //  ..d....
                                                /* 0040 */  0x00, 0x03, 0x89, 0x80, 0x02, 0xCA, 0x02, 0xCB,  // ........
                                                /* 0048 */  0x08, 0x01, 0x52, 0x61, 0x7A, 0x65, 0x72, 0x00,  // ..Razer.
                                                /* 0050 */  0x15, 0x02, 0x42, 0x6C, 0x61, 0x64, 0x65, 0x31,  // ..Blade1
                                                /* 0058 */  0x35, 0x20, 0x42, 0x61, 0x73, 0x65, 0x20, 0x4D,  // 5 Base M
                                                /* 0060 */  0x6F, 0x64, 0x65, 0x6C, 0x00                     // odel.
                                            }, 

                                            "ThunderboltConfig", 
                                            Buffer (0x20)
                                            {
                                                /* 0000 */  0x00, 0x02, 0x1C, 0x00, 0x02, 0x00, 0x05, 0x03,  // ........
                                                /* 0008 */  0x01, 0x00, 0x04, 0x00, 0x05, 0x03, 0x02, 0x00,  // ........
                                                /* 0010 */  0x03, 0x00, 0x05, 0x03, 0x01, 0x00, 0x00, 0x00,  // ........
                                                /* 0018 */  0x03, 0x03, 0x02, 0x00, 0x01, 0x00, 0x02, 0x00   // ........
                                            }, 

                                            "linkDetails", 
                                            Buffer (0x08)
                                            {
                                                 0x08, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00   // ........
                                            }, 

                                            "power-save", 
                                            One, 
                                            Buffer (One)
                                            {
                                                 0x00                                             // .
                                            }
                                        })
                                    }
                                }
                            }

                            Device (DSB1)
                            {
                                Name (_ADR, 0x00010000)  // _ADR: Address
                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                {
                                    AVND,   32, 
                                    BMIE,   3, 
                                    Offset (0x18), 
                                    PRIB,   8, 
                                    SECB,   8, 
                                    SUBB,   8, 
                                    Offset (0x1E), 
                                        ,   13, 
                                    MABT,   1
                                }

                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                {
                                    Return (SECB) /* \_SB_.PCI0.RP05.UPSB.DSB1.SECB */
                                }

                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                {
                                    Return (0x0F)
                                }

                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                {
                                    Return (Zero)
                                }
                            }

                            Device (DSB2)
                            {
                                Name (_ADR, 0x00020000)  // _ADR: Address
                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                {
                                    AVND,   32, 
                                    BMIE,   3, 
                                    Offset (0x18), 
                                    PRIB,   8, 
                                    SECB,   8, 
                                    SUBB,   8, 
                                    Offset (0x1E), 
                                        ,   13, 
                                    MABT,   1
                                }

                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                {
                                    Return (SECB) /* \_SB_.PCI0.RP05.UPSB.DSB2.SECB */
                                }

                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                {
                                    Return (0x0F)
                                }

                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                {
                                    Return (Zero)
                                }

                                Device (XHC2)
                                {
                                    Name (_ADR, Zero)  // _ADR: Address
                                    Method (_STA, 0, NotSerialized)  // _STA: Status
                                    {
                                        Return (0x0F)
                                    }

                                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                    {
                                        Return (Zero)
                                    }

                                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                                    {
                                        If ((Arg2 == Zero))
                                        {
                                            Return (Buffer (One)
                                            {
                                                 0x03                                             // .
                                            })
                                        }

                                        Return (Package (0x18)
                                        {
                                            "AAPL,slot-name", 
                                            Buffer (0x0C)
                                            {
                                                "Thunderbolt"
                                            }, 

                                            "built-in", 
                                            Buffer (One)
                                            {
                                                 0x00                                             // .
                                            }, 

                                            "name", 
                                            Buffer (0x1F)
                                            {
                                                "Titan Ridge USB 3.1 Controller"
                                            }, 

                                            "model", 
                                            Buffer (0x22)
                                            {
                                                "Intel JHL7540 Titan Ridge USB 3.1"
                                            }, 

                                            "device_type", 
                                            Buffer (0x1F)
                                            {
                                                "USB eXtensible Host-Controller"
                                            }
                                        })
                                    }

                                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                                    {
                                        Return (Package (0x02)
                                        {
                                            0x6D, 
                                            0x03
                                        })
                                    }

                                    Device (RHUB)
                                    {
                                        Name (_ADR, Zero)  // _ADR: Address
                                        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                        {
                                            Return (Zero)
                                        }

                                        Device (SSP1)
                                        {
                                            Name (_ADR, 0x03)  // _ADR: Address
                                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                                            {
                                                0xFF, 
                                                0x0A, 
                                                Zero, 
                                                Zero
                                            })
                                            Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                                            {
                                                ToPLD (
                                                    PLD_Revision           = 0x1,
                                                    PLD_IgnoreColor        = 0x1,
                                                    PLD_Red                = 0x0,
                                                    PLD_Green              = 0x0,
                                                    PLD_Blue               = 0x0,
                                                    PLD_Width              = 0x0,
                                                    PLD_Height             = 0x0,
                                                    PLD_UserVisible        = 0x1,
                                                    PLD_Dock               = 0x0,
                                                    PLD_Lid                = 0x0,
                                                    PLD_Panel              = "UNKNOWN",
                                                    PLD_VerticalPosition   = "UPPER",
                                                    PLD_HorizontalPosition = "LEFT",
                                                    PLD_Shape              = "UNKNOWN",
                                                    PLD_GroupOrientation   = 0x0,
                                                    PLD_GroupToken         = 0x0,
                                                    PLD_GroupPosition      = 0x0,
                                                    PLD_Bay                = 0x0,
                                                    PLD_Ejectable          = 0x0,
                                                    PLD_EjectRequired      = 0x0,
                                                    PLD_CabinetNumber      = 0x0,
                                                    PLD_CardCageNumber     = 0x0,
                                                    PLD_Reference          = 0x0,
                                                    PLD_Rotation           = 0x0,
                                                    PLD_Order              = 0x0,
                                                    PLD_VerticalOffset     = 0x0,
                                                    PLD_HorizontalOffset   = 0x0)

                                            })
                                            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                                            {
                                                If ((Arg2 == Zero))
                                                {
                                                    Return (Buffer (One)
                                                    {
                                                         0x03                                             // .
                                                    })
                                                }

                                                Return (Package (0x04)
                                                {
                                                    "UsbCPortNumber", 
                                                    One, 
                                                    "UsbPowerSource", 
                                                    One
                                                })
                                            }
                                        }
                                    }
                                }
                            }

                            Device (DSB4)
                            {
                                Name (_ADR, 0x00040000)  // _ADR: Address
                                OperationRegion (A1E0, PCI_Config, Zero, 0x40)
                                Field (A1E0, ByteAcc, NoLock, Preserve)
                                {
                                    AVND,   32, 
                                    BMIE,   3, 
                                    Offset (0x18), 
                                    PRIB,   8, 
                                    SECB,   8, 
                                    SUBB,   8, 
                                    Offset (0x1E), 
                                        ,   13, 
                                    MABT,   1
                                }

                                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                                {
                                    Return (SECB) /* \_SB_.PCI0.RP05.UPSB.DSB4.SECB */
                                }

                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                {
                                    Return (0x0F)
                                }

                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                {
                                    Return (Zero)
                                }
                            }
                        }
                    }
                }

                Device (SRAM)
                {
                    Name (_ADR, 0x00140002)  // _ADR: Address
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (_OSI ("Darwin"))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }
                }

                Device (TERM)
                {
                    Name (_ADR, 0x00120000)  // _ADR: Address
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (_OSI ("Darwin"))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }
                }

                Device (UART)
                {
                    Name (_ADR, 0x00160003)  // _ADR: Address
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (_OSI ("Darwin"))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }
                }

                Device (XSPI)
                {
                    Name (_ADR, 0x001F0005)  // _ADR: Address
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (_OSI ("Darwin"))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }
                }
            }

            Device (PWRB)
            {
                Name (_HID, EisaId ("PNP0C0C") /* Power Button Device */)  // _HID: Hardware ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (0x0F)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }
            }

            Device (USBX)
            {
                Name (_ADR, Zero)  // _ADR: Address
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg2 == Zero))
                    {
                        Return (Buffer (One)
                        {
                             0x03                                             // .
                        })
                    }

                    Return (Package (0x04)
                    {
                        "kUSBSleepPortCurrentLimit", 
                        0x0BB8, 
                        "kUSBWakePortCurrentLimit", 
                        0x0BB8
                    })
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (0x0F)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }
            }
        }

        Method (GPRW, 2, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                If ((0x6D == Arg0))
                {
                    Return (Package (0x02)
                    {
                        0x6D, 
                        Zero
                    })
                }

                If ((0x0D == Arg0))
                {
                    Return (Package (0x02)
                    {
                        0x0D, 
                        Zero
                    })
                }
            }

            Return (XPRW (Arg0, Arg1))
        }
    }
}

