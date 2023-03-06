Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1559C6AFCA6
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Mar 2023 02:58:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PWb7Y736rz30Bp
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Mar 2023 12:58:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=btTrgj3h;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com; envelope-from=klaus.kudielka@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=btTrgj3h;
	dkim-atps=neutral
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVnSv0DTxz3cM7
	for <linux-aspeed@lists.ozlabs.org>; Tue,  7 Mar 2023 05:40:29 +1100 (AEDT)
Received: by mail-wr1-x42b.google.com with SMTP id g3so9847285wri.6
        for <linux-aspeed@lists.ozlabs.org>; Mon, 06 Mar 2023 10:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678128023;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B1PH+yRb87aW+TCrhm59uGdmpc+0t4xz4NdiXNOaRfU=;
        b=btTrgj3hvHGI4jNHgY0EEKR1i+DuZ26UUXctsbwjMpHLfA7IkcIGzId7qVz7bppB+z
         iW7EFRRsx7h4YBb5rOaKUMyiBr0ue2cwkVM22UQO8OMZqwJcBQBVkRKyW0ksbVdmL6NB
         r6jH4UNBYH3BKQgTRs/JhQ0ekoI8YjtULw/YN6+YKU+T9coIUlVpkN3S0OyDs977Q9Qu
         qytyEpOSUWf2idHgq1mtTKUd+oml3jjhpVuCzfqtWINLqq5+moZWWGBi6Dwj+VRngh2S
         xfMxkrTxRtMmAQplUkFUkne9TVxM4MiBe7If1iNgQH8XhT8NYqZWvg0mfQMI5yXnYx+q
         NHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678128023;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B1PH+yRb87aW+TCrhm59uGdmpc+0t4xz4NdiXNOaRfU=;
        b=kOcLjdjMzqf8HNw1RDeXbaPqgUmtB1k4S55FCnzgmlzHntFRuvlG5ev47JqIjHyc1D
         NKhD5FwN00yjQ4BAAOIKcNcb44iSgX1FuzAz2f8ahEaJoiVQk9wNR1Q5P7YD5GgsVdZk
         mcYsJsgMWu74SiAdQvrIPcxEuMRxotajvPCzneuP9M0RuZo8GWoj67kyGyYNhVVcn4qO
         DwnSBARZwAwsbDrklh9/M+QyqO8MoZFi3mxtHThVJtlsCRkbB3ExPoKS6SE8TwHyWisk
         Dyn4RBmK0hKCoDh1EPD5zEYseRThiA2A3Ur67kSNnO1S794J0ZkSQPzD66Bf77gyUZlF
         Ad5Q==
X-Gm-Message-State: AO0yUKW3s2THvw8v0NegETL0KZfb/eFroHrX/mjK+i5rz96H8yaHb6z/
	PZnQsqinLM1hea/ipqiscfs=
X-Google-Smtp-Source: AK7set/F36FHtydPEcpGgsu0Ed9jFfTXpA/Ag5lVW1UVkjbFqBz9jjpeztml0DNaEurx5Zzjqy6GSA==
X-Received: by 2002:a5d:630c:0:b0:2bf:d940:29b6 with SMTP id i12-20020a5d630c000000b002bfd94029b6mr8001979wru.54.1678128023184;
        Mon, 06 Mar 2023 10:40:23 -0800 (PST)
Received: from ?IPv6:2a02:168:6806:0:3cd0:c200:5d73:7ad4? ([2a02:168:6806:0:3cd0:c200:5d73:7ad4])
        by smtp.gmail.com with ESMTPSA id j17-20020adff011000000b002c5a1bd527dsm10480809wro.96.2023.03.06.10.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 10:40:22 -0800 (PST)
Message-ID: <712bc92ca6d576f33f63f1e9c2edf0030b10d3ae.camel@gmail.com>
Subject: Re: [PATCH net-next v2 4/6] net: mdio: scan bus based on bus
 capabilities for C22 and C45
