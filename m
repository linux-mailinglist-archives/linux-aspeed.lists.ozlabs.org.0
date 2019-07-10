Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC9963F25
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Jul 2019 04:16:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45k2qL45R4zDqZW
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Jul 2019 12:16:14 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="N5HOs7+r"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="rFoFNF7V"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45k2qD3B06zDqY5
 for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Jul 2019 12:16:08 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2EC4122460;
 Tue,  9 Jul 2019 22:16:05 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 09 Jul 2019 22:16:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=5bWrIcP8UjAg5UmoomU2W8F9lAlb5kN
 yGswff6nCzsI=; b=N5HOs7+r/2TZvYRABQ4YWWnYO2Ie8R/7nMD6N3kktwfqBsc
 WFBGym4M379zo71+ww9HItVnfeB+UfwDN0ImjXLJn0ObHQhKAMJYelRmTpiq8Yew
 +b/fMAxaPcLLvHZr8zmf90JfWqg+THvTNaTR+2bzgFJ8YI7+XiF3wJ7QTeRg64ky
 jFeGA+wL7FmPh4Om49B1wfHybk7FYpKEE8tcbBvCa3FLOqLRBHlQgbrOcl1VChhd
 fTtr5u7kd6D5v3wj6lLdDNGicPCPYkIIagN2IWFZxM2XhF1B4xZ5vXlIlIp9OI1i
 1QT0G+pmCzKmK50fMWD0rLVk2Y+1IEDCZ3d2IvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=5bWrIc
 P8UjAg5UmoomU2W8F9lAlb5kNyGswff6nCzsI=; b=rFoFNF7VTheq4MajAP4eWv
 tCsH1eTUG0hw6Jrj4alZRgVhsi9z+1yo5Ki4CcyHJeTQrUKgA0eBjlBT4cpB+zbh
 YwnEMC9DNOCYG9yj0wXMcPpNLc61O0XEGuVi4N3pCtoON5S3G535G8rKiDI+ST5x
 JvXYjl0BYv7/OT8u48OCPXIjzRlq1NSXcNYUo0bn9ptWy8Kt+To1Ax4EA9CrCLq/
 USWx/QMWwveWfEX/khKk3vNvAejc6gXrxAoDyvXuQVXgmjeMWOiautovFyB/Gnte
 ce571NETXRQCPiZdoQov0gMqwyvSbnQZvf4MKq8WrZbbW9/yyrHrUmbmJhr6x8Qw
 ==
X-ME-Sender: <xms:ZEolXR3XnW_F9wcBrukA_vPC2dshfB1wGZn2h4ZUZ0bQjppNTjH8wQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrgeehgddtvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:ZEolXS43bZlKOBuVAFi2pePMIKLwiGbiXq37QxMkh0yqvzh_t-HQFA>
 <xmx:ZEolXQKfowdlI6P6qiLUQ9hrUZy1MZCBAAWumnxtXs0luTEi4dUC1Q>
 <xmx:ZEolXeY3Rp21OAB7TFnCNpY1KXNW-ANyIw6U73CgV89AwKq_qGmvuQ>
 <xmx:ZUolXeCjcCokGqAaci2yJaWt4bTUso15OfSVoGw9WKt9nsq8t9lb8Q>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 660EFE0193; Tue,  9 Jul 2019 22:16:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-731-g19d3b16-fmstable-20190627v1
Mime-Version: 1.0
Message-Id: <9c998f5f-42ef-43bd-b024-839ee00126de@www.fastmail.com>
In-Reply-To: <1562184069-22332-1-git-send-email-hongweiz@ami.com>
References: <1562184069-22332-1-git-send-email-hongweiz@ami.com>
Date: Wed, 10 Jul 2019 11:46:09 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Hongwei Zhang" <hongweiz@ami.com>, devicetree@vger.kernel.org,
 "Joel Stanley" <joel@jms.id.au>, "Linus Walleij" <linus.walleij@linaro.org>
Subject: Re: [linux,dev-5.1 v1] dt-bindings: gpio: aspeed: Add SGPIO support
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Thu, 4 Jul 2019, at 05:31, Hongwei Zhang wrote:
> Add bindings to support SGPIO on AST2400 or AST2500.
> 
> Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
> ---
>  .../devicetree/bindings/gpio/sgpio-aspeed.txt      | 36 ++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> 
> diff --git a/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt 
> b/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> new file mode 100644
> index 0000000..f5fc6ef
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> @@ -0,0 +1,36 @@
> +Aspeed SGPIO controller Device Tree Bindings
> +-------------------------------------------
> +
> +Required properties:
> +- compatible		: Either "aspeed,ast2400-sgpio" or "aspeed,ast2500-sgpio"
> +
> +- #gpio-cells 		: Should be two
> +			  - First cell is the GPIO line number
> +			  - Second cell is used to specify optional
> +			    parameters (unused)
> +
> +- reg			: Address and length of the register set for the device
> +- gpio-controller	: Marks the device node as a GPIO controller.
> +- interrupts		: Interrupt specifier (see interrupt bindings for
> +			  details)
> +- interrupt-controller	: Mark the GPIO controller as an 
> interrupt-controller

As this is a serial GPIO controller, a critical piece of configuration
information is how many GPIOs we wish to serialise. This is done
in multiples of 8, up to 80 pins.

The bindings need to describe the "ngpios" property from the
generic GPIO bindings and how this affects the behaviour of
the controller.

We also need to add the "bus-frequency" property here to control
the rate of SGPMCK.

> +
> +Optional properties:
> +
> +- clocks                : A phandle to the clock to use for debounce 
> timings

We need this, but not for the reason specified, and it should be a
required property. We need PCLK (the APB clock) to derive the SGPIO
bus frequency. Despite what the datasheet blurb says, there's no
debounce control for the SGPIO master (this is a copy/paste mistake
from the description of the parallel GPIO master).

> +
> +The sgpio and interrupt properties are further described in their 
> respective
> +bindings documentation:
> +
> +- Documentation/devicetree/bindings/sgpio/gpio.txt
> +- Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
> +
> +  Example:
> +	sgpio@1e780200 {
> +		#gpio-cells = <2>;
> +		compatible = "aspeed,ast2500-sgpio";
> +		gpio-controller;
> +		interrupts = <40>;
> +		reg = <0x1e780200 0x0100>;
> +		interrupt-controller;
> +	};

You'll need to fix up the example after making the changes mentioned
above.

Andrew

> -- 
> 2.7.4
> 
>
