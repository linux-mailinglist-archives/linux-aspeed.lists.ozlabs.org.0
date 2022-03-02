Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1001D4CB21D
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Mar 2022 23:17:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K87l00HMYz3bfL
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Mar 2022 09:17:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=TGLsEu6t;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82b;
 helo=mail-qt1-x82b.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=TGLsEu6t; dkim-atps=neutral
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K87ks6bl3z2yph
 for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Mar 2022 09:16:51 +1100 (AEDT)
Received: by mail-qt1-x82b.google.com with SMTP id bt3so3069685qtb.0
 for <linux-aspeed@lists.ozlabs.org>; Wed, 02 Mar 2022 14:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qFb1AQXGto8rW2v4HENONQPyad9zpp2Lw3iyL5e2hcw=;
 b=TGLsEu6t++tXeHwptrWF0tmRCBkIkJHDm4VFCqheaPgdP8JHAuqJrpBzSg8NQ9fp8F
 XGDXGLQ9OJkcaVoPa7f/ow+MOL8mQC7QNnJ6ZoiOKaO0jqhk5+Mefa7o+fgkgIQA8GqA
 QF3kXKcFGBmGfZhGMttHslQaXysRkuvCylHUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qFb1AQXGto8rW2v4HENONQPyad9zpp2Lw3iyL5e2hcw=;
 b=X6OMelSD/OKlMqzfQaHPEHp8GumNMnduqVKVBvrT+j74Q7Kityxr0DEMheU+dya2C0
 Zg7iInSHCORkj89dZyudNPj2HSZEddfy5hR/iX8voTVTt6a+JtxIChl+nKjHx6c6E5YR
 PO+Ox8TQOZpfAf+vyuDqTkDXjkKNU51IKwaq7zL0HrTFaJUrseuf0UUaTe4mv100OwqU
 YwswXJE3UCXc/Sgh/I35OZeiDFk//Nyz16StyO5BcwDa9z6yTpqeofGNQojizRst8hRS
 BwX4MquSugCYtXGLQjTIU4UCKsLbWXqKH//IuPvu5zqfU6M38dPbGAtFjgHITBGWsjka
 xt1Q==
X-Gm-Message-State: AOAM532OQJY9mvXpnjpsbA6C9kZBNmqpHrr6hocYrhYIL8J3uYq3jA4N
 cLkLKum7l1Al6cCr8Z44cTadU5CFlXCGelzjbEs=
X-Google-Smtp-Source: ABdhPJzkJ0p0YYS9ZflUh9jGYrmogt5rxOjUJMxJJf96LA6FonDZUDNtoD1pgTQcDhJlQxMnIZ36OkJc+TL5n2hUco4=
X-Received: by 2002:ac8:5b82:0:b0:2cf:232d:b1f8 with SMTP id
 a2-20020ac85b82000000b002cf232db1f8mr25724587qta.58.1646259409105; Wed, 02
 Mar 2022 14:16:49 -0800 (PST)
MIME-Version: 1.0
References: <20220302173114.927476-1-clg@kaod.org>
 <20220302173114.927476-2-clg@kaod.org>
In-Reply-To: <20220302173114.927476-2-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 2 Mar 2022 22:16:35 +0000
Message-ID: <CACPK8XcQfC6qfMDLzzLeK5BKmBnrspruvruJ9xGdydZgWefVOw@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] mtd: spi-nor: aspeed: Rename Kconfig option
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Pratyush Yadav <p.yadav@ti.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 2 Mar 2022 at 17:31, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> To prepare transition to the new Aspeed SMC SPI controller driver using
> the spi-mem interface, change the kernel CONFIG option of the current
> driver to reflect that the implementation uses the MTD SPI-NOR interface.
> Once the new driver is sufficiently exposed, we should remove the old one=
.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

As the maintianer of the aspeed systems and the openbmc kernel, I
think this makes the most sense.

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/mtd/spi-nor/controllers/Kconfig  | 2 +-
>  drivers/mtd/spi-nor/controllers/Makefile | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/controllers/Kconfig b/drivers/mtd/spi-no=
r/controllers/Kconfig
> index 5c0e0ec2e6d1..876a47042fec 100644
> --- a/drivers/mtd/spi-nor/controllers/Kconfig
> +++ b/drivers/mtd/spi-nor/controllers/Kconfig
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -config SPI_ASPEED_SMC
> +config SPI_ASPEED_SMC_MTD_SPI_NOR
>         tristate "Aspeed flash controllers in SPI mode"
>         depends on ARCH_ASPEED || COMPILE_TEST
>         depends on HAS_IOMEM && OF
> diff --git a/drivers/mtd/spi-nor/controllers/Makefile b/drivers/mtd/spi-n=
or/controllers/Makefile
> index e7abba491d98..1e28297fb1e8 100644
> --- a/drivers/mtd/spi-nor/controllers/Makefile
> +++ b/drivers/mtd/spi-nor/controllers/Makefile
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
> -obj-$(CONFIG_SPI_ASPEED_SMC)   +=3D aspeed-smc.o
> +obj-$(CONFIG_SPI_ASPEED_SMC_MTD_SPI_NOR)       +=3D aspeed-smc.o
>  obj-$(CONFIG_SPI_HISI_SFC)     +=3D hisi-sfc.o
>  obj-$(CONFIG_SPI_NXP_SPIFI)    +=3D nxp-spifi.o
>  obj-$(CONFIG_SPI_INTEL_SPI)    +=3D intel-spi.o
> --
> 2.34.1
>
