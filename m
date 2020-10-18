Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CEE29170A
	for <lists+linux-aspeed@lfdr.de>; Sun, 18 Oct 2020 12:56:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CDcJ715JRzDqjM
	for <lists+linux-aspeed@lfdr.de>; Sun, 18 Oct 2020 21:56:07 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=jic23@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=TjMO+Ppl; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CDcHz0cVKzDqfB
 for <linux-aspeed@lists.ozlabs.org>; Sun, 18 Oct 2020 21:55:58 +1100 (AEDT)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6D26520897;
 Sun, 18 Oct 2020 10:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603018555;
 bh=L+dg32jrevsTb3fSsRs6/iEC7MJ0sIPnxbRA5OGaXE0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TjMO+PplxQuZkosT10rnNMmsEujF4/Sb2QRh09G28MZC3H1ZZog7xP2V/vzwZsTqj
 2Z24FPUsnXEMYhMtWh8gZphJCwP0xRvDxURlLRgCHEIN1DyLSlhE9Y7kB5g/MfJIxO
 /KdvwO9qugnmJjmStreXqgbKOcCy9uhRfz2iUWFE=
Date: Sun, 18 Oct 2020 11:55:49 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH 3/3] iio: adc: aspeed: Setting ref_voltage in probe
Message-ID: <20201018115549.6b1f871a@archlinux>
In-Reply-To: <20201013103245.16723-4-billy_tsai@aspeedtech.com>
References: <20201013103245.16723-1-billy_tsai@aspeedtech.com>
 <20201013103245.16723-4-billy_tsai@aspeedtech.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, lars@metafoo.de, p.zabel@pengutronix.de,
 linux-aspeed@lists.ozlabs.org, BMC-SW@aspeedtech.com,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, robh+dt@kernel.org,
 pmeerw@pmeerw.net, knaack.h@gmx.de, alexandru.ardelean@analog.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 13 Oct 2020 18:32:45 +0800
Billy Tsai <billy_tsai@aspeedtech.com> wrote:

> At ast2600 ref_voltage becomes configurable and this property is board
> dependency.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

dt-bindings: etc for the patch title.  Look at naming of similar patches
for a reference.


> ---
>  .../devicetree/bindings/iio/adc/aspeed_adc.txt   | 16 +++++++++++++++-

This has been converted to yaml. 
It is now in Linus' tree (though only very recently!)

You will need to add the relevant logic to make the yaml binding express that this
only exists and is required for ast600

The binding is making me wonder a bit on what this voltage actually is...

I 'think' we have a setup where the reference voltage is either picked
from 2 available internal references or uses an external regulator (presumably
provided to a pin on the chip?)

As such, the binding should be an optional regulator.  If the regulator is present
we use that, even if it matches the internal regulator votlage.  Someone put it
down on the board, so presumably  they want to use it.

If it's not present, then have to provide either of the two internal regulator
voltages via a devicetree binding such as you have here.



>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/aspeed_adc.txt b/Documentation/devicetree/bindings/iio/adc/aspeed_adc.txt
> index 034fc2ba100e..0ba1980c4e06 100644
> --- a/Documentation/devicetree/bindings/iio/adc/aspeed_adc.txt
> +++ b/Documentation/devicetree/bindings/iio/adc/aspeed_adc.txt
> @@ -3,8 +3,11 @@ Aspeed ADC
>  This device is a 10-bit converter for 16 voltage channels.  All inputs are
>  single ended.
>  
> +At ast2600, this device split into two individual IPs and each contains 8 voltage channels.
> +
> +Chip level dtsi:
>  Required properties:
> -- compatible: Should be "aspeed,ast2400-adc" or "aspeed,ast2500-adc"
> +- compatible: Should be "aspeed,ast2400-adc" or "aspeed,ast2500-adc" or "aspeed,ast2600-adc"
>  - reg: memory window mapping address and length
>  - clocks: Input clock used to derive the sample clock. Expected to be the
>            SoC's APB clock.
> @@ -20,3 +23,14 @@ Example:
>  		resets = <&syscon ASPEED_RESET_ADC>;
>  		#io-channel-cells = <1>;
>  	};
> +
> +Board level dts:
> +Required properties:
> +- ref_voltage: (ast2600 only)
> +	- Reference voltage in millivolts for the conversions.
> +	- The range of value is 900 to 2700 mv.

See above for suggestion on on this. For the internal case, will need
a name that expresses both what it is and what the units are.

int_ref_voltage_mv perhaps?

Yaml binding should check that either we have a regulator, or
we have this element.  That way we'll ensure we don't have any confusion
over which one to use.

Thanks,

Jonathan

> +
> +Example:
> +&adc0 {
> +	ref_voltage = <2500>;
> +};
> \ No newline at end of file

