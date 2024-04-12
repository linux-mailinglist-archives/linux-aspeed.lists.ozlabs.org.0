Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFE38A3808
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Apr 2024 23:43:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=DUsOkhGf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VGVRr6bXyz3vZC
	for <lists+linux-aspeed@lfdr.de>; Sat, 13 Apr 2024 07:43:20 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=DUsOkhGf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.201; helo=relay8-d.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VGVRg512Hz3bv8
	for <linux-aspeed@lists.ozlabs.org>; Sat, 13 Apr 2024 07:43:08 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 73CB91BF204;
	Fri, 12 Apr 2024 21:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712958183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tMFYGKt8Bu7x5uUg4ZkcdxFN8tZOkh1RWzacUVnLx1k=;
	b=DUsOkhGfs+S2lL7ghtnZAlYaMa/6YzxDPAfXVDsfCduvFfqDAn1+oFwiLOwhRa+G0iYJ4R
	FBqhmwxd0i05VS21hI6J2WpEuWVxQbIjR8/p1nM2pUZJXmlaiTvZV1FpHt+TJFcOlgZ85d
	p+e+CPOWYZoisQg0bgLRMjPVwJMKp2DCmOBAcZnyOKU8nJD21FwHCKIR8H/UA1wE02SBMu
	pyRpXCEhR9h22YYQLOnXy4UWMoKl4SR3P970yt2wpWhaw4649CAhRRFPdjOhlL2fZeK7mL
	ylZGNopM3wEuBSQN9J2L+B0PA3csLYO/8sf+MrZ/6qMaHtGRBv8ZM3/OWZo4vA==
Date: Fri, 12 Apr 2024 23:43:00 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: rtc: lpc32xx-rtc: convert to dtschema
Message-ID: <20240412214300a31799c2@mail.local>
References: <20240410-rtc_dtschema-v2-0-d32a11ab0745@gmail.com>
 <20240410-rtc_dtschema-v2-2-d32a11ab0745@gmail.com>
 <202404102043571b7450b5@mail.local>
 <130d47d8-3294-44be-9a8c-8474d342cb12@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <130d47d8-3294-44be-9a8c-8474d342cb12@linaro.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
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
Cc: linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-kernel@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Vladimir Zapolskiy <vz@mleia.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 11/04/2024 08:17:55+0200, Krzysztof Kozlowski wrote:
> On 10/04/2024 22:43, Alexandre Belloni wrote:
> > On 10/04/2024 17:55:34+0200, Javier Carrasco wrote:
> >> Convert existing binding to dtschema to support validation.
> >>
> >> Add the undocumented 'clocks' property.
> >>
> >> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> >> ---
> >>  .../devicetree/bindings/rtc/lpc32xx-rtc.txt        | 15 --------
> >>  .../devicetree/bindings/rtc/nxp,lpc32xx-rtc.yaml   | 41 ++++++++++++++++++++++
> >>  2 files changed, 41 insertions(+), 15 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/rtc/lpc32xx-rtc.txt b/Documentation/devicetree/bindings/rtc/lpc32xx-rtc.txt
> >> deleted file mode 100644
> >> index a87a1e9bc060..000000000000
> >> --- a/Documentation/devicetree/bindings/rtc/lpc32xx-rtc.txt
> >> +++ /dev/null
> >> @@ -1,15 +0,0 @@
> >> -* NXP LPC32xx SoC Real Time Clock controller
> >> -
> >> -Required properties:
> >> -- compatible: must be "nxp,lpc3220-rtc"
> >> -- reg: physical base address of the controller and length of memory mapped
> >> -  region.
> >> -- interrupts: The RTC interrupt
> >> -
> >> -Example:
> >> -
> >> -	rtc@40024000 {
> >> -		compatible = "nxp,lpc3220-rtc";
> >> -		reg = <0x40024000 0x1000>;
> >> -		interrupts = <52 0>;
> >> -	};
> >> diff --git a/Documentation/devicetree/bindings/rtc/nxp,lpc32xx-rtc.yaml b/Documentation/devicetree/bindings/rtc/nxp,lpc32xx-rtc.yaml
> >> new file mode 100644
> >> index 000000000000..62ddeef961e9
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/rtc/nxp,lpc32xx-rtc.yaml
> >> @@ -0,0 +1,41 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/rtc/nxp,lpc32xx-rtc.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: NXP LPC32xx SoC Real Time Clock
> >> +
> >> +maintainers:
> >> +  - Javier Carrasco <javier.carrasco.cruz@gmail.com>
> >> +
> >> +allOf:
> >> +  - $ref: rtc.yaml#
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: nxp,lpc3220-rtc
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  interrupts:
> >> +    maxItems: 1
> >> +
> >> +  clocks:
> >> +    maxItems: 1
> > 
> > As I explained the clock doesn't really exist, there is no control over
> > it, it is a fixed 32768 Hz crystal, there is no point in describing it
> > as this is already the input clock of the SoC.
> 
> That's common for many SoCs but it is still (at least for them) input to
> the RTC. On some SoC boards 32 kHz is controllable.
> 

There is n way this can be controlled at the board level as the soc
mandates a crystal. There is a control for the oscillator but it is not
functional. This would be bit 5 of RTC_CTRL which is documented as such:

"5 Not used. Write is don’t care, Read returns random value."

Even so, the clock wouldn't be an input to the RTC but it is provided by
the RTC.

I guess because it was easer to d so, the clock is defined in the clock
controller driver:
https://elixir.bootlin.com/linux/latest/source/drivers/clk/nxp/clk-lpc32xx.c#L1222

but, from an HW point of view, this is not correct.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
