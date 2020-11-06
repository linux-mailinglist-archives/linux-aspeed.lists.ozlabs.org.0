Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF4A2A9573
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Nov 2020 12:31:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CSJBJ50blzDrJJ
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Nov 2020 22:31:36 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=collabora.com (client-ip=46.235.227.227;
 helo=bhuna.collabora.co.uk; envelope-from=boris.brezillon@collabora.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=collabora.com
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CSJ914GbzzDrBB
 for <linux-aspeed@lists.ozlabs.org>; Fri,  6 Nov 2020 22:30:25 +1100 (AEDT)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id DFFD61F4687F;
 Fri,  6 Nov 2020 11:30:19 +0000 (GMT)
Date: Fri, 6 Nov 2020 12:30:15 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Subject: Re: [v3 4/4] spi: aspeed: Add ASPEED FMC/SPI memory controller driver
Message-ID: <20201106123015.3248d478@collabora.com>
In-Reply-To: <HK0PR06MB27865F0C5B2A4F680ED0D400B2ED0@HK0PR06MB2786.apcprd06.prod.outlook.com>
References: <20201105120331.9853-1-chin-ting_kuo@aspeedtech.com>
 <20201105120331.9853-5-chin-ting_kuo@aspeedtech.com>
 <fd8fa472-53bb-c992-3dc2-5a984a439c07@kaod.org>
 <20201105161132.37eb3265@collabora.com>
 <HK0PR06MB2786DAC99A56EA302EE969CAB2ED0@HK0PR06MB2786.apcprd06.prod.outlook.com>
 <20201106100539.62fc5249@collabora.com>
 <HK0PR06MB27865F0C5B2A4F680ED0D400B2ED0@HK0PR06MB2786.apcprd06.prod.outlook.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Vignesh R <vigneshr@ti.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>,
 BMC-SW <BMC-SW@aspeedtech.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

+Tudor and Vignesh

On Fri, 6 Nov 2020 10:21:06 +0000
Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com> wrote:

> Hi Boris,
>=20
> Thanks for your comments and suggestions.
>=20
> > -----Original Message-----
> > From: Boris Brezillon <boris.brezillon@collabora.com>
> > Sent: Friday, November 6, 2020 5:06 PM
> > To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> > Subject: Re: [v3 4/4] spi: aspeed: Add ASPEED FMC/SPI memory controller
> > driver
> >=20
> > On Fri, 6 Nov 2020 08:58:23 +0000
> > Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com> wrote:
> >  =20
> > > Hi Boris,
> > >
> > > Thanks for your quick reply.
> > > =20
> > > > -----Original Message-----
> > > > From: Boris Brezillon <boris.brezillon@collabora.com>
> > > > Sent: Thursday, November 5, 2020 11:12 PM
> > > > To: C=C3=A9dric Le Goater <clg@kaod.org>; robh+dt@kernel.org
> > > > Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>;
> > > > broonie@kernel.org; joel@jms.id.au; andrew@aj.id.au;
> > > > bbrezillon@kernel.org; devicetree@vger.kernel.org;
> > > > linux-kernel@vger.kernel.org; linux-aspeed@lists.ozlabs.org;
> > > > linux-spi@vger.kernel.org; BMC-SW <BMC-SW@aspeedtech.com>
> > > > Subject: Re: [v3 4/4] spi: aspeed: Add ASPEED FMC/SPI memory
> > > > controller driver
> > > >
> > > > Hi,
> > > >
> > > > On Thu, 5 Nov 2020 15:09:11 +0100
> > > > C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> > > > =20
> > > > > Hello Chin-Ting,
> > > > >
> > > > > Thanks for this driver. It's much cleaner than the previous and we
> > > > > should try adding support for the AST2500 SoC also. I guess we can
> > > > > keep the old driver for the AST2400 which has a different registe=
r layout.
> > > > >
> > > > > On the patchset, I think we should split this patch in three :
> > > > >
> > > > >  - basic support
> > > > >  - AHB window calculation depending on the flash size
> > > > >  - read training support =20
> > > >
> > > > I didn't look closely at the implementation, but if the read
> > > > training tries to read a section of the NOR, I'd recommend exposing
> > > > that feature through spi-mem and letting the SPI-NOR framework
> > > > trigger the training instead of doing that at dirmap creation time
> > > > (remember that spi-mem is also used for SPI NANDs which use the dir=
map =20
> > API too, and this training is unlikely to work there). =20
> > > >
> > > > The SPI-NOR framework could pass a read op template and a reference
> > > > pattern such that all the spi-mem driver has to do is execute the
> > > > template op and compare the output to the reference buffer.
> > > > =20
> > >
> > > I agree it. Before, I were not able to find a suitable location to im=
plement =20
> > read training feature. =20
> > > I think that I can add a SPI timing training function in
> > > "spi_controller_mem_ops" struct and call it by a wrapper function cal=
led at =20
> > the bottom of spi_nor_probe() in spi-nor.c. =20
> > > Maybe, SPI-NOR framework does not need to pass reference buffer since
> > > calibration method depends on each SoC itself and buffer size may be =
=20
> > variant. =20
> > > The detail calibration method may be implemented in each SoC SPI driv=
er. =20
> >=20
> > That's a real problem IMO. What makes this pattern SoC specific? I can =
see
> > why the location in flash could be *board* specific, but the pattern sh=
ould be
> > pretty common, right? As for the spi-mem operation to be executed, it's
> > definitely memory specific (I can imagine some flash vendors providing a
> > specific command returning a fixed pattern that's not actually stored o=
n a
> > visible portion of the flash). =20
>=20
> You are right, the pattern should be pretty common. The thing I was worri=
ed about is the size of
> that buffer since, maybe, some controllers need to read more data than ot=
hers in order to get good
> training result.

It would be good to see how other controllers implement that. I know
that the Cadence controller had something similar. Vignesh might be
able to share his thoughts on this.

>=20
> > >
> > > Besides, I am thinking about the possibility for adding a
> > > "spi_mem_post_init" function in spi-mem framework sine for some SoCs,
> > > SPI controller needs to adjust some settings after getting SPI flash =
=20
> > information.
> >=20
> > I don't think that's a good idea. The spi-mem interface should stay
> > memory-type agnostic and doing that means we somehow pass NOR specific
> > info. What is it that you need exactly, and why? =20
>=20
> Yes, as you mention, the spi-mem interface should stay memory-type agnost=
ic. Thus, currently, I just think about this, not implementation.
>=20
> Why did I need this exactly?
> Take ASPEED SPI controller for example, ASPEED SPI controller is designed=
 for SPI NOR flash especially.
> When ASPEED SoC powers on or reset, MCU ROM will fetch SPI NOR flash thro=
ugh SPI controller.
> But, MCU ROM does not know the current address mode of SPI NOR flash when=
 SoC was reset (SPI flash is not reset).
> Therefore, SPI flash driver needs to set related flag to notify MCU ROM w=
hen flash is set to 4B address mode and 4B read opcode is used.

Oh, that's ugly! The SPI NOR framework tries hard to not change the
addressing mode exactly for this reason. On most NORs there
should now be READ/WRITE variants allowing you to address more than 2^24
bytes without changing the addressing mode. This being said, those
problem exists on other platform which can't even let the boot ROM know
that addressing mode changed. I don't have a proper solution for your
use case, but I definitely don't like the idea of exposing such details
to spi-mem controllers...

We usually recommend to connect the NOR reset pin to the global reset
to addressing mode gets back to known state when you reboot the board
and need to go back to the boot ROM.

>=20
> Besides, for other SoCs connected to ASPEED SoC, they can read/write SPI =
NOR flash connected to ASPEED SoC by a pure HW channel without any interact=
ion of SW driver.
> But, before trigger this feature, flash read/write/erase opcode, dummy cy=
cle and other information should be filled in the related registers in adva=
nce because that HW channel
> does not know accurate information about connected SPI NOR flash.

While I can see a valid reason to allow that for READs (if we decide to
support XIP), I really don't like the idea of allowing destructive
operations (WRITE/ERASE) on the flash that don't go through the MTD
layer. This sounds like risky business to me, so I'd just forget about
that if I were you. Regarding the XIP use case, why not, but we'll need
to extend the dirmap API to support it: mappings need to stay around
and you need to return a pointer to the mapped memory region, which we
don't allow right now (because we want to let controllers move their
dirmap window if they have to).
