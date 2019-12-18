Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFC8125771
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Dec 2019 00:10:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dW2h1RjPzDqkZ
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Dec 2019 10:10:52 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="D4G0itlD"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="im2fMc8A"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dW2W3jzjzDqk5
 for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Dec 2019 10:10:43 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3A31C21EE9;
 Wed, 18 Dec 2019 18:10:41 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 18 Dec 2019 18:10:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=bP1o2RXoO7tNFb5/kJZExnnM5a2fcbt
 SPdIvkcQJXyA=; b=D4G0itlDbAPubKY5LU9mOuPyKcoHeft5nHCiCeUvrxboapZ
 dA4ln/pXiG26nX2Ib/RW0MzQoNz1P5GwUeb9HXJraR41akyamzEUG/aNc30GIzYA
 Kh82Y9hf9GHk9EWD04n51CR70RkfogOjfVLyfwkdWhKc9BflHLCYepKjRmFivsYo
 sbpOqUqTdrSU0WiqXF3dO0qg7ILD7zfzaT2S/C955/Xz3/sUlWVKFngtSvuTPJ5y
 L2xhGViM0EiOpvGdn3/BJLkNk4uf7naJjtH8+rkDbooZc4tvHAR5H3CXMHJgCGMW
 afvx24Vc9vOKyNjK200kHX/HsfLuB9yWrqYSg6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=bP1o2R
 XoO7tNFb5/kJZExnnM5a2fcbtSPdIvkcQJXyA=; b=im2fMc8AC7tOloKDP0z5Ec
 12FXgnlAcqB8dc/Y2PbGLETB1tR+1Q8v/kAaW7fJjWikCt2Hhec0sjEiSOaROHt2
 iJi41qCIX/zWo3THTp4mu1n6XU8ScMZRtnrXWwTILTcrMPGBY9FYpjV5pCbSTvqu
 EzLZZZmeAgB496JdYCFS4P1FVNWjmDXrYok4cJ0qtw/khj2VJjcJbAPhowlmUCmY
 1y7u00HcrCiWjtFzol1DCfQ3wB9hV2jUP5562OByiT/0Zj7pNDM0q/cqTvfnGvIC
 +SZzlR/UJU2HzhXJcXWgpDelwm4zuI1X3Hsruxrdv07ZPX0vGBx2vNYGn5AvA1eA
 ==
X-ME-Sender: <xms:8bH6Xf5qSXAyWkTXvrieMhm4NMNijt1vNGVnBYVuPVPGs2UbBwD6dw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddutddgtdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgepud
X-ME-Proxy: <xmx:8bH6XZK3r0wLqMk_E4OLHVw7DiOQhloyQkGJF29idIq7b2azROMgnw>
 <xmx:8bH6XRdCAR5BQEy0cqpKis92i3X2W7pEvO20lYUzY-Lff6EM-wfPWA>
 <xmx:8bH6XUfXHNaY9EcFsW88V8iDB2ce0krMd7MwQm_4ww3R1MW_JVBoHQ>
 <xmx:8bH6XfB1hjKxNCcUrzw86FzEVzB2D39nOicQ30v_bqqeGsovLU73eQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 0BC88E00A2; Wed, 18 Dec 2019 18:10:41 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-694-gd5bab98-fmstable-20191218v1
Mime-Version: 1.0
Message-Id: <73cbffea-89f1-4212-99af-10c32968cf15@www.fastmail.com>
In-Reply-To: <1576681778-18737-6-git-send-email-eajames@linux.ibm.com>
References: <1576681778-18737-1-git-send-email-eajames@linux.ibm.com>
 <1576681778-18737-6-git-send-email-eajames@linux.ibm.com>
Date: Thu, 19 Dec 2019 09:42:10 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH v3 05/12] dt-bindings: soc: Add Aspeed XDMA Engine
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 tglx@linutronix.de
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Thu, 19 Dec 2019, at 01:39, Eddie James wrote:
> Document the bindings for the Aspeed AST25XX and AST26XX XDMA engine.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> Changes since v2:
>  - Remove 'sdmc', rename 'vga-mem' to 'memory'
> 
>  .../devicetree/bindings/soc/aspeed/xdma.txt   | 40 +++++++++++++++++++
>  MAINTAINERS                                   |  6 +++
>  2 files changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/aspeed/xdma.txt
> 
> diff --git a/Documentation/devicetree/bindings/soc/aspeed/xdma.txt 
> b/Documentation/devicetree/bindings/soc/aspeed/xdma.txt
> new file mode 100644
> index 000000000000..58253ea1587b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/aspeed/xdma.txt
> @@ -0,0 +1,40 @@
> +Aspeed AST25XX and AST26XX XDMA Engine
> +
> +The XDMA Engine embedded in the AST2500 and AST2600 SOCs can perform 
> automatic
> +DMA operations over PCI between the SOC (acting as a BMC) and a host 
> processor.
> +
> +Required properties:
> + - compatible		: must be "aspeed,ast2500-xdma" or
> +			  "aspeed,ast2600-xdma"
> + - reg			: contains the address and size of the memory region
> +			  associated with the XDMA engine registers
> + - clocks		: clock specifier for the clock associated with the
> +			  XDMA engine
> + - resets		: reset specifier for the syscon reset associated with
> +			  the XDMA engine
> + - interrupts-extended	: two interrupt cells; the first specifies the 
> global
> +			  interrupt for the XDMA engine and the second
> +			  specifies the PCI-E reset or PERST interrupt.
> + - scu			: a phandle to the syscon node for the system control
> +			  unit of the SOC

I think this should be aspeed,scu.

> + - memory		: contains the address and size of the memory area to
> +			  be used by the XDMA engine for DMA operations

Hmm, I was thinking more like a phandle to a reserved memory region,
like we have in the aspeed-lpc-ctrl binding.

> +
> +Optional properties:
> + - pcie-device		: should be either "bmc" or "vga", corresponding to
> +			  which device should be used by the XDMA engine for
> +			  DMA operations. If this property is not set, the XDMA
> +			  engine will use the BMC PCI-E device.
> +
> +Example:
> +
> +    xdma@1e6e7000 {
> +        compatible = "aspeed,ast2500-xdma";
> +        reg = <0x1e6e7000 0x100>;
> +        clocks = <&syscon ASPEED_CLK_GATE_BCLK>;
> +        resets = <&syscon ASPEED_RESET_XDMA>;
> +        interrupts-extended = <&vic 6>, <&scu_ic 
> ASPEED_AST2500_SCU_IC_PCIE_RESET_LO_TO_HI>;
> +        scu = <&syscon>;
> +        pcie-device = "bmc";
> +        memory = <0x9f000000 0x01000000>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ac9c120d192b..8a14d4268bdc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2708,6 +2708,12 @@ S:	Maintained
>  F:	drivers/media/platform/aspeed-video.c
>  F:	Documentation/devicetree/bindings/media/aspeed-video.txt
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
> 2.24.0
> 
>
