Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B2730135241
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Jan 2020 05:44:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tYRL73ymzDqWr
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Jan 2020 15:43:58 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=Y4QFUcdA; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=p/1AR8Sj; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tYR65YgkzDqLr
 for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Jan 2020 15:43:45 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 347CE21FC3;
 Wed,  8 Jan 2020 23:43:41 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 08 Jan 2020 23:43:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=taiDRc8Qpn+ljKa3v+JJ2VH/VhF+HU9
 gTcCq/CXJk/Q=; b=Y4QFUcdAPhs5F1NtsVAMZJ2NWEOAQ3L/WrrnMLss4MSII0p
 QiI5kEHAFxW5H2fKyD3JX3qWjq6ym8typst52yTTaPLyv3JTY4gzC3EnnQ6TyFOG
 IjC2tY1dbW25noiZcxj219g6P+yxs86qmtmv7BGORj2SFjOXHqOCUdH+XhxSxuyt
 nCqGAcuObjKawHVOUdItpRGZhHI87J/S4gJiUyYncjJubrZ/aoTW1UGaDqvwmOtp
 MZvpF9gg2MqV/6Meq0UIryB7hRoG6fCpwdh2gAxEnfXYuKGKlh7+BHT2Q0Y+zqgC
 wSNaoJV1lL+d0Mh79GhT9Is8bNZQ6OU/WXqMX/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=taiDRc
 8Qpn+ljKa3v+JJ2VH/VhF+HU9gTcCq/CXJk/Q=; b=p/1AR8Sj4FRNX27JOUsn4p
 aUcnnvRcxVuKz/3S3MYDjDCNh0iw2uCKc+uwND2IOU/NZJbdVkTR8PyNS8l7n+6g
 CY1lj5cUJ/AKcZ/gi/DnoQIJlTL5PBS96s/oda4UbS6wlBTIUaF0ZIQVuRs2c7zO
 fjWkosezJSirHrGyvMJMqgllF1OeX0YiT1QrjJYLdSDqWqWVlXjAxB9Ttr8BkaKE
 J/2kDa53QU8wNXl4bWBw0kDH/YUd4A5ghjgF3bTwAcRhsRs92KpLYrOyiYvYBA8i
 DDG0Bl69O8JBjl43BQQd3E4fzwqp0c0uaAudGHizyDmXTbPbzl1j6gC4j7+6i1xw
 ==
X-ME-Sender: <xms:e68WXtp7DRwcGksY0anL9lWdG07_eQplFUzX1X8U6c0lX63E1mv0xg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdehledgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:e68WXkiLTErI05O4GuCxW-TaO8gGcLJexpQ3xM5oxeB1_NfEjZahVw>
 <xmx:e68WXnwORpaCJmSfvwt4kT0n3K9dtJhAEua37HFmM9qO3QdTFpSfag>
 <xmx:e68WXq9iyttuAOaajY1Xx-_jTjrBeCFxBDx8JIpPac5GhwP-qhWIpg>
 <xmx:fa8WXiCG33PCe2CDF5pZawSJe8ZqQxsu0hb66VbLIG8wUmp62xBwWA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id AC54CE00A2; Wed,  8 Jan 2020 23:43:39 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-740-g7d9d84e-fmstable-20200109v1
Mime-Version: 1.0
Message-Id: <3cc1006c-c107-4864-b652-118e84060c38@www.fastmail.com>
In-Reply-To: <1577993276-2184-6-git-send-email-eajames@linux.ibm.com>
References: <1577993276-2184-1-git-send-email-eajames@linux.ibm.com>
 <1577993276-2184-6-git-send-email-eajames@linux.ibm.com>
Date: Thu, 09 Jan 2020 15:15:38 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH v4 05/12] dt-bindings: soc: Add Aspeed XDMA Engine
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



On Fri, 3 Jan 2020, at 05:57, Eddie James wrote:
> Document the bindings for the Aspeed AST25XX and AST26XX XDMA engine.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> Changes since v3:
>  - Switch "scu" property to "aspeed,scu"
> 
>  .../devicetree/bindings/soc/aspeed/xdma.txt   | 40 +++++++++++++++++++
>  MAINTAINERS                                   |  6 +++
>  2 files changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/aspeed/xdma.txt
> 
> diff --git a/Documentation/devicetree/bindings/soc/aspeed/xdma.txt 
> b/Documentation/devicetree/bindings/soc/aspeed/xdma.txt
> new file mode 100644
> index 000000000000..e0740ccfa910
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
> + - aspeed,scu		: a phandle to the syscon node for the system control
> +			  unit of the SOC
> + - memory		: contains the address and size of the memory area to
> +			  be used by the XDMA engine for DMA operations
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

You missed fixing the example :)

Andrew
