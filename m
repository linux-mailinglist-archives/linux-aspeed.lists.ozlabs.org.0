Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBEA3A37D9
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Jun 2021 01:28:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G1KsL477nz3bnW
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Jun 2021 09:28:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=I1WmP4JU;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=EnisUU2J;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=I1WmP4JU; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=EnisUU2J; 
 dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G1KsC62hfz308N
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Jun 2021 09:27:59 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2ACB45806C7;
 Thu, 10 Jun 2021 19:27:56 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 10 Jun 2021 19:27:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=cFF/8oG3M1dicXtAwlQThY8CTKYnxK4
 oe2z09qMEzC0=; b=I1WmP4JUnIzWVed7DF0ufUJB30mobzScfiDXaiW34NhRCDN
 KZkL+KxdedDIbprjITw2lA9ngO8scHP7Pgvf0AL4jAMDSROXYd3xO1PpaPOsmgfu
 OkYjgL5dnVjMJxyVV9eG+0xcQC/kEWxHg0NM/bskbIZDxD5dvtod48L1nENhQCp9
 s4HA74Ts5s+magBEjvWyW2ABZSH1zpiOXSxWI0TOXMg5CgHh1JUYZIFA01y/tr7K
 lkj8/0TyJlspWfYEmCsMtK+12VR9gK7pt0k7nZB7n2BOGQoSwWHcv1LiFj+bBbgi
 ShShN3zFatpYmxDSf5NqkKuqjjzsVYn1xCcVpmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=cFF/8o
 G3M1dicXtAwlQThY8CTKYnxK4oe2z09qMEzC0=; b=EnisUU2J9adx4JKrNozsKF
 o+FxpHPpBKo3EOYlitCFjioTJjA9LlKAu07URV9pyyT9/H8058gvbhAHbyumqDwR
 +jYaZr+QxINa4Iq1FNPF+ITq9Ryj56bneQ2DvVoZQF0UK5q+sKktQmk2kN0TE0lZ
 7bCIZnqXmjUk8Rp9qzyh8IAolLXofilztZhYFmEK9vgg7hMfw4wTN/rpGaGaw1iG
 N33f0CW1yMZtOcv/FNOO96luD9H80CLB91So4H3w457s0HVxGC+Q9UEelI+Ru7I5
 6X+7jDJr74P6ytX0dtIc60CXXC8SmirU4BHI9ymrn5JoJbATjf3BCiD0QCn0Yjjw
 ==
X-ME-Sender: <xms:-p_CYH0gycjPd9wXY7FtXAecNkq9NJWOgOlYAEiVxGfkY2RXoVGrnA>
 <xme:-p_CYGE_BdJYPhy7RaPGRPn97NtXyX5JfRi_RsHVObE-o92l1j-ne6PeyFj0EPNLd
 9FlkJgszfmGJbpraA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeduiedgvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepudehtddtleektedvfeeitdeljeekveelkeegvdfhtdejhefgfedtfedv
 jeejledtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:-p_CYH56-aVJHv5U-UOQJwdtkZoaY4UlYTXTZpKmtuw5HkzlRZ0CQw>
 <xmx:-p_CYM3HUUSylPIDcaK_I4awiiUE3joXqxjLdTNH3LhF-4yO9XDaNw>
 <xmx:-p_CYKEElMOBf29gl-rPh26uz3wSodiotYvxCtqHKwVWqSvgbLVUMg>
 <xmx:_J_CYC8B-dmfCOHgLBquuxksa1axY5h4MVpVHYrGLX-kfp879vBYFQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 09798A0007A; Thu, 10 Jun 2021 19:27:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-519-g27a961944e-fm-20210531.001-g27a96194
Mime-Version: 1.0
Message-Id: <f639f1bb-fe53-4c15-a6dd-91b45ea7eef1@www.fastmail.com>
In-Reply-To: <20210610162320.GA1910317@robh.at.kernel.org>
References: <20210608102547.4880-1-steven_lee@aspeedtech.com>
 <20210608102547.4880-3-steven_lee@aspeedtech.com>
 <20210610162320.GA1910317@robh.at.kernel.org>
Date: Fri, 11 Jun 2021 08:57:12 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Rob Herring" <robh@kernel.org>, "Steven Lee" <steven_lee@aspeedtech.com>
Subject: =?UTF-8?Q?Re:_[PATCH_v5_02/10]_dt-bindings:_aspeed-sgpio:_Add_ast2600_sg?=
 =?UTF-8?Q?pio_compatibles.?=
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Hongwei Zhang <Hongweiz@ami.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Fri, 11 Jun 2021, at 01:53, Rob Herring wrote:
> On Tue, Jun 08, 2021 at 06:25:37PM +0800, Steven Lee wrote:
> > AST2600 SoC has 2 SGPIO master interfaces one with 128 pins another one
> > with 80 pins. Add ast2600-sgpiom0-80 and ast2600-sgpiom-128 compatibles
> > and update descriptions to introduce the max number of available gpio
> > pins that AST2600 supported.
> > 
> > Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> > Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >  Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
> > index b2ae211411ff..0e42eded3c1e 100644
> > --- a/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
> > +++ b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
> > @@ -10,9 +10,10 @@ maintainers:
> >    - Andrew Jeffery <andrew@aj.id.au>
> >  
> >  description:
> > -  This SGPIO controller is for ASPEED AST2500 SoC, it supports up to 80 full
> > -  featured Serial GPIOs. Each of the Serial GPIO pins can be programmed to
> > -  support the following options
> > +  This SGPIO controller is for ASPEED AST2400, AST2500 and AST2600 SoC,
> > +  AST2600 have two sgpio master one with 128 pins another one with 80 pins,
> > +  AST2500/AST2400 have one sgpio master with 80 pins. Each of the Serial
> > +  GPIO pins can be programmed to support the following options
> >    - Support interrupt option for each input port and various interrupt
> >      sensitivity option (level-high, level-low, edge-high, edge-low)
> >    - Support reset tolerance option for each output port
> > @@ -25,6 +26,8 @@ properties:
> >      enum:
> >        - aspeed,ast2400-sgpio
> >        - aspeed,ast2500-sgpio
> > +      - aspeed,ast2600-sgpiom-80
> > +      - aspeed,ast2600-sgpiom-128
> 
> If the number of GPIOs is the only difference, then I don't think you 
> should get rid of ngpios. It's one thing if it varies from one SoC to 
> the next, but if something is per instance we should have a property.
> 

There are two issues:

1. The maximum number of GPIOs supported by the controller
2. The maximum number of GPIOs supported by the platform

These are different because of what the controller does - here's some previous discussion on the topic:

https://lore.kernel.org/linux-gpio/f2875111-9ba9-43b7-b2a4-d00c8725f5a0@www.fastmail.com/

We've used ngpios to describe 2; this decision was made prior to the 2600 design - the SGPIO controller for both the 2400 and 2500 supported a maximum of 80 GPIOs. With the 2600 we have to differentiate between the two SGPIO controllers because they support a different maximum number of GPIOs. The proposed approach of different compatibles keeps the behaviour of ngpios the same across all controller implementations.

Cheers,

Andrew
