Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 043F1518B94
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 May 2022 19:55:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kt70L6Hvfz3bky
	for <lists+linux-aspeed@lfdr.de>; Wed,  4 May 2022 03:55:14 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.42; helo=mail-ot1-f42.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kt70H2tf1z3bbn
 for <linux-aspeed@lists.ozlabs.org>; Wed,  4 May 2022 03:55:09 +1000 (AEST)
Received: by mail-ot1-f42.google.com with SMTP id
 c5-20020a9d75c5000000b00605ff3b9997so6933853otl.0
 for <linux-aspeed@lists.ozlabs.org>; Tue, 03 May 2022 10:55:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ZZo2FBQdHNqH/5Ul07nNend7TJWI/BleYJWuwRpwI2E=;
 b=lMNZZ+OmsbFqkVc/9yFR1xllko5QDUh3QMUDuXEot7Z5J6Z6XqR0Ih2ByoF+nfjGbC
 4vOaLridGhFmX2LqqKWZO4G6FDf98nDBTzawbNBz0K9zumRr6/KvDLBBKIBH4Js/CrcB
 038AMPdjx02gPCLkbYRlxzTNDogICSlfcSSIs8zhhy59CC+TQVwbm5ylH0VScH4HLGqR
 7lUl8uP6/+Ox+dCDetv3wnmjAU5PVYjtmo73eoRSyfhpYcxwpJVgT+TssdN5j9U1i2T6
 2xHJ6wxkrYNQVH9RDui8C8CYhJu5Zh5xdfcWnb6g7ub3Zp0xvufvdca+trjJcFnUJ87I
 /1pQ==
X-Gm-Message-State: AOAM531J/7TGmjwNhGbySP+xZ+XbEwb6dYIQXoz96IvdzHCJ3xm6OkCb
 Jzl9arrwdN2Vb+oV70haWQ==
X-Google-Smtp-Source: ABdhPJwdaRnHFUgHPlJemaTsR7uzxfoyu0Qkat2ke0I3c1OwbntDBxhxcWdOIlhaLbPBYWN8g4E+xg==
X-Received: by 2002:a9d:6c93:0:b0:605:d7a8:7930 with SMTP id
 c19-20020a9d6c93000000b00605d7a87930mr6294448otr.254.1651600505622; 
 Tue, 03 May 2022 10:55:05 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056870e50300b000e686d13884sm130797oag.30.2022.05.03.10.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 10:55:05 -0700 (PDT)
Received: (nullmailer pid 3955241 invoked by uid 1000);
 Tue, 03 May 2022 17:55:04 -0000
Date: Tue, 3 May 2022 12:55:04 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v6 03/11] spi: spi-mem: Convert Aspeed SMC driver to
 spi-mem
Message-ID: <YnFseFBfe5eaIqg0@robh.at.kernel.org>
References: <20220503060634.122722-1-clg@kaod.org>
 <20220503060634.122722-4-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220503060634.122722-4-clg@kaod.org>
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
Cc: devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed@lists.ozlabs.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Pratyush Yadav <p.yadav@ti.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, May 03, 2022 at 08:06:26AM +0200, Cédric Le Goater wrote:
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
>    . 5 chip select pins (CE0 ∼ CE4)
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
> This initial patch adds support for User mode. Command mode needs a little
> more work to check that the memory window on the AHB bus fits the device
> size. It will come later when support for direct mapping is added.
> 
> Single and dual mode RX transfers are supported. Other types than SPI
> are not supported.
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Tested-by: Joel Stanley <joel@jms.id.au>
> Tested-by: Tao Ren <rentao.bupt@gmail.com>
> Tested-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
> Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  drivers/mtd/spi-nor/controllers/aspeed-smc.c  | 921 ------------------
>  drivers/spi/spi-aspeed-smc.c                  | 717 ++++++++++++++
>  .../devicetree/bindings/mtd/aspeed-smc.txt    |  51 -

This belongs with the binding patch. But then it is converting rather 
than adding a binding. You should be converting the binding and then 
adding to it (like adding 2600 support).

>  MAINTAINERS                                   |   1 +
>  drivers/mtd/spi-nor/controllers/Kconfig       |  10 -
>  drivers/mtd/spi-nor/controllers/Makefile      |   1 -
>  drivers/spi/Kconfig                           |  11 +
>  drivers/spi/Makefile                          |   1 +
>  8 files changed, 730 insertions(+), 983 deletions(-)
>  delete mode 100644 drivers/mtd/spi-nor/controllers/aspeed-smc.c
>  create mode 100644 drivers/spi/spi-aspeed-smc.c
>  delete mode 100644 Documentation/devicetree/bindings/mtd/aspeed-smc.txt
