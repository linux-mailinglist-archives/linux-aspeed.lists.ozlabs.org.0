Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0B81AE220
	for <lists+linux-aspeed@lfdr.de>; Fri, 17 Apr 2020 18:22:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493hFc3FkgzDrgm
	for <lists+linux-aspeed@lfdr.de>; Sat, 18 Apr 2020 02:22:28 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.196;
 helo=mail-oi1-f196.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493hFM5Yg6zDrTf
 for <linux-aspeed@lists.ozlabs.org>; Sat, 18 Apr 2020 02:22:14 +1000 (AEST)
Received: by mail-oi1-f196.google.com with SMTP id 8so2537625oiy.6
 for <linux-aspeed@lists.ozlabs.org>; Fri, 17 Apr 2020 09:22:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HeAHiyvWEUaF+aCLu1NaqGKApOTT6/8+xu5a7bTpKz8=;
 b=OhOgXkYUe3pSpoZh2OhkPwHULma9w1DPTMMh+chIZ2mShrJSOcIZwtBDdsEt4/d91i
 DJIny6AzIx66YS/cIHO2BXGFbwnB5nlVMZ0m7rzO/jEB4RuptwBA4SQnpiOJuG5m0XfK
 HPQmX0zDqTLeklDBc8d0CB1rgMBCvJB25Jz0Uo/B19ibmbP9HctyDfPBkstwPYw/pUsO
 BoHX4w7kf0d3z4CdL0oW6j0Ww3kKePpswRDhVtz11FKd0QqEwN1sEkZM/lSdt1V/s7Xo
 B7r4f08bu3+IIwGgXTVZ2JyZQFibTWje7YqlrXhywJDg/iiiOkURyAJzXUYGda/5eisB
 AmcQ==
X-Gm-Message-State: AGi0PuYfJNXTeaPR9tJF+Vf4y0LpHhYr5PUnLpjTJJMPh2JuxYIg0Ejk
 lYMMJrUIzsj46ZhNMZtvwQ==
X-Google-Smtp-Source: APiQypIr+IqasDXVzw4cm+LyZdJBeCjzNk9h5xojT4id6JrVlp3WKVmJeu6fpY1NvWdWw1q23nYkxA==
X-Received: by 2002:a54:4085:: with SMTP id i5mr2810167oii.107.1587140532363; 
 Fri, 17 Apr 2020 09:22:12 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v9sm4651042oto.72.2020.04.17.09.22.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 09:22:11 -0700 (PDT)
Received: (nullmailer pid 7462 invoked by uid 1000);
 Fri, 17 Apr 2020 16:22:11 -0000
Date: Fri, 17 Apr 2020 11:22:11 -0500
From: Rob Herring <robh@kernel.org>
To: Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH v9 1/5] dt-bindings: soc: Add Aspeed XDMA Engine
Message-ID: <20200417162210.GA402@bogus>
References: <1587067419-5107-1-git-send-email-eajames@linux.ibm.com>
 <1587067419-5107-2-git-send-email-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1587067419-5107-2-git-send-email-eajames@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Apr 16, 2020 at 03:03:35PM -0500, Eddie James wrote:
> Document the bindings for the Aspeed AST25XX and AST26XX XDMA engine.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> Changes since v8:
>  - dropped Rob's tag since this has changed significantly since he last looked
>    it over.

If this is not merged soon, you're going to need to convert to schema.

>  .../devicetree/bindings/soc/aspeed/xdma.txt        | 45 ++++++++++++++++++++++
>  MAINTAINERS                                        |  6 +++
>  2 files changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/aspeed/xdma.txt
> 
> diff --git a/Documentation/devicetree/bindings/soc/aspeed/xdma.txt b/Documentation/devicetree/bindings/soc/aspeed/xdma.txt
> new file mode 100644
> index 0000000..35d0507
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/aspeed/xdma.txt
> @@ -0,0 +1,45 @@
> +Aspeed AST25XX and AST26XX XDMA Engine
> +
> +The XDMA Engine embedded in the AST2500 and AST2600 SOCs can perform automatic
> +DMA operations over PCI between the SOC (acting as a BMC) and a host processor.
> +
> +Required properties:
> + - compatible		: must be "aspeed,ast2500-xdma" or
> +			  "aspeed,ast2600-xdma"
> + - reg			: contains the address and size of the memory region
> +			  associated with the XDMA engine registers
> + - clocks		: clock specifier for the clock associated with the
> +			  XDMA engine
> + - resets		: reset specifier for the syscon reset associated with
> +			  the XDMA engine, and, for the AST2600, a second reset
> +			  associated with the PCI-E root complex
> + - reset-names		: required only for the AST2600; must be
> +			  "device", "root-complex"
> + - interrupts-extended	: two interrupt cells; the first specifies the global
> +			  interrupt for the XDMA engine and the second
> +			  specifies the PCI-E reset or PERST interrupt.
> + - aspeed,scu		: a phandle to the syscon node for the system control
> +			  unit of the SOC
> + - memory-region	: a phandle to the reserved memory region to be used by
> +			  the XDMA engine for DMA operations
> +
> +Optional properties:
> + - pcie-device		: should be either "bmc" or "vga", corresponding to
> +			  which device should be used by the XDMA engine for
> +			  DMA operations. If this property is not set, the XDMA
> +			  engine will use the BMC PCI-E device.

aspeed,pcie-device

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +
> +Example:
> +
> +    xdma@1e6e7000 {
> +        compatible = "aspeed,ast2600-xdma";
> +        reg = <0x1e6e7000 0x100>;
> +        clocks = <&syscon ASPEED_CLK_GATE_BCLK>;
> +        resets = <&syscon ASPEED_RESET_DEV_XDMA>, <&syscon ASPEED_RESET_RC_XDMA>;
> +        reset-names = "device", "root-complex";
> +        interrupts-extended = <&gic GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
> +                              <&scu_ic0 ASPEED_AST2600_SCU_IC0_PCIE_PERST_LO_TO_HI>;
> +        aspeed,scu = <&syscon>;
> +        pcie-device = "bmc";
> +        memory-region = <&vga_memory>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5e10560..66f82a2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2771,6 +2771,12 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/media/aspeed-video.txt
>  F:	drivers/media/platform/aspeed-video.c
>  
> +ASPEED XDMA ENGINE DRIVER
> +M:	Eddie James <eajames@linux.ibm.com>
> +L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/soc/aspeed/xdma.txt
> +
>  ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS DRIVERS
>  M:	Corentin Chary <corentin.chary@gmail.com>
>  L:	acpi4asus-user@lists.sourceforge.net
> -- 
> 1.8.3.1
> 
