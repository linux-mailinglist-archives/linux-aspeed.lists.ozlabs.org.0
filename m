Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D74F54CB2C3
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Mar 2022 00:38:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K89Y44Nhrz3bd6
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Mar 2022 10:38:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=A/8uC4OL;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::835;
 helo=mail-qt1-x835.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=A/8uC4OL; dkim-atps=neutral
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K89Xz3csFz3bP4
 for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Mar 2022 10:38:26 +1100 (AEDT)
Received: by mail-qt1-x835.google.com with SMTP id f18so3212017qtb.3
 for <linux-aspeed@lists.ozlabs.org>; Wed, 02 Mar 2022 15:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0UHeOvGnIMNoM6NqeyF78xFos6+YD8GiFF2O+NX+I08=;
 b=A/8uC4OLZK85x/RsG6wFgeWjAayUjjUSlMWGVzfPxubGvRVyL6+UqPMrijz8hBNBae
 7+Xma0aYf2Wnr1goOeR8vCpaBIDCURIghfyk8+CPkPm8Wjlh4XrVXzXMmlU7y9LZ5llU
 Ra7+w69qG+z5lQmzrnsv6xktbsN0B2rEgy1R4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0UHeOvGnIMNoM6NqeyF78xFos6+YD8GiFF2O+NX+I08=;
 b=IuJk38Pds/9JpkogDPmPGm9RqBsv9DdUGFfZQ6jos0s7vCR2iDy0+c4Tb8G5bfEdES
 J3Wys9d+iv7djpvPQ9/OdvhPK10yswFo7EbmRY+Ey4xlmPqoK0CmZOqmlezw/GV/bgey
 QU/FFb0VDToODGLjyZh2mts3ETbYae44edYryzLuROx/8XJwZc7vDv5JCPs70iiK5us0
 LR6hrK7cb/0R3BmY2TEjfrROsq74E9zV0xsvimBQtNTQ0zhIkXcmU6RfUdK9aK+ESVT4
 hibZ1ZflKVUdRAeEU5QG2JHNIWIgW9h5O3N5HspFa8HJeacYrDvcloxZ81Cm44t9pi6y
 UGAg==
X-Gm-Message-State: AOAM532BLDQX0zxWw0CDOtOp9/jLBY3JdI8WnDsj/Ql09OYjZa5vhBDA
 GfBnS6Mmi7Qp1QmUlpWt/c9a2NxY0g72ys9mMxM=
X-Google-Smtp-Source: ABdhPJwCs5BS/vb/0Gnia8sBd/4fwz2M9pisx/6g/jEojI9HtPhU1m7xtnkyYUd9xlwgdUsE3xPO2rpi1UAXpFZPYeE=
X-Received: by 2002:a05:622a:1b8d:b0:2c6:59a9:360e with SMTP id
 bp13-20020a05622a1b8d00b002c659a9360emr25551831qtb.678.1646264303744; Wed, 02
 Mar 2022 15:38:23 -0800 (PST)
MIME-Version: 1.0
References: <20220302173114.927476-1-clg@kaod.org>
 <20220302173114.927476-5-clg@kaod.org>
In-Reply-To: <20220302173114.927476-5-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 2 Mar 2022 23:38:10 +0000
Message-ID: <CACPK8Xc5DMeBnQnVWk4YUsiN7YFsujYh9Qs9okrc8vFvaF28Fw@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] spi: spi-mem: Add driver for Aspeed SMC
 controllers
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
> This SPI driver adds support for the Aspeed static memory controllers
> of the AST2600, AST2500 and AST2400 SoCs using the spi-mem interface.
>
>  * AST2600 Firmware SPI Memory Controller (FMC)
>    . BMC firmware
>    . 3 chip select pins (CE0 ~ CE2)
>    . Only supports SPI type flash memory
>    . different segment register interface
>    . single, dual and quad mode.
>
>  * AST2600 SPI Flash Controller (SPI1 and SPI2)
>    . host firmware
>    . 2 chip select pins (CE0 ~ CE1)
>    . different segment register interface
>    . single, dual and quad mode.
>
>  * AST2500 Firmware SPI Memory Controller (FMC)
>    . BMC firmware
>    . 3 chip select pins (CE0 ~ CE2)
>    . supports SPI type flash memory (CE0-CE1)
>    . CE2 can be of NOR type flash but this is not supported by the driver
>    . single, dual mode.
>
>  * AST2500 SPI Flash Controller (SPI1 and SPI2)
>    . host firmware
>    . 2 chip select pins (CE0 ~ CE1)
>    . single, dual mode.
>
>  * AST2400 New Static Memory Controller (also referred as FMC)
>    . BMC firmware
>    . New register set
>    . 5 chip select pins (CE0 =E2=88=BC CE4)
>    . supports NOR flash, NAND flash and SPI flash memory.
>    . single, dual and quad mode.
>
> Each controller has a memory range on which flash devices contents are
> mapped. Each device is assigned a window that can be changed at bootime
> with the Segment Address Registers.
>
> Each SPI flash device can then be accessed in two modes: Command and
> User. When in User mode, SPI transfers are initiated with accesses to
> the memory segment of a device. When in Command mode, memory
> operations on the memory segment of a device generate SPI commands
> automatically using a Control Register for the settings.
>
> This initial patch adds support for User mode. Command mode needs a littl=
e
> more work to check that the memory window on the AHB bus fits the device
> size. It will come later when support for direct mapping is added.
>
> Single and dual mode RX transfers are supported. Other types than SPI
> are not supported.
>
> Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
