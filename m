Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA7F8E47F
	for <lists+linux-aspeed@lfdr.de>; Thu, 15 Aug 2019 07:38:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468Fbm4gd4zDr55
	for <lists+linux-aspeed@lfdr.de>; Thu, 15 Aug 2019 15:38:12 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.230; helo=new4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="f7SS+Nng"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="zt8Uh/pJ"; dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468FbX3XrszDqjY
 for <linux-aspeed@lists.ozlabs.org>; Thu, 15 Aug 2019 15:37:59 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id C34372DFF;
 Thu, 15 Aug 2019 01:37:55 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 15 Aug 2019 01:37:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=5zsQDb8xUp+LgDRGio1PmqyOCn5+LVk
 X68USrKI2P1I=; b=f7SS+NngSiN2MY8ZVfjtKzTX/WdFhVuem59D8+tBGrODWzK
 0XFfg8rSDDfWrYCDmCkuD0OXzcPTx3rKyBFaEN9YOElltnhgGSO19zx93gUWQ69a
 /kvo75Le7nnshw7K6OUaqswfHGj+SNif2UBjMcMXDGpUdMBvaZISOHEVfthbIbrJ
 iuwnwT+0TG9M2JXResQJ39I2NRkU5JNdn0KLZDWR9EEIBq5fGGjtLv8MYJKW1+tQ
 X4l0/oVjNitjJBs+tGcLvTNwUrL7Yot4lSDkx2it4crriCORiMG2u/HCIxi1ICwn
 ztSUEXv5Mvf9c2n4EimmDAnTzVjqvh1H5J+RCvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=5zsQDb
 8xUp+LgDRGio1PmqyOCn5+LVkX68USrKI2P1I=; b=zt8Uh/pJpoj61NZsNQnvEg
 MlsVP6A4kxWb/LIsMK0edIwb5QODzedzq2O+voUTByOjTGmhnsNOnqSAcO/iTLlx
 BlomLDsYocRxwDYdFsU7fujadg5Ed9havpyiG8NwYhyvokCtTMpWwvumY45wiCpX
 ByokDpteFFZmT+aNFBP0iO8FzJYV9lzOqyGUVmNDaDuBQInukP0KKQTgaxclTBSA
 am0DfrALmhc8uyU2rAbhh+urmh0Te2sup+78O9nFIFvz81KYDB2rP39dRrF92rei
 MzLb+uSC1/p4PN+Hzp/mehtC1TTscZSoxovVqN6fy2cn4i9yIWGS8h82xmxyhWAg
 ==
X-ME-Sender: <xms:su9UXUAW21DLb-w8jMydQFPfwgNAwS9zj8W8LDYH2d9pWPk6GN4i8A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudeftddgieekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:su9UXaDeB60dyQ98Gp1LGhakQt2wYK3LrSfhMoK8X4W7KqX83dEG8w>
 <xmx:su9UXQEx739iNbtcoK-xFIbATPfw7RbYxP9Lwd29yFrpiqZ_rwif4g>
 <xmx:su9UXdlfxTeYvBADe5OwKlLOTp7gzbU4vMyyd_lyHlYey_6iArZDOQ>
 <xmx:s-9UXc0H-Dg-LhOuQV81L2q2oCwrlLKoGs-9EEAB1vUYeQ98OIbogA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 52037E00A4; Thu, 15 Aug 2019 01:37:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-869-g2d94aad-fmstable-20190814v1
Mime-Version: 1.0
Message-Id: <6c94aada-9c4a-4f55-9a43-349282ad12af@www.fastmail.com>
In-Reply-To: <CACPK8Xe6Zp1uOqEffEc0b6oGa7portEAifGPRqb876HmA+oZeg@mail.gmail.com>
References: <20190807003629.2974-1-andrew@aj.id.au>
 <20190807003629.2974-2-andrew@aj.id.au>
 <CACPK8Xe6Zp1uOqEffEc0b6oGa7portEAifGPRqb876HmA+oZeg@mail.gmail.com>
Date: Thu, 15 Aug 2019 15:08:24 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH v5 1/2] dt-bindings: mmc: Document Aspeed SD controller
Content-Type: text/plain
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Ryan Chen <ryanchen.aspeed@gmail.com>, linux-mmc <linux-mmc@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Thu, 15 Aug 2019, at 15:06, Joel Stanley wrote:
> On Wed, 7 Aug 2019 at 00:38, Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> > The ASPEED SD/SDIO/MMC controller exposes two slots implementing the
> > SDIO Host Specification v2.00, with 1 or 4 bit data buses, or an 8 bit
> > data bus if only a single slot is enabled.
> >
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
> Two minor comments below.
> 
> > +++ b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> > @@ -0,0 +1,105 @@
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> 
> No "Copyright IBM" ?

I'm going rogue.

That reminds me I should chase up where we got to with the binding
licensing.

> 
> > +%YAML 1.2
> > +---
> 
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/aspeed-clock.h>
> > +    sdc@1e740000 {
> > +            compatible = "aspeed,ast2500-sd-controller";
> > +            reg = <0x1e740000 0x100>;
> > +            #address-cells = <1>;
> > +            #size-cells = <1>;
> > +            ranges = <0 0x1e740000 0x10000>;
> 
> According to the datasheet this could be 0x20000. It does not matter
> though, as there's nothing in it past 0x300.

Good catch.

Andrew
