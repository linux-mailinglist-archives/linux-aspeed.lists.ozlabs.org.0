Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A436113B05
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Dec 2019 06:04:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47T3YT58kfzDqY6
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Dec 2019 16:04:45 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="JifFXqXD"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="J5C25oVY"; dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47T3YH5PjRzDqXL
 for <linux-aspeed@lists.ozlabs.org>; Thu,  5 Dec 2019 16:04:34 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id C47EA6DB2;
 Thu,  5 Dec 2019 00:04:30 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 05 Dec 2019 00:04:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=EbdPnIUWiOwQ643br872/JZSTvD7a10
 RSKBmMulJSN8=; b=JifFXqXDmEe7Mvb1z3kyfynBxgaVc1qNJQasvCg1ibFlCOy
 VE7jmuIowcEXu3ZR/MojGGuHJt4fplfhdr+MOJ9sKG1TMirubBwYNmHskB118/x3
 7AFKTtSQOVPVUtTrOvhfjHrG6xFKmNpxjkQz33MzREsW1IRWkFrkW7aSn4wTUXjV
 19Z6BYa9OrxuzlHn+v3dbu7k0D2mgLUwwiMr7TewBsSKlQazVusvi7UCG2SY4lBK
 2+9z5L/6wSRriBHVburZ3BI4OXEU+W2hsi4FtqokaQF99FR4gwVGzldax0YRoxxD
 bMbMPZ91fU3ZPjAC3q6wmSO+f/2qmgk5BG19WzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=EbdPnI
 UWiOwQ643br872/JZSTvD7a10RSKBmMulJSN8=; b=J5C25oVYL4Hrmcp/xn9EpQ
 Suiiuf+l37jl3j4UGAyk4y/IX0UqjmaaeFLw+mWvgl2dwvZD108oxUcMNmVtCZli
 4G2SRVqjWUuWHB+3fqsravRPfIjrvh+Dq13wQRBdCHAyaQhlzJXkFnM01uYeWz/9
 6/M/+zTbN/S3WpsWcrEJ34M5ATPjLMXxlkILwceIwzrym0pbDdkAQhFIFspMLEPI
 DDAsSGCQdVBEKngVbpncS1wKasq5QEKcF6qMUX70NSQRNjwGZkdSkOe1QBUT2LDj
 mGp3deJ8a0LboMnXCgt1EIal7nW0H2YIvyvZSF1MJytRbzKSjaHbXOK1DLwUOFTg
 ==
X-ME-Sender: <xms:3I_oXV4-n2xj8BTQ6IZdHWn4_HoQE0gb58DZXVp9DAFeo5cEODADPg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudektddgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:3I_oXXL3ovWDg99Z4a_d3T4syyxV6SnZiclv0munN8sO7ez1w3by_Q>
 <xmx:3I_oXXe0drsxa0FcWgBtiEdXvXTtkDc4PQRt6RUyvMAcsV2rmyrxqg>
 <xmx:3I_oXSfKYBb7NbuitaJv2XGY46yQ4yPYWWyRI8hSb2mQohDCqu4eLA>
 <xmx:3o_oXVQr1kEaHUjP1AuwcUC_0MQAGlHW2-QA2434pVkhZKpJFKw4Rg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 9CFE5E00A2; Thu,  5 Dec 2019 00:04:28 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-612-g13027cc-fmstable-20191203v1
Mime-Version: 1.0
Message-Id: <25487d30-d748-445b-aad2-03c4d9241631@www.fastmail.com>
In-Reply-To: <CAL_JsqJ8p-zs2F-mXkO_egoBtZ8WymM4O-2AaDJMZYeCFS3sLg@mail.gmail.com>
References: <cover.08e3a6c95159f017b753d0f240086d1a7923758b.1575369656.git-series.andrew@aj.id.au>
 <141f068d10b94413a6d0ca73fe07f8e961380e7b.1575369656.git-series.andrew@aj.id.au>
 <CAL_JsqJ8p-zs2F-mXkO_egoBtZ8WymM4O-2AaDJMZYeCFS3sLg@mail.gmail.com>
