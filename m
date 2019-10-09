Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA82DE12A
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Oct 2019 01:30:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46xGGQ4KsYzDqQn
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Oct 2019 10:30:22 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=collabora.com
 (client-ip=2a00:1098:0:82:1000:25:2eeb:e3e3; helo=bhuna.collabora.co.uk;
 envelope-from=boris.brezillon@collabora.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=collabora.com
X-Greylist: delayed 482 seconds by postgrey-1.36 at bilbo;
 Thu, 10 Oct 2019 08:04:14 AEDT
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46pRXt3ScfzDqRp
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Oct 2019 08:04:14 +1100 (AEDT)
Received: from dhcp-172-31-174-146.wireless.concordia.ca (unknown
 [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 89B7C2603FE;
 Wed,  9 Oct 2019 21:55:58 +0100 (BST)
Date: Wed, 9 Oct 2019 22:55:55 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 00/16] mtd: spi-nor: aspeed: AST2600 support and extensions
Message-ID: <20191009225555.67622339@dhcp-172-31-174-146.wireless.concordia.ca>
In-Reply-To: <20191004115919.20788-1-clg@kaod.org>
References: <20191004115919.20788-1-clg@kaod.org>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 21 Oct 2019 10:30:06 +1100
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
 linux-aspeed@lists.ozlabs.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Cedric,

On Fri,  4 Oct 2019 13:59:03 +0200
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> Hello,
>=20
> This series first extends the support for the Aspeed AST2500 and
> AST2400 SMC driver. It adds Dual Data support and read training giving
> the best read settings for a given chip. Support for the new AST2600
> SoC is added at the end.
>=20
> I understand that a new spi_mem framework exists and I do have an
> experimental driver using it. But unfortunately, it is difficult to
> integrate the read training. The Aspeed constraints are not compatible
> and i haven't had the time to extend the current framework.

Hm, I don't think that's a good reason to push new features to the
existing driver, especially since I asked others to migrate their
drivers to spi-mem in the past. I do understand your concerns, and I'll
let the SPI NOR/MTD maintainers make the final call, but I think it'd
be better for the SPI MEM ecosystem to think about this link-training
API (Vignesh needs it for the Cadence driver IIRC) rather than pushing
this kind of feature to spi-nor controller drivers.

>=20
> This patchset has been in use for some time in the OpenBMC kernel on
> these systems :
>=20
>  * OpenPOWER Palmetto (AST2400)
>  * Evaluation board (AST2500)=20
>  * OpenPOWER Witherspoon (AST2500)
>  * OpenPOWER Romulus (AST2500)
>  * OpenPOWER Zaius (AST2500)
>    and many others
> =20
> and it is now in use on these boards with the new SoC :
>=20
>  * Evaluation board (AST2600)=20
>  * Tacoma board (AST2600)=20
>=20
> Thanks,
>=20
> C.
>=20
> Alexander Soldatov (1):
>   mtd: spi-nor: fix options for mx66l51235f
>=20
> C=C3=A9dric Le Goater (15):
>   mtd: spi-nor: aspeed: Use command mode for reads
>   mtd: spi-nor: aspeed: Add support for SPI dual IO read mode
>   mtd: spi-nor: aspeed: Link controller with the ahb clock
>   mtd: spi-nor: aspeed: Add read training
>   mtd: spi-nor: aspeed: Limit the maximum SPI frequency
>   mtd: spi-nor: aspeed: Add support for the 4B opcodes
>   mtd: spi-nor: Add support for w25q512jv
>   mtd: spi-nor: aspeed: Introduce a field for the AHB physical address
>   mtd: spi-nor: aspeed: Introduce segment operations
>   dt-bindings: mtd: aspeed-smc: Add new comptatible for AST2600
>   mtd: spi-nor: aspeed: Add initial support for the AST2600
>   mtd: spi-nor: aspeed: Check for disabled segments on the AST2600
>   mtd: spi-nor: aspeed: Introduce training operations per platform
>   mtd: spi-nor: aspeed: Introduce a HCLK mask for training
>   mtd: spi-nor: aspeed: Add read training support for the AST2600
>=20
>  drivers/mtd/spi-nor/aspeed-smc.c              | 593 ++++++++++++++++--
>  drivers/mtd/spi-nor/spi-nor.c                 |   5 +-
>  .../devicetree/bindings/mtd/aspeed-smc.txt    |   2 +
>  3 files changed, 551 insertions(+), 49 deletions(-)
>=20

