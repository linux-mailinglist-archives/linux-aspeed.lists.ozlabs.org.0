Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B145DE135
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Oct 2019 01:31:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46xGHS4PF3zDqPN
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Oct 2019 10:31:16 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46qJPD0Fr2zDqXq
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Oct 2019 17:45:33 +1100 (AEDT)
Received: from dhcp-172-31-174-146.wireless.concordia.ca (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D1DE7289C93;
 Fri, 11 Oct 2019 07:45:26 +0100 (BST)
Date: Fri, 11 Oct 2019 08:45:22 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 00/16] mtd: spi-nor: aspeed: AST2600 support and extensions
Message-ID: <20191011084503.5b7a7c2c@dhcp-172-31-174-146.wireless.concordia.ca>
In-Reply-To: <CACPK8Xe__AYvrh40vqjwoM=XKJfp5MeqrMARpFUDGWCyJK6jXQ@mail.gmail.com>
References: <20191004115919.20788-1-clg@kaod.org>
 <20191009225555.67622339@dhcp-172-31-174-146.wireless.concordia.ca>
 <CACPK8Xe__AYvrh40vqjwoM=XKJfp5MeqrMARpFUDGWCyJK6jXQ@mail.gmail.com>
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

On Thu, 10 Oct 2019 23:47:45 +0000
Joel Stanley <joel@jms.id.au> wrote:

> On Wed, 9 Oct 2019 at 20:56, Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> >
> > Hi Cedric,
> >
> > On Fri,  4 Oct 2019 13:59:03 +0200
> > C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> > =20
> > > Hello,
> > >
> > > This series first extends the support for the Aspeed AST2500 and
> > > AST2400 SMC driver. It adds Dual Data support and read training giving
> > > the best read settings for a given chip. Support for the new AST2600
> > > SoC is added at the end.
> > >
> > > I understand that a new spi_mem framework exists and I do have an
> > > experimental driver using it. But unfortunately, it is difficult to
> > > integrate the read training. The Aspeed constraints are not compatible
> > > and i haven't had the time to extend the current framework. =20
> >
> > Hm, I don't think that's a good reason to push new features to the
> > existing driver, especially since I asked others to migrate their
> > drivers to spi-mem in the past. I do understand your concerns, and I'll
> > let the SPI NOR/MTD maintainers make the final call, but I think it'd
> > be better for the SPI MEM ecosystem to think about this link-training
> > API (Vignesh needs it for the Cadence driver IIRC) rather than pushing
> > this kind of feature to spi-nor controller drivers. =20
>=20
> As Cedric mentioned, the OpenBMC project has been shipping the read
> training code for the ast2400/ast2400 for several years now. It would
> be great to see it in mainline.
>=20
> I think it's reasonable to ask for the driver to be moved to the
> spi-mem subsystem once it has the required APIs.

Except it won't have the necessary APIs unless someone works on it, and
adding this feature to existing spi-nor drivers won't help achieving
this goal.