Date: Thu, 05 Dec 2019 15:36:04 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Rob Herring" <robh+dt@kernel.org>
Subject: =?UTF-8?Q?Re:_[PATCH_05/14]_ARM:_dts:_aspeed-g5:_Fix_aspeed,
 external-nod?= =?UTF-8?Q?es_description?=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Xo Wang <xow@google.com>, linux-aspeed@lists.ozlabs.org,
 Ken Chen <chen.kenyy@inventec.com>, Adriana Kobylak <anoo@us.ibm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "\(Exiting\) Yao Yuan" <yao.yuan@linaro.org>,
 =?UTF-8?Q?YangBrianC=2EW_=E6=A5=8A=E5=98=89=E5=81=89_TAO?=
 <yang.brianc.w@inventec.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Wed, 4 Dec 2019, at 01:13, Rob Herring wrote:
> On Tue, Dec 3, 2019 at 6:03 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> > The existing approach lead to an error from the dtbs_check:
> >
> >     pinctrl: aspeed,external-nodes: [[8, 9]] is too short
> 
> This one where we have list of phandles is fixed in dtc. I need to
> update the kernel's copy.

Ah, cool.

> 
> > Cc: Adriana Kobylak <anoo@us.ibm.com>
> > Cc: Brian Yang <yang.brianc.w@inventec.com>
> > Cc: Joel Stanley <joel@jms.id.au>
> > Cc: John Wang <wangzqbj@inspur.com>
> > Cc: Ken Chen <chen.kenyy@inventec.com>
> > Cc: Tao Ren <taoren@fb.com>
> > Cc: Xo Wang <xow@google.com>
> > Cc: Yuan Yao <yao.yuan@linaro.org>
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > Reviewed-by: Joel Stanley <joel@jms.id.au>
> > ---
> >  arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts     |  4 +----
> >  arch/arm/boot/dts/aspeed-bmc-arm-stardragon4800-rep2.dts |  4 +----
> >  arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts         |  9 +++++++--
> >  arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dts           |  4 +----
> >  arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts             |  4 +----
> >  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts             |  4 +----
> >  arch/arm/boot/dts/aspeed-bmc-opp-swift.dts               |  4 +----
> >  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts         |  4 +----
> >  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts               |  2 +--
> >  arch/arm/boot/dts/aspeed-g5.dtsi                         |  3 +--
> >  10 files changed, 8 insertions(+), 34 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts b/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts
> > index c2ece0b91885..de9612e49c69 100644
> > --- a/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts
> > +++ b/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts
> > @@ -211,10 +211,6 @@
> >         status = "okay";
> >  };
> >
> > -&pinctrl {
> > -       aspeed,external-nodes = <&gfx &lhc>;
> > -};
> > -
> >  &gpio {
> >         pin_gpio_c7 {
> >                 gpio-hog;
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-arm-stardragon4800-rep2.dts b/arch/arm/boot/dts/aspeed-bmc-arm-stardragon4800-rep2.dts
> > index 2c29ac037d32..022d0744d786 100644
> > --- a/arch/arm/boot/dts/aspeed-bmc-arm-stardragon4800-rep2.dts
> > +++ b/arch/arm/boot/dts/aspeed-bmc-arm-stardragon4800-rep2.dts
> > @@ -200,10 +200,6 @@
> >         status = "okay";
> >  };
> >
> > -&pinctrl {
> > -       aspeed,external-nodes = <&gfx &lhc>;
> > -};
> > -
> >  &gpio {
> >         pin_gpio_c7 {
> >                 gpio-hog;
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
> > index c17bb7fce7ff..d69da58476fe 100644
> > --- a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
> > +++ b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
> > @@ -782,8 +782,13 @@
> >         memory-region = <&gfx_memory>;
> >  };
> >
> > -&pinctrl {
> > -       aspeed,external-nodes = <&gfx &lhc>;
> > +&gpio {
> > +       pin_gpio_b7 {
> > +               gpio-hog;
> > +               gpios = <ASPEED_GPIO(B,7) GPIO_ACTIVE_LOW>;
> > +               output-high;
> > +               line-name = "BMC_INIT_OK";
> > +       };
> 
> Seems like an unrelated change?

Yeah, that seems to be a bad rebase conflict resolution.

Thanks,

Andrew