From: Klaus Kudielka <klaus.kudielka@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Date: Mon, 06 Mar 2023 19:40:21 +0100
In-Reply-To: <100c439a-2a4d-4cb2-96f2-5bf273e2121a@lunn.ch>
References: 	<20230116-net-next-remove-probe-capabilities-v2-0-15513b05e1f4@walle.cc>
	 <20230116-net-next-remove-probe-capabilities-v2-4-15513b05e1f4@walle.cc>
	 <449bde236c08d5ab5e54abd73b645d8b29955894.camel@gmail.com>
	 <100c439a-2a4d-4cb2-96f2-5bf273e2121a@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-1 
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 08 Mar 2023 12:56:37 +1100
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-aspeed@lists.ozlabs.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, Jesse Brandeburg <jesse.brandeburg@intel.com>, Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-arm-kernel@lists.infradead.org, Bryan Whitehead <bryan.whitehead@microchip.com>, linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com, Michael Walle <michael@walle.cc>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>, "David S.
 Miller" <davem@davemloft.net>, Felix Fietkau <nbd@nbd.name>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sun, 2023-03-05 at 19:35 +0100, Andrew Lunn wrote:
> On Sun, Mar 05, 2023 at 07:13:09PM +0100, Klaus Kudielka wrote:
> > On Wed, 2023-01-18 at 11:01 +0100, Michael Walle wrote:
> > > From: Andrew Lunn <andrew@lunn.ch>
> > >=20
> > > Now that all MDIO bus drivers which set probe_capabilities to
> > > MDIOBUS_C22_C45 have been converted to use the name API for C45
> > > transactions, perform the scanning of the bus based on which methods
> > > the bus provides.
> > >=20
> > > Signed-off-by: Andrew Lunn <andrew@lunn.ch>
> > > Signed-off-by: Michael Walle <michael@walle.cc>
> > > Reviewed-by: Jesse Brandeburg <jesse.brandeburg@intel.com>
> >=20
> > Hello,
> >=20
> > On a Turris Omnia (Armada 385, Marvell 88E6176) this commit results
> > in a strange boot behaviour. I see two distinct multi-second freezes
> > in dmesg. Usually (up to the commit before), the (monolithic) kernel
> > starts init after ~1.6 seconds, now it takes more than 6....
> >=20
> > dmesg output below. Any idea, why this is happening?
>=20
> The Armada 385 uses mdio-orian, also known as
> drivers/net/ethernet/marvell/mvmdio.c. It comes in two variants, one
> which supports only C22 and one which only supports C45, if i'm
> reading orion_mdio_match[] correctly.
>=20
> Please could you add a debug print in orion_mdio_smi_read() and
> orion_mdio_xsmi_read_c45() and see if there is a difference before and
> after this patch.
>=20
> I'm assuming here the problem is with the MDIO bus associated to
> mvneta, and not the mdio bus associated to the switch. That assumption
> could be wrong, but the printk's should help with that as well.
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Andrew


I just added

dev_warn_ratelimited(bus->parent, "<function_name> %d\n", mii_id);

at the entry point of each function. And here we go.



########
# good: [3486593374858b41ae6ef7720cb28ff39ad822f3] net: mdio: Add workaroun=
d for Micrel PHYs which are not C45 compatible

*** snip ***
[    0.194348] Creating 3 MTD partitions on "spi0.0":
[    0.194353] 0x000000000000-0x0000000f0000 : "U-Boot"
[    0.194534] 0x000000100000-0x000000800000 : "Rescue system"
[    0.194652] 0x0000000f0000-0x000000100000 : "u-boot-env"
[    0.195518] orion-mdio f1072004.mdio: orion_mdio_smi_read 1
[    0.195592] orion-mdio f1072004.mdio: orion_mdio_smi_read 1
[    0.202202] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[    0.202280] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[    0.202346] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[    0.202470] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[    0.202534] mv88e6085 f1072004.mdio-mii:10: switch 0x1760 detected: Marv=
ell 88E6176, revision 1
[    0.202542] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[    0.202674] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[    0.202799] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[    0.202921] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[    0.320192] mvneta_bm f10c8000.bm: Buffer Manager for network controller=
 enabled
