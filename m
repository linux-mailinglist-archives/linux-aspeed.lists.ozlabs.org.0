Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4A0D8038
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Oct 2019 21:26:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46t5513YM3zDr0r
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Oct 2019 06:26:13 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.210.65; helo=mail-ot1-f65.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46t54v0vWqzDqBr
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Oct 2019 06:26:06 +1100 (AEDT)
Received: by mail-ot1-f65.google.com with SMTP id 41so17980966oti.12
 for <linux-aspeed@lists.ozlabs.org>; Tue, 15 Oct 2019 12:26:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=bMN7HsXxW10Z/AXt6bsUTKC+n3cllPgUCAnFiYh55f4=;
 b=B7+u+fjeuFvXiBrMEfXb/ycPEkKxxu1wMYy6wdquKAb0jTpQdD+xWkGWCwl4TGlB2/
 JVL+6QNhIqMASdGjro7Fek4Z/2ZaqVbsNwYbQ6bf0Ok/Y0hnDKyFwBmm7jQ0pRHej+OQ
 ejAFzm22oUhX5F8OZLhh9/Dw36Wuc0SY9/FiHu84lDY//uNFyCBuDbsdWgv+4RJSkHjs
 D6ebkt01qzTOwUbQ56W4iY7P3sEZC17RBR4C8ZSLMhcFgMkkcFvaWGqYVD+ANfhZdLB6
 Ym2sikLgMA8IM1ac7rgQTeyh9sIYUCKAs/l6tAUXpUGiudLZOzIS3vBBjLIl8/IfWfpG
 sQQg==
X-Gm-Message-State: APjAAAUY39C5SwVstVKl5FN3XDcidY6dF6ROUJFxKGQ0i2CeQf/QFhbd
 dF4SNZGCL04Qq1FBoN5K6Q==
X-Google-Smtp-Source: APXvYqwlp5+8r2qKOXYzE3/Ug0686nB0PMhOBNsopPiUJRsFnUZMpsYTSVwqINAlrTQju3xmJY1Q9g==
X-Received: by 2002:a9d:66c5:: with SMTP id t5mr30074981otm.225.1571167563870; 
 Tue, 15 Oct 2019 12:26:03 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id i2sm7329212otf.19.2019.10.15.12.26.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 12:26:02 -0700 (PDT)
Date: Tue, 15 Oct 2019 14:26:02 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 11/16] dt-bindings: mtd: aspeed-smc: Add new comptatible
 for  AST2600
Message-ID: <20191015192602.GA2299@bogus>
References: <20191004115919.20788-1-clg@kaod.org>
 <20191004115919.20788-12-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191004115919.20788-12-clg@kaod.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-aspeed@lists.ozlabs.org,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri,  4 Oct 2019 13:59:14 +0200, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= wrote:
> The SMC controllers on the AST2600 SoC are very similar to the the
> AST2500. The SoC has one Firmware Memory Controller and two SPI flash
> memory controllers.
> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  Documentation/devicetree/bindings/mtd/aspeed-smc.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
