Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B1B517CDA
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 May 2022 07:38:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kspfj2WLpz3bd8
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 May 2022 15:38:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=JkIqDFEH;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f32;
 helo=mail-qv1-xf32.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=JkIqDFEH; dkim-atps=neutral
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kspfc3RMfz2yNn
 for <linux-aspeed@lists.ozlabs.org>; Tue,  3 May 2022 15:38:46 +1000 (AEST)
Received: by mail-qv1-xf32.google.com with SMTP id e17so11559270qvj.11
 for <linux-aspeed@lists.ozlabs.org>; Mon, 02 May 2022 22:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sYbCI8Jfawj/+cLFvyH4OtiicE1oM1tlrNoa7PX+yxo=;
 b=JkIqDFEHCLdnyJV6h9j+AROfvdE2y5cJfpVVqKaY51bFHmmV4uVUp5a1kh0CogbCeV
 Eosl8vMySFLmcueevULz14R4Pwvjf59nAIyo7xpAGSZIBz/ZU9qD2hCiS8ktRMijULqA
 INooKVrx/6uPVCo8YdNYHNg/30GsgIQBwPMXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sYbCI8Jfawj/+cLFvyH4OtiicE1oM1tlrNoa7PX+yxo=;
 b=ikrMw7GPWooafk606A9MHVMhqloUpU9LscnIJyFgTBLdAiaEfQtJS3xdUTnluiGExS
 wHwOmYsHMNBZ0WFfno8/P3VO6koQlf8kiXeVxooGvXPPPO7AqObRqUM826mTACxj0pnv
 nMOXPEPFpq3YECWWCJp+rbdFWKNuBhZHftkvZf+SHW4lSVPDu3w7Rvf0g3oX5PHV5PYf
 +aMiIokS74nVuZ7yfmXeUq/ygPMWGynEIbnjQkiKD0jA1wr/g8k47FDvjnHDm4igEGD/
 5RZ4F6jJK+Y1FtNzdOxh5FUR0Ev0rT5bt13SwgvV2JTifYEifyN35UA2OyPvFgGcEN2/
 ysmQ==
X-Gm-Message-State: AOAM531zrIBYAeVOPAdCSXOw6TY7fLKSuvFVIuxY0VoxFHgNTVxRxsMH
 7z3YFbmD0O3OfNWO6vUPxx7gNmoTSBARB3hRx1Y=
X-Google-Smtp-Source: ABdhPJzXKglgbfvc/y22kbBrPqAYKdyIcG7c6Vcs397WzlemAGmThQTODYEvOIFE9BAsACLJuFhVRSrhAEFAwm+yhpU=
X-Received: by 2002:a05:6214:624:b0:441:84f3:24e3 with SMTP id
 a4-20020a056214062400b0044184f324e3mr12263372qvx.27.1651556321359; Mon, 02
 May 2022 22:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220502081341.203369-1-clg@kaod.org>
In-Reply-To: <20220502081341.203369-1-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 3 May 2022 05:38:29 +0000
Message-ID: <CACPK8XfxsXgVHKY3tqgs=-ZX95jkpjcG_4HE=igG4QBULd0vRA@mail.gmail.com>
Subject: Re: [PATCH v5 00/11] spi: spi-mem: Convert Aspeed SMC driver to
 spi-mem
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

On Mon, 2 May 2022 at 08:13, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> This series adds a new SPI driver using the spi-mem interface for the
> Aspeed static memory controllers of the AST2600, AST2500 and AST2400
> SoCs.

I put this into the OpenBMC yocto tree, which pushes it through CI and
does a qemu boot on Romulus. I also tested on Palmetto in qemu and the
AST2600A3 EVB.

 https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/51551

It looks good.

Tested-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel
