Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A200B290A66
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Oct 2020 19:16:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCXqr6P62zDqpq
	for <lists+linux-aspeed@lfdr.de>; Sat, 17 Oct 2020 04:16:24 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.66; helo=mail-ot1-f66.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCXqk6JgyzDqlc
 for <linux-aspeed@lists.ozlabs.org>; Sat, 17 Oct 2020 04:16:17 +1100 (AEDT)
Received: by mail-ot1-f66.google.com with SMTP id 65so3050778otu.9
 for <linux-aspeed@lists.ozlabs.org>; Fri, 16 Oct 2020 10:16:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZmPWxKpDTknAmEe7UdqFdRj8Owf4EcjFeMtD8aGa6yA=;
 b=JLZu/H7yDeCPnrC9CGt6oD4Un1VASm8KNnxN1R0HvtexbNyaAm4AsnxEgHY34h3+IV
 5XtG1IdKImHSlZQAaGzMPPRMRa9OrVa1aUjfBhuuaCGFzqGtJxhtQ8yv/UoMqXKPCd42
 PkekReOlv+F+SO76zau4iAXODhbLlO3Ioo6VaCy00T5TsAFHk5iNuUkq5sq7ekflb5+v
 C5lN8mUdzlgVK1gp/Q0vpK8gg3MNJcfvM7Qaex+xKuD2s/geazZH9b3t8ieUzm0VvQL/
 3AOFVm/DtAf9o4RWkwfDjH3X1OuUYG/gZbatLtaUQUVAnanNAxOMt8J+Pu7TWTypSoGF
 8SZQ==
X-Gm-Message-State: AOAM531beVqY0p0yetIH4uK+NRmKHcFP7eQlzH1TetmJuEFa/2RSt+ja
 WwE+8dJgrtinQc4QnoKHyA==
X-Google-Smtp-Source: ABdhPJwNFTc03Dpq8hQaQDs+x9At0y/IfS8Tw88Q4LOwNP/y70SOX0/J9aHLsKBqBo0dt8/jeyr6pw==
X-Received: by 2002:a05:6830:13c5:: with SMTP id
 e5mr3209070otq.319.1602868574593; 
 Fri, 16 Oct 2020 10:16:14 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p11sm1158258otp.8.2020.10.16.10.16.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 10:16:13 -0700 (PDT)
Received: (nullmailer pid 1595441 invoked by uid 1000);
 Fri, 16 Oct 2020 17:16:12 -0000
Date: Fri, 16 Oct 2020 12:16:12 -0500
From: Rob Herring <robh@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH 3/3] iio: adc: aspeed: Setting ref_voltage in probe
Message-ID: <20201016171612.GA1593560@bogus>
References: <20201013103245.16723-1-billy_tsai@aspeedtech.com>
 <20201013103245.16723-4-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201013103245.16723-4-billy_tsai@aspeedtech.com>
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 lars@metafoo.de, p.zabel@pengutronix.de, linux-aspeed@lists.ozlabs.org,
 BMC-SW@aspeedtech.com, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 pmeerw@pmeerw.net, knaack.h@gmx.de, alexandru.ardelean@analog.com,
 jic23@kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Oct 13, 2020 at 06:32:45PM +0800, Billy Tsai wrote:
> At ast2600 ref_voltage becomes configurable and this property is board
> dependency.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../devicetree/bindings/iio/adc/aspeed_adc.txt   | 16 +++++++++++++++-
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

This split is convention, but not relevant to the binding.

> +Required properties:
> +- ref_voltage: (ast2600 only)

s/_/-/

And needs a vendor prefix.

> +	- Reference voltage in millivolts for the conversions.
> +	- The range of value is 900 to 2700 mv.
> +
> +Example:
> +&adc0 {
> +	ref_voltage = <2500>;
> +};
> \ No newline at end of file

Fix this.

> -- 
> 2.17.1
> 
