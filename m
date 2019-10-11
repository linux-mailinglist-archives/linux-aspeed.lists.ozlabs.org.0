Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FC2DE139
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Oct 2019 01:31:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46xGHm52JLzDqPF
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Oct 2019 10:31:32 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=collabora.com
 (client-ip=2a00:1098:0:82:1000:25:2eeb:e3e3; helo=bhuna.collabora.co.uk;
 envelope-from=boris.brezillon@collabora.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=collabora.com
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46qV4b2WDkzDqQQ
 for <linux-aspeed@lists.ozlabs.org>; Sat, 12 Oct 2019 01:01:49 +1100 (AEDT)
Received: from dhcp-172-31-174-146.wireless.concordia.ca (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id F3687290FB9;
 Fri, 11 Oct 2019 15:01:34 +0100 (BST)
Date: Fri, 11 Oct 2019 16:01:32 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 00/16] mtd: spi-nor: aspeed: AST2600 support and extensions
Message-ID: <20191011160132.26061e99@dhcp-172-31-174-146.wireless.concordia.ca>
In-Reply-To: <030ac3d9-bda7-a4da-e3ce-d792ad98beb3@kaod.org>
References: <20191004115919.20788-1-clg@kaod.org>
 <20191009225555.67622339@dhcp-172-31-174-146.wireless.concordia.ca>
 <CACPK8Xe__AYvrh40vqjwoM=XKJfp5MeqrMARpFUDGWCyJK6jXQ@mail.gmail.com>
 <20191011084503.5b7a7c2c@dhcp-172-31-174-146.wireless.concordia.ca>
 <3836fcc4-c8b0-ed04-0c52-7c642794ecb8@kaod.org>
 <20191011115129.3897cd17@dhcp-172-31-174-146.wireless.concordia.ca>
 <026b5c55-194c-934f-e039-7c4d28861d53@kaod.org>
 <20191011140611.5a34e1fb@dhcp-172-31-174-146.wireless.concordia.ca>
 <030ac3d9-bda7-a4da-e3ce-d792ad98beb3@kaod.org>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 21 Oct 2019 10:30:07 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 11 Oct 2019 15:07:18 +0200
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> On 11/10/2019 14:07, Boris Brezillon wrote:
> > On Fri, 11 Oct 2019 13:47:53 +0200
> > C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> >  =20
> >> On 11/10/2019 11:51, Boris Brezillon wrote: =20
> >>> On Fri, 11 Oct 2019 11:29:49 +0200
> >>> C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> >>>    =20
> >>>> On 11/10/2019 08:45, Boris Brezillon wrote:   =20
> >>>>> On Thu, 10 Oct 2019 23:47:45 +0000
> >>>>> Joel Stanley <joel@jms.id.au> wrote:
> >>>>>      =20
> >>>>>> On Wed, 9 Oct 2019 at 20:56, Boris Brezillon
> >>>>>> <boris.brezillon@collabora.com> wrote:     =20
> >>>>>>>
> >>>>>>> Hi Cedric,
> >>>>>>>
> >>>>>>> On Fri,  4 Oct 2019 13:59:03 +0200
> >>>>>>> C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> >>>>>>>       =20
> >>>>>>>> Hello,
> >>>>>>>>
> >>>>>>>> This series first extends the support for the Aspeed AST2500 and
> >>>>>>>> AST2400 SMC driver. It adds Dual Data support and read training =
giving
> >>>>>>>> the best read settings for a given chip. Support for the new AST=
2600
> >>>>>>>> SoC is added at the end.
> >>>>>>>>
> >>>>>>>> I understand that a new spi_mem framework exists and I do have an
> >>>>>>>> experimental driver using it. But unfortunately, it is difficult=
 to
> >>>>>>>> integrate the read training. The Aspeed constraints are not comp=
atible
> >>>>>>>> and i haven't had the time to extend the current framework.     =
  =20
> >>>>>>>
> >>>>>>> Hm, I don't think that's a good reason to push new features to the
> >>>>>>> existing driver, especially since I asked others to migrate their
> >>>>>>> drivers to spi-mem in the past. I do understand your concerns, an=
d I'll
> >>>>>>> let the SPI NOR/MTD maintainers make the final call, but I think =
it'd
> >>>>>>> be better for the SPI MEM ecosystem to think about this link-trai=
ning
> >>>>>>> API (Vignesh needs it for the Cadence driver IIRC) rather than pu=
shing
> >>>>>>> this kind of feature to spi-nor controller drivers.       =20
> >>>>>>
> >>>>>> As Cedric mentioned, the OpenBMC project has been shipping the read
> >>>>>> training code for the ast2400/ast2400 for several years now. It wo=
uld
> >>>>>> be great to see it in mainline.
> >>>>>>
> >>>>>> I think it's reasonable to ask for the driver to be moved to the
> >>>>>> spi-mem subsystem once it has the required APIs.     =20
> >>>>>
> >>>>> Except it won't have the necessary APIs unless someone works on it,=
 and
> >>>>> adding this feature to existing spi-nor drivers won't help achieving
> >>>>> this goal.     =20
> >>>>
> >>>>
> >>>> What would you suggest ? Something like the patch below which would
> >>>> call a 'train' operation at the end of spi_add_device().   =20
> >>>
> >>> This has been discussed in the past with Vignesh, but I can't find the
> >>> thread where this discussion happened. My understanding was that link
> >>> training would use a command with well-known output (is there a
> >>> dedicated SPI NOR command for that?) and test different clk settings
> >>> until it finds one that works.   =20
> >>
> >> The read training on Aspeed consists of finding the appropriate read
> >> timing delays for well-known HCLK dividers and store the results in=20
> >> the Read Timing Compensation register.=20
> >>
> >> We first read a golden buffer at low speed and then perform reads with=
=20
> >> different clocks and delay cycle settings to find a breaking point. =20
> >=20
> > Where does this golden buffer come from? Do you have a specific command
> > to access it? Is it a NOR section with well-known data? =20
>=20
> We read the first 16K of the flash device at low speed. =20

That's what I figured after reading the code.

>=20
> >> This=20
> >> selects the default clock frequency for the CEx control register.=20
> >>
> >>   =20
> >>>> Also, when doing read training, we might need to know some lowlevel=
=20
> >>>> characteristics of the chip being trained. Should we offer a way=20
> >>>> to grab the probed m25p80 device and give access to the underlying=20
> >>>> 'struct spi_nor' ?=20
> >>>>
> >>>>   static struct spi_nor *spi_get_pnor(struct spi_device *spi)
> >>>>   {
> >>>> 	struct spi_mem *spimem =3D spi_get_drvdata(spi);
> >>>> 	struct m25p *flash =3D spi_mem_get_drvdata(spimem);
> >>>>
> >>>> 	return flash ? &flash->spi_nor : NULL;
> >>>>   }
> >>>>
> >>>> Yeah, it's hideous. I just want to raise the issue.   =20
> >>>
> >>> Oh no. We definitely don't want to expose the spi_nor chip to the
> >>> spi_mem layer, but, if needed, we can add more fields to spi_mem and
> >>> let the spi_mem driver fill them. We just need to figure out what's
> >>> really needed.   =20
> >>
> >> We need the SPI/NOR flash characteristics for link training and its=20
> >> size to configure the controller to access the CS on the AHB window.  =
=20
> >=20
> > We managed to deal with direct mapping without having to explicitly pass
> > the NOR size (we just pass the size of the direct mapping we want to
> > create). What do you need the size for?  =20
>=20
> because the AHB window on which are mapped all CS is segmented.=20
>=20
> There is one sub window for each CS and all segments need to be=20
> configured in the controller (in the segment registers). In case=20
> of a bad value or an overlap, you can loose access to the CS or=20
> hang the system.

The dirmap API is here for that. If you implement the
->{create,destroy}_dirmap() hooks you should be able to decide which AHB
window is assigned to which chip. The SPI NOR layer will (soon) make
use of dirmaps instead of using plain spi_mem_exec_op() for
data read/write accesses BTW.

>=20
> To access the SPI NOR registers, you don't need a window of the=20
> exact size because in that case the controller operates in 'User'=20
> command mode and the window only needs to be partially opened.=20

Sounds good.

> Reads and Writes use the start address of AHB sub-window of the CS.

This too.

>=20
> If you want access to the full contents through a direct mapping,
> the controller operates in 'Read' or 'Fast Read' command mode and
> the window needs to be at least as wide as the flash size.

Well, we usually don't enforce that in other drivers (we use the concept
of sliding window when the flash is bigger than the physical AHB window,
and we adjust the start offset dynamically based on the
dirmap_read/write() request), but if you want to enforce that in your
driver it's fine.

