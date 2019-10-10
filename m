Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 46670D3494
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Oct 2019 01:48:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46q7864ks8zDqRf
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Oct 2019 10:48:38 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::743; helo=mail-qk1-x743.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="EDUt7LdV"; 
 dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46q77M6ZdQzDqQd
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Oct 2019 10:47:59 +1100 (AEDT)
Received: by mail-qk1-x743.google.com with SMTP id q203so7301424qke.1
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Oct 2019 16:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VOfBNfcbIIkZoZr/JsJgcwA46NAWvjDA5yLgk2p3Qs4=;
 b=EDUt7LdV6VNgqNyLlHw7iBGgTCVUCFcGML1XAofYuTyAjIYOkd2pYJh2Ks9Y2dhgpO
 MI/NUcqTO2rn+88NuysO1fVKxXLU4fPJ8RO3SKW6qsZc+xfi0Dmy9vW0yjv9vKTge+bu
 03tTV/hw2MnCGpkVyC2/t+P6v2uGB+A4EA/n4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VOfBNfcbIIkZoZr/JsJgcwA46NAWvjDA5yLgk2p3Qs4=;
 b=elImyf8zkvVZUf6QouSjpR/l0nhXU1Cn09QU72w6x5aKHQKdzXCq2hJmuQYsBeL87N
 mFFgEs5PWk1PC5t1pPFJ4vLSUDXW51mMBI57BWcME+jhx8n1ypX6Rut8F4LdQAdH4O+s
 n5nVr4PZ+bu+iqs8Q7crDkA8EYssxzKCfhNd6bmmzZlBOw09t2Lwrx/qDFnYEuvFnZ0r
 cuODlwZu7tX5s3TKI+WEcrUSMAMW+IgrjsK7Fh1LieKSOs4OrIfHJ7AHpYAdAr8oJBlr
 pli22MQL7yKVF/D16QRtrzB+rXS6+dbc5+CQWHpbSo+dRckxXnF786SjXMJsXVAiHdtJ
 St2g==
X-Gm-Message-State: APjAAAVTKQkRqf1ZwJ7ONEJi7VeEVKa1tHZPKnFCF20A5dwGk5Man/jA
 r2dCuvyEU2eUOSsu6NqW7WTLxu+IhIxsJHJyKu81O2RpR1A=
X-Google-Smtp-Source: APXvYqxoqIE5UuZnpgZoeTxKPAd5ePSRS1KXmPevRfEYsZ/g9e8t/yRQ3AWtpqZI2CmDKgIWa7L3/HE1GEcsFn4V1tE=
X-Received: by 2002:a37:4dca:: with SMTP id
 a193mr12705697qkb.292.1570751276858; 
 Thu, 10 Oct 2019 16:47:56 -0700 (PDT)
MIME-Version: 1.0
References: <20191004115919.20788-1-clg@kaod.org>
 <20191009225555.67622339@dhcp-172-31-174-146.wireless.concordia.ca>
In-Reply-To: <20191009225555.67622339@dhcp-172-31-174-146.wireless.concordia.ca>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 10 Oct 2019 23:47:45 +0000
Message-ID: <CACPK8Xe__AYvrh40vqjwoM=XKJfp5MeqrMARpFUDGWCyJK6jXQ@mail.gmail.com>
Subject: Re: [PATCH 00/16] mtd: spi-nor: aspeed: AST2600 support and extensions
To: Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 9 Oct 2019 at 20:56, Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> Hi Cedric,
>
> On Fri,  4 Oct 2019 13:59:03 +0200
> C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> > Hello,
> >
> > This series first extends the support for the Aspeed AST2500 and
> > AST2400 SMC driver. It adds Dual Data support and read training giving
> > the best read settings for a given chip. Support for the new AST2600
> > SoC is added at the end.
> >
> > I understand that a new spi_mem framework exists and I do have an
> > experimental driver using it. But unfortunately, it is difficult to
> > integrate the read training. The Aspeed constraints are not compatible
> > and i haven't had the time to extend the current framework.
>
> Hm, I don't think that's a good reason to push new features to the
> existing driver, especially since I asked others to migrate their
> drivers to spi-mem in the past. I do understand your concerns, and I'll
> let the SPI NOR/MTD maintainers make the final call, but I think it'd
> be better for the SPI MEM ecosystem to think about this link-training
> API (Vignesh needs it for the Cadence driver IIRC) rather than pushing
> this kind of feature to spi-nor controller drivers.

As Cedric mentioned, the OpenBMC project has been shipping the read
training code for the ast2400/ast2400 for several years now. It would
be great to see it in mainline.

I think it's reasonable to ask for the driver to be moved to the
spi-mem subsystem once it has the required APIs.

Cheers,

Joel


>
> >
> > This patchset has been in use for some time in the OpenBMC kernel on
> > these systems :
> >
> >  * OpenPOWER Palmetto (AST2400)
> >  * Evaluation board (AST2500)
> >  * OpenPOWER Witherspoon (AST2500)
> >  * OpenPOWER Romulus (AST2500)
> >  * OpenPOWER Zaius (AST2500)
> >    and many others
> >
> > and it is now in use on these boards with the new SoC :
> >
> >  * Evaluation board (AST2600)
> >  * Tacoma board (AST2600)
> >
> > Thanks,
> >
> > C.
> >
> > Alexander Soldatov (1):
> >   mtd: spi-nor: fix options for mx66l51235f
> >
> > C=C3=A9dric Le Goater (15):
> >   mtd: spi-nor: aspeed: Use command mode for reads
> >   mtd: spi-nor: aspeed: Add support for SPI dual IO read mode
> >   mtd: spi-nor: aspeed: Link controller with the ahb clock
> >   mtd: spi-nor: aspeed: Add read training
> >   mtd: spi-nor: aspeed: Limit the maximum SPI frequency
> >   mtd: spi-nor: aspeed: Add support for the 4B opcodes
> >   mtd: spi-nor: Add support for w25q512jv
> >   mtd: spi-nor: aspeed: Introduce a field for the AHB physical address
> >   mtd: spi-nor: aspeed: Introduce segment operations
> >   dt-bindings: mtd: aspeed-smc: Add new comptatible for AST2600
> >   mtd: spi-nor: aspeed: Add initial support for the AST2600
> >   mtd: spi-nor: aspeed: Check for disabled segments on the AST2600
> >   mtd: spi-nor: aspeed: Introduce training operations per platform
> >   mtd: spi-nor: aspeed: Introduce a HCLK mask for training
> >   mtd: spi-nor: aspeed: Add read training support for the AST2600
> >
> >  drivers/mtd/spi-nor/aspeed-smc.c              | 593 ++++++++++++++++--
> >  drivers/mtd/spi-nor/spi-nor.c                 |   5 +-
> >  .../devicetree/bindings/mtd/aspeed-smc.txt    |   2 +
> >  3 files changed, 551 insertions(+), 49 deletions(-)
> >
>
