Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FE33A087C
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Jun 2021 02:43:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G07cp6dbhz305v
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Jun 2021 10:43:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=IDsjMEod;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=wNutnjep;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=IDsjMEod; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=wNutnjep; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G07ck528hz2yWx
 for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Jun 2021 10:43:02 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 565095804F7;
 Tue,  8 Jun 2021 20:42:58 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Tue, 08 Jun 2021 20:42:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=w3DCX2yd+9lMXdmKvG11WHVe5Bs0SHd
 AIYy275ZguRM=; b=IDsjMEodHPa2wMYM7CMsUMgF6xDFVbZOLqxw5meGMciUnvg
 h+jRh3nl2Kzg8EwXVFZFenFVXif+GRYCcz1JaTuto4BOeBFaFCr5w1fQsC1c+rkX
 VQLleGkqdEjvq0E0CFZ9c9jXlcA5eNd9fenRuCIICfjfHeYD3qoYQz64IESTU0Dq
 B2rh5TDfgEzXM/s1lCVfT+samRb+F797YdbUs+7voMDpfWa+scgsXwO8aSpBwvS/
 lu7ev/Dhb241Zj1CeY9An6Ma/0sbfbcili5O7YofvfOH1L3eBgE7a0S6/kF7C6lq
 yIAxOCnU4/zg/QFZZtv3phOKE6gMS/t7dHnZ/IA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=w3DCX2
 yd+9lMXdmKvG11WHVe5Bs0SHdAIYy275ZguRM=; b=wNutnjepAfTBWCXOJb5j9m
 T2AVlQTfoC1o1oCUt7bAeSuijkh32BdZn5O/xy4LyxHpDd7qqq8xAghiHPR9mA0a
 JRLQypRC3uaw+zOgYaFzMbaVZ0EB9nim26QeIw5Le7A2yNcKqfP+xt/SQoYR4PsU
 4x/WMVx12rD3KJi9IjA7cGFvAvFROxexpzBFgxlTw3HqRxnKY3IpolhqkOf6SANx
 3stDrnbYS2KLZNVx4jTzFrS9J7MCcZ63ZSUryAjarl6UfgF5KYFlZQZNLCS2WAHK
 7NKXmgK2Pcq7PIq4R/NqSncI8/ag5vkimnGSLripIYF22m2ko4zExcKQY95wXVLA
 ==
X-ME-Sender: <xms:jg7AYI3c7fgr3BglBoaPJhpk3ooHQEN3Z1ko8X6FuwiLltdxVBzRzw>
 <xme:jg7AYDGyX5E2ClqDKHxC6BYGBbLuTk51vfgIIuNlt_V516fcZot3J4BFOVZG5kqGL
 1gPDAXiJxicHih9bQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedutddgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefguedvfedvgffgudehjeegudefvedufefgveefudetffdvfeeigffg
 jedvkeetnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhi
 ugdrrghu
X-ME-Proxy: <xmx:jg7AYA49Y5r06jf_m8ZNIoL-tP_3Erb_cG2CUoE60WcJorc1LAUi6Q>
 <xmx:jg7AYB3_5pbZQIrKaWyEH77FStCwdK367V5_-08Y1HR4Pt7W_cK5FQ>
 <xmx:jg7AYLFxjlpHk4GQlRmu3YFuV_An4k8e-tXTqcNNiEBE3USgw9ETOg>
 <xmx:kg7AYD_SqI8BUDPm8IerBJWGhc6ilZ_VsKJQlDkAtEd5h2zEogRdQg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 95A87AC0062; Tue,  8 Jun 2021 20:42:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-519-g27a961944e-fm-20210531.001-g27a96194
Mime-Version: 1.0
Message-Id: <1f34af33-0905-480e-8a55-e5e34d66216f@www.fastmail.com>
In-Reply-To: <20210608102547.4880-2-steven_lee@aspeedtech.com>
References: <20210608102547.4880-1-steven_lee@aspeedtech.com>
 <20210608102547.4880-2-steven_lee@aspeedtech.com>
Date: Wed, 09 Jun 2021 10:12:33 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Steven Lee" <steven_lee@aspeedtech.com>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
 "Rob Herring" <robh+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 "open list" <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?Q?Re:_[PATCH_v5_01/10]_dt-bindings:_aspeed-sgpio:_Convert_txt_bi?=
 =?UTF-8?Q?ndings_to_yaml.?=
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
Cc: Hongwei Zhang <Hongweiz@ami.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Tue, 8 Jun 2021, at 19:55, Steven Lee wrote:
> sgpio-aspeed bindings should be converted to yaml format.
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> ---
>  .../bindings/gpio/aspeed,sgpio.yaml           | 75 +++++++++++++++++++
>  .../devicetree/bindings/gpio/sgpio-aspeed.txt | 46 ------------
>  2 files changed, 75 insertions(+), 46 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
>  delete mode 100644 Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> 
> diff --git a/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml 
> b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
> new file mode 100644
> index 000000000000..b2ae211411ff
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/aspeed,sgpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Aspeed SGPIO controller
> +
> +maintainers:
> +  - Andrew Jeffery <andrew@aj.id.au>
> +
> +description:
> +  This SGPIO controller is for ASPEED AST2500 SoC, it supports up to 
> 80 full
> +  featured Serial GPIOs. Each of the Serial GPIO pins can be 
> programmed to
> +  support the following options
> +  - Support interrupt option for each input port and various interrupt
> +    sensitivity option (level-high, level-low, edge-high, edge-low)
> +  - Support reset tolerance option for each output port
> +  - Directly connected to APB bus and its shift clock is from APB bus 
> clock
> +    divided by a programmable value.
> +  - Co-work with external signal-chained TTL components 
> (74LV165/74LV595)
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2400-sgpio
> +      - aspeed,ast2500-sgpio
> +
> +  reg:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  clocks:
> +    maxItems: 1
> +
> +  ngpios: true
> +
> +  bus-frequency: true

I'm not familiar enough with dt-schema to know that this does what we need, so deferring to Rob.

Looks good otherwise.

Andrew