>=20
> > Is it just to configure the AHB window for the link-training stuff?  =20
>=20
> The link-training uses the direct mapping mode but not on the
> whole contents, only on the first 16K. So the AHB window does not=20
> have to be as wide as the chip and we could use a default setting.
> But generally, we already have good knowledge on the chip before
> training is started.

If you need the direct mapping to be set up for the link training, that
shouldn't be a problem.

>=20
> > If that's the case, I guess this can be part of the op_template=20
> > I was talking about, or maybe passed as extra parameters.
> > =20
> >> [ ... ]
> >> =20
> >>>>  	int (*fw_translate_cs)(struct spi_controller *ctlr, unsigned cs);
> >>>> +
> >>>> +	int			(*train)(struct spi_device *spi);   =20
> >>>
> >>> Was more thinking of something like:
> >>>
> >>> 	int (*link_setup)(struct spi_mem *mem,
> >>> 			  struct spi_mem_op *op_template,
> >>> 			  ...);
> >>>
> >>> where the op_template would potentially differ depending on the type =
of
> >>> memory (NOR, NAND, SRAM?). I also don't know what other params would =
be
> >>> needed to do the link training.   =20
> >>
> >> The Aspeed controller needs to set read delay timings at different HCLK
> >> settings. It's doing read operations with the default IO mode. =20
> >=20
> > So you need information about the theoretical read delay so you can
> > adjust them, right. I guess that's something we can pass to the =20
> > ->link_setup() hook. =20
>=20
> The read delay settings really depend on the controller. I was thinking=20
> more of a post_setup() hook called once in m25p_probe() after the chip=20
> is scanned.=20

For the record, m25p is gone (code has been merged in spi-nor.c) ;-).
Back to the original topic, I don't think link setup is something
so controller specific that we can't abstract it at the spi-nor level.
Of course the piece of HW doing the link training is still the SPI
controller, but the SPI NOR framework can abstract a few things, like
figuring out which SPI_NOR operation to use, where to read the data
from, ...

>=20
> As for the parameter, we would need some SPI-NOR info or some generic
> SPI device data that the controller would know how to interpret.

Yes, that's my point. This part is memory specific. The link training
with a SPI NAND is likely to use a different operation than what's used
for a SPI NOR, and we definitely don't want SPI controllers to be aware
of that.