*** snip ***
[    1.598893] Run /init as init process
[    1.598896]   with arguments:
[    1.598898]     /init
[    1.598900]   with environment:
[    1.598902]     HOME=3D/
[    1.598904]     TERM=3Dlinux
*** snip ***
[    4.628127] mv88e6085 f1072004.mdio-mii:10 lan3: Link is Up - 1Gbps/Full=
 - flow control rx/tx
[    4.628150] IPv6: ADDRCONF(NETDEV_CHANGE): lan3: link becomes ready
[    4.628210] br0: port 2(lan3) entered blocking state
[    4.628219] br0: port 2(lan3) entered forwarding state
[    4.629187] IPv6: ADDRCONF(NETDEV_CHANGE): br0: link becomes ready
[  283.962353] orion_mdio_smi_read: 9231 callbacks suppressed
[  283.962361] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  283.962492] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  283.962617] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  283.962799] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  283.962981] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  283.963162] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  283.963344] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  283.963466] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  283.963588] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  283.963652] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  310.572411] orion_mdio_smi_read: 56 callbacks suppressed
[  310.572419] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  310.572550] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  310.572675] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  310.572857] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  310.573039] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  310.573220] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  310.573402] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  310.573524] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  310.573647] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  310.573711] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  726.308614] orion_mdio_smi_read: 56 callbacks suppressed
[  726.308623] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  726.308754] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  726.308879] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  726.309060] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  726.309242] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  726.309423] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  726.309604] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  726.309727] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  726.309850] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  726.309914] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  841.713791] orion_mdio_smi_read: 56 callbacks suppressed
[  841.713800] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  841.713931] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  841.714056] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  841.714239] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  841.714420] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  841.714602] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  841.714783] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  841.714906] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  841.715029] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  841.715093] orion-mdio f1072004.mdio: orion_mdio_smi_read 16



#####
# first bad commit: [1a136ca2e089d91df8eec0a796a324171373ffd8] net: mdio: s=
can bus based on bus capabilities for C22 and C45

*** snip ***
[    0.191685] Creating 3 MTD partitions on "spi0.0":
[    0.191690] 0x000000000000-0x0000000f0000 : "U-Boot"
[    0.191871] 0x000000100000-0x000000800000 : "Rescue system"
[    0.191991] 0x0000000f0000-0x000000100000 : "u-boot-env"
[    0.192830] orion-mdio f1072004.mdio: orion_mdio_smi_read 1
[    0.192906] orion-mdio f1072004.mdio: orion_mdio_smi_read 1
[    0.199530] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[    0.199610] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[    0.199677] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[    0.199799] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[    0.199864] mv88e6085 f1072004.mdio-mii:10: switch 0x1760 detected: Marv=
ell 88E6176, revision 1
[    0.199871] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[    0.199994] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[    0.200117] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[    0.200239] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[    0.396608] ata2: SATA link down (SStatus 0 SControl 300)
[    0.554697] ata1: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[    0.555370] ata1.00: supports DRM functions and may not be fully accessi=
ble
[    0.555375] ata1.00: ATA-10: KINGSTON SKC600MS512G, S4800105, max UDMA/1=
33
[    0.555385] ata1.00: 1000215216 sectors, multi 1: LBA48 NCQ (depth 32)
[    0.556058] ata1.00: Features: Trust Dev-Sleep
[    0.556158] ata1.00: supports DRM functions and may not be fully accessi=
ble
[    0.556811] ata1.00: configured for UDMA/133
[    0.556985] scsi 0:0:0:0: Direct-Access     ATA      KINGSTON SKC600M 01=
05 PQ: 0 ANSI: 5
[    0.557485] sd 0:0:0:0: [sda] 1000215216 512-byte logical blocks: (512 G=
B/477 GiB)
[    0.557493] sd 0:0:0:0: [sda] 4096-byte physical blocks
[    0.557515] sd 0:0:0:0: [sda] Write Protect is off
[    0.557520] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    0.557553] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled,=
 doesn't support DPO or FUA
