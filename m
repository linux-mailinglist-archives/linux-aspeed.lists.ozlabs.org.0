Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E128A016A
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Apr 2024 22:44:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=X5lEZxWr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VFFDc5bq0z3vX0
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Apr 2024 06:44:16 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=X5lEZxWr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.201; helo=relay8-d.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 123409 seconds by postgrey-1.37 at boromir; Thu, 11 Apr 2024 06:44:07 AEST
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VFFDR3ctKz3cS3
	for <linux-aspeed@lists.ozlabs.org>; Thu, 11 Apr 2024 06:44:05 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E3BE1BF203;
	Wed, 10 Apr 2024 20:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712781841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SO7ecFohm5j2wJ67RRcIW5jl8PWTfmDr0JC62K3rRB0=;
	b=X5lEZxWrbyjP7ZMJaTt6eLdDDj9dqI9T5UQgBEo1q0NcBeEkxgO5KBqvy4m4uhJTW/07ZE
	44d1qmkb3zBTdJOpjEMnpTrjXAHrsuX4ZxB38JKNKFy8bXRYc8AoWJvoShk+IrSA83Bi3G
	SOPaisH/NumDw0/bJvPDnhyMAgcS3Fu6TGQ4bZ+XA2rH5L1dqUPKKunV9kqah5rclGn/dz
	rpwH6//kuildVmYfq1krVU3J3/sqdRjiY4NxRS/pY5NQANb4RAfIBO9isNjlF7V55ZbY0U
	7AJIwgnCoVs25BzUrvz0W6L2vtpe6seBIyhyQuH2i2pAHMhIIEybNQu+Kf45nQ==
Date: Wed, 10 Apr 2024 22:43:57 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: rtc: lpc32xx-rtc: convert to dtschema
Message-ID: <202404102043571b7450b5@mail.local>
References: <20240410-rtc_dtschema-v2-0-d32a11ab0745@gmail.com>
 <20240410-rtc_dtschema-v2-2-d32a11ab0745@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240410-rtc_dtschema-v2-2-d32a11ab0745@gmail.com>
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
Cc: linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Vladimir Zapolskiy <vz@mleia.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 10/04/2024 17:55:34+0200, Javier Carrasco wrote:
> Convert existing binding to dtschema to support validation.
> 
> Add the undocumented 'clocks' property.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>  .../devicetree/bindings/rtc/lpc32xx-rtc.txt        | 15 --------
>  .../devicetree/bindings/rtc/nxp,lpc32xx-rtc.yaml   | 41 ++++++++++++++++++++++
>  2 files changed, 41 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/lpc32xx-rtc.txt b/Documentation/devicetree/bindings/rtc/lpc32xx-rtc.txt
> deleted file mode 100644
> index a87a1e9bc060..000000000000
> --- a/Documentation/devicetree/bindings/rtc/lpc32xx-rtc.txt
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -* NXP LPC32xx SoC Real Time Clock controller
> -
> -Required properties:
> -- compatible: must be "nxp,lpc3220-rtc"
> -- reg: physical base address of the controller and length of memory mapped
> -  region.
> -- interrupts: The RTC interrupt
> -
> -Example:
> -
> -	rtc@40024000 {
> -		compatible = "nxp,lpc3220-rtc";
> -		reg = <0x40024000 0x1000>;
> -		interrupts = <52 0>;
> -	};
> diff --git a/Documentation/devicetree/bindings/rtc/nxp,lpc32xx-rtc.yaml b/Documentation/devicetree/bindings/rtc/nxp,lpc32xx-rtc.yaml
> new file mode 100644
> index 000000000000..62ddeef961e9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/nxp,lpc32xx-rtc.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/nxp,lpc32xx-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP LPC32xx SoC Real Time Clock
> +
> +maintainers:
> +  - Javier Carrasco <javier.carrasco.cruz@gmail.com>
> +
> +allOf:
> +  - $ref: rtc.yaml#
> +
> +properties:
> +  compatible:
> +    const: nxp,lpc3220-rtc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1

As I explained the clock doesn't really exist, there is no control over
it, it is a fixed 32768 Hz crystal, there is no point in describing it
as this is already the input clock of the SoC.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
