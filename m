Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1072B1B4E12
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Apr 2020 22:13:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496s842kYqzDqlP
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Apr 2020 06:13:40 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.65; helo=mail-ot1-f65.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 496s7w5RJzzDqTd
 for <linux-aspeed@lists.ozlabs.org>; Thu, 23 Apr 2020 06:13:30 +1000 (AEST)
Received: by mail-ot1-f65.google.com with SMTP id e26so3390415otr.2
 for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Apr 2020 13:13:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FU28JBKGEW/8GQtu1EPA/t3igT0iC4W0GHS/U/6pah4=;
 b=hsrdAVVY7Uv6OglbYcmUq3Ph/fqCMJB7WEI+ET4jAv14kRjP4knBNNwa1ATOrLvLxb
 XOAHx2p9p2O8fSUeTi2gXvxG+43ZZLpczoQf9LAM+hv8R6UtcDHioON3Exgnq0VujKIc
 Te5jIMs8hiMD/LqK3ZfcFz3jqzYPhNMFZpuyJYtv5b0ekbNItj1msucMujqqZFR+hcBV
 gF6fzas8ODhCwgeiGUAzDmT8UhUp1Pba1QGwfwQ9cy98uQ35bBR9u++c3cxAmWRB5UZ2
 JoIXsRYYIGpY7OHb/cuhaVdb4K7fR5nPqaWBrNL9YhjF+DaSJwzj8bZL1L/0+3CAv9Vt
 v/lQ==
X-Gm-Message-State: AGi0PuYSCQ5ynzB13+BSN5Bvec8mSPk8DgcFfgKSvynuTvCAGYPNn8T5
 pt4FqA9P3hjaqK5/onT0/w==
X-Google-Smtp-Source: APiQypLq1juXk3wkyAmmhugjQWskZwTMMSVHNWayyrQVPc7tVA60BLU67e9v/cwDx0dAkBMdlJyA5A==
X-Received: by 2002:a9d:6b11:: with SMTP id g17mr712345otp.264.1587586407497; 
 Wed, 22 Apr 2020 13:13:27 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t26sm33325otl.71.2020.04.22.13.13.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2020 13:13:26 -0700 (PDT)
Received: (nullmailer pid 20547 invoked by uid 1000);
 Wed, 22 Apr 2020 20:13:25 -0000
Date: Wed, 22 Apr 2020 15:13:25 -0500
From: Rob Herring <robh@kernel.org>
To: Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH v10 1/7] dt-bindings: soc: Add Aspeed XDMA Engine
Message-ID: <20200422201325.GA12023@bogus>
References: <20200420202611.17776-1-eajames@linux.ibm.com>
 <20200420202611.17776-2-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200420202611.17776-2-eajames@linux.ibm.com>
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

On Mon, Apr 20, 2020 at 03:26:05PM -0500, Eddie James wrote:
> Document the bindings for the Aspeed AST25XX and AST26XX XDMA engine.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  .../devicetree/bindings/soc/aspeed/xdma.yaml  | 108 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 114 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/aspeed/xdma.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/aspeed/xdma.yaml b/Documentation/devicetree/bindings/soc/aspeed/xdma.yaml
> new file mode 100644
> index 000000000000..428a575da1be
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/aspeed/xdma.yaml
> @@ -0,0 +1,108 @@
> +# SPDX-License-Identifier: (GPL-2.0-or-later)

Dual license new bindings please:

(GPL-2.0-only OR BSD-2-Clause)

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/aspeed/xdma.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Aspeed AST25XX and AST26XX XDMA Engine
> +
> +maintainers:
> + - Eddie James <eajames@linux.ibm.com>
> +
> +description: |
> +  This binding describes the XDMA Engine embedded in the AST2500 and AST2600
> +  SOCs. The XDMA engine can perform automatic DMA operations over PCI between
> +  the SOC (acting as a BMC) and a host processor.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2500-xdma
> +      - aspeed,ast2600-xdma
> +
> +  reg:
> +    items:
> +      - description: engine register space

That's all 'reg' properties. You don't need a description for a 
single entry. Just:

reg:
  maxItems: 1

> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    minItems: 1
> +    maxItems: 2
> +
> +  reset-names:
> +    maxItems: 2
> +    items:
> +      - const: device
> +      - const: root-complex
> +
> +  interrupts-extended:

Just use 'interrupts'. The tools fix things up so both work.

> +    maxItems: 2
> +    items:
> +      - description: global interrupt for the XDMA engine
> +      - description: PCI-E reset or PERST interrupt
> +
> +  aspeed,scu:
> +    description: a reference to the System Control Unit node of the Aspeed SOC.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/phandle
> +
> +  aspeed,pcie-device:
> +    description: describes which PCI-E device the XDMA engine should use
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/string
> +      - oneOf:
> +        - items:
> +          - const: bmc
> +        - items:
> +          - const: vga

The oneOf (inclusive) can be just:

enum: [ bmc, vga ]

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - resets
> +  - interrupts-extended
> +  - aspeed,scu
> +  - memory-region
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: aspeed,ast2600-xdma
> +then:
> +  required:
> +    - reset-names
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/ast2600-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/aspeed-scu-ic.h>
> +    syscon: syscon@1e6e2000 {
> +        reg = <0x1e6e2000 0x1000>;
> +        ranges = <0 0x1e6e2000 0x1000>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        #clock-cells = <1>;
> +        #reset-cells = <1>;
> +        scu_ic0: interrupt-controller@560 {
> +            reg = <0x560 0x4>;
> +            interrupt-controller;
> +            #interrupt-cells = <1>;
> +        };
> +    };
> +    xdma@1e6e7000 {
> +        compatible = "aspeed,ast2600-xdma";
> +        reg = <0x1e6e7000 0x100>;
> +        clocks = <&syscon ASPEED_CLK_GATE_BCLK>;
> +        resets = <&syscon ASPEED_RESET_DEV_XDMA>, <&syscon ASPEED_RESET_RC_XDMA>;
> +        reset-names = "device", "root-complex";
> +        interrupts-extended = <&gic GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
> +                              <&scu_ic0 ASPEED_AST2600_SCU_IC0_PCIE_PERST_LO_TO_HI>;
> +        aspeed,scu = <&syscon>;
> +        aspeed,pcie-device = "bmc";
> +        memory-region = <&vga_memory>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ecd7def6ff4b..b1963e01a75e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2774,6 +2774,12 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/media/aspeed-video.txt
>  F:	drivers/media/platform/aspeed-video.c
>  
> +ASPEED XDMA ENGINE DRIVER
> +M:	Eddie James <eajames@linux.ibm.com>
> +L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/soc/aspeed/xdma.yaml
> +
>  ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS DRIVERS
>  M:	Corentin Chary <corentin.chary@gmail.com>
>  L:	acpi4asus-user@lists.sourceforge.net
> -- 
> 2.24.0
> 
