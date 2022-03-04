Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB774CCF68
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Mar 2022 08:58:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K90Zv72Zfz30Hg
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Mar 2022 18:57:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DY4pRiga;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=DY4pRiga; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K90Zq6tCzz2xsc
 for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Mar 2022 18:57:55 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id
 ev16-20020a17090aead000b001bc3835fea8so7360443pjb.0
 for <linux-aspeed@lists.ozlabs.org>; Thu, 03 Mar 2022 23:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=b5JJahJbPSg5PuTw+HrbCqpeRRIjKIFlWzoeU01rKTU=;
 b=DY4pRigayZTq/5rjtD2bjuRYX10CoBCJokMk8l+MP82c190ULI8mFEuacqaLNPAXPD
 g19dQFm0zMVhGKiOsNUY9WJgsc90AJDeeLgEAB5cpBbXEMt6heWnf2gMNbOruuNvF17k
 tXwKAv2lg7nTWKjS4zTcwxp73K/Vbt1z1Gar1VAgmd5Ag6hG/VXjy+dML3IARlgqC2B6
 cGI/FVM8Zba/wkYhqCgAMgtvHPZVw74vWCg4uHmsYZyJaQoCdjis0QGRG8L1OWv6BWMe
 j0uwGPD8wkT83IJ+e+RJJqDuugr6zMJGNHLqy9gJLwrC/UgMPBBtoo1bFd9Z8PQlBUsR
 KiUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=b5JJahJbPSg5PuTw+HrbCqpeRRIjKIFlWzoeU01rKTU=;
 b=22XL3taMV6F86r7rkU3B7dyur4WNXPlPv72gYQR9fWe/ZvaAH+Eq1RxjDPz6LHLuqk
 rZm0UAQ+ViBLT49FwIXTruiFZMGdQue6IAcmFZB9mu6UoLPmdLNma0+KWZXxpxPOBQf7
 Jo1yXnYMn4YP4cIXEJDVlbtqC3jP1d3UbqhCquWsRQoTSaI4p6OhJahmjTLvjak8SMW4
 XAtC+Bi1pxbpKXBjFtjFcrDcTDl3dSMgQigjk68rnJ9kbfG2VOP5TDunes1R4Pa0KXG/
 OcNc8vQYMUedB1ce0kpjsgDbvEXTb9uWn6BCfZKy3C20wOFj3kS4nfF6QYCb6V8JPs9x
 ATOg==
X-Gm-Message-State: AOAM533HpDyK6qBk8PRwZXC0+pfyO53Ka9XyXYA7TbIjTFLB90NJpkDU
 GQZmEOiLzfHZT+sb0PowcGA=
X-Google-Smtp-Source: ABdhPJxvuPW+GS4d0R4GqvhhYiQKHdTrokQg6qHNRrkq/DtJ47Gkay/NlA31+zVRMc3ZiLuUSflWGA==
X-Received: by 2002:a17:90a:4286:b0:1b8:8ba1:730c with SMTP id
 p6-20020a17090a428600b001b88ba1730cmr9376289pjg.181.1646380673939; 
 Thu, 03 Mar 2022 23:57:53 -0800 (PST)
Received: from taoren-fedora-PC23YAB4 ([98.47.137.113])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a056a0002a700b004f357e3e42fsm4936341pfs.36.2022.03.03.23.57.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 23:57:53 -0800 (PST)
Date: Thu, 3 Mar 2022 23:57:50 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v2 00/10] spi: spi-mem: Add driver for Aspeed SMC
 controllers
Message-ID: <YiHGfh/4xZRim6Ka@taoren-fedora-PC23YAB4>
References: <20220302173114.927476-1-clg@kaod.org>
 <CACPK8Xdo=krCNVVs5=jiSnmyiPkNPd9Dxxyx0Tv8eUHKR5J3cQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACPK8Xdo=krCNVVs5=jiSnmyiPkNPd9Dxxyx0Tv8eUHKR5J3cQ@mail.gmail.com>
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
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Pratyush Yadav <p.yadav@ti.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Mar 03, 2022 at 10:01:20AM +0000, Joel Stanley wrote:
> On Wed, 2 Mar 2022 at 17:31, Cédric Le Goater <clg@kaod.org> wrote:
> >
> > Hi,
> >
> > This series adds a new SPI driver using the spi-mem interface for the
> > Aspeed static memory controllers of the AST2600, AST2500 and AST2400
> > SoCs.
> >
> >  * AST2600 Firmware SPI Memory Controller (FMC)
> >  * AST2600 SPI Flash Controller (SPI1 and SPI2)
> 
> I've performed read and write tests on the 2600 controllers, and the
> driver seems stable at the settings you have in the device tree.
> 
> Tested-by: Joel Stanley <joel@jms.id.au>
> 
> I've added Tao and John to cc as they have tested the 2400 and 2500,
> and I'm sure will be able to provide some Tested-by.
> 
> Cheers,
> 
> Joel

I've tested the patch series on ast2400 (wedge100) and ast2500 (cmm) by
reading/writing FMC flash0 and flash1 for several times, and no issues
observed so far.

Tested-by: Tao Ren <rentao.bupt@gmail.com>


Cheers,

Tao