[    0.557620] sd 0:0:0:0: [sda] Preferred minimum I/O size 4096 bytes
[    0.558111]  sda: sda1
[    0.558230] sd 0:0:0:0: [sda] Attached SCSI removable disk
[    2.741909] mvneta_bm f10c8000.bm: Buffer Manager for network controller=
 enabled
*** snip ***
[    3.213998] sfp sfp: module TP-LINK          TL-SM321B        rev      s=
n 1403076900       dc 140401
[    3.214020] mvneta f1034000.ethernet eth2: switched to inband/1000base-x=
 link mode
[    5.194695] orion_mdio_smi_read: 43968 callbacks suppressed
[    5.194701] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[    5.194767] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[    5.194891] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[    5.195014] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[    5.195137] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[    5.195259] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[    5.195324] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[    5.195446] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[    5.195510] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[    5.195633] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[    6.223184] mv88e6085 f1072004.mdio-mii:10: configuring for fixed/rgmii-=
id link mode
[    6.224852] mv88e6085 f1072004.mdio-mii:10: configuring for fixed/rgmii-=
id link mode
[    6.226126] mv88e6085 f1072004.mdio-mii:10: Link is Up - 1Gbps/Full - fl=
ow control off
[    6.229455] mv88e6085 f1072004.mdio-mii:10: Link is Up - 1Gbps/Full - fl=
ow control off
[    6.294120] mv88e6085 f1072004.mdio-mii:10 lan0 (uninitialized): PHY [mv=
88e6xxx-1:00] driver [Marvell 88E1540] (irq=3D68)
[    6.366663] mv88e6085 f1072004.mdio-mii:10 lan1 (uninitialized): PHY [mv=
88e6xxx-1:01] driver [Marvell 88E1540] (irq=3D69)
[    6.438843] mv88e6085 f1072004.mdio-mii:10 lan2 (uninitialized): PHY [mv=
88e6xxx-1:02] driver [Marvell 88E1540] (irq=3D70)
[    6.510122] mv88e6085 f1072004.mdio-mii:10 lan3 (uninitialized): PHY [mv=
88e6xxx-1:03] driver [Marvell 88E1540] (irq=3D71)
[    6.582302] mv88e6085 f1072004.mdio-mii:10 lan4 (uninitialized): PHY [mv=
88e6xxx-1:04] driver [Marvell 88E1540] (irq=3D72)
[    6.584680] device eth1 entered promiscuous mode
[    6.585573] device eth0 entered promiscuous mode
[    6.585593] DSA: tree 0 setup
[    6.586408] Freeing unused kernel image (initmem) memory: 1024K
[    6.586547] Run /init as init process
[    6.586551]   with arguments:
[    6.586553]     /init
[    6.586555]   with environment:
[    6.586557]     HOME=3D/
[    6.586559]     TERM=3Dlinux
*** snip ***
[    9.437029] mv88e6085 f1072004.mdio-mii:10 lan3: Link is Up - 1Gbps/Full=
 - flow control rx/tx
[    9.437052] IPv6: ADDRCONF(NETDEV_CHANGE): lan3: link becomes ready
[    9.437116] br0: port 2(lan3) entered blocking state
[    9.437125] br0: port 2(lan3) entered forwarding state
[    9.438061] IPv6: ADDRCONF(NETDEV_CHANGE): br0: link becomes ready
[    9.469466] systemd-journald[207]: Time jumped backwards, rotating.
[  414.675728] orion_mdio_smi_read: 11201 callbacks suppressed
[  414.675736] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  414.675869] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  414.675996] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  414.676179] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  414.676361] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  414.676543] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  414.676725] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  414.676847] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  414.676970] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  414.677034] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  540.809740] orion_mdio_smi_read: 56 callbacks suppressed
[  540.809748] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  540.809879] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  540.810004] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  540.810186] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  540.810368] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  540.810551] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  540.810732] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  540.810855] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  540.810978] orion-mdio f1072004.mdio: orion_mdio_smi_read 16
[  540.811042] orion-mdio f1072004.mdio: orion_mdio_smi_read 16



"orion_mdio_smi_read: 43968 callbacks suppressed" after 5 seconds - quite i=
mpressive!


Best regards, Klaus

