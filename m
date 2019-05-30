Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C292F717
	for <lists+linux-aspeed@lfdr.de>; Thu, 30 May 2019 07:30:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Dx4X3NVpzDqTN
	for <lists+linux-aspeed@lfdr.de>; Thu, 30 May 2019 15:30:36 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="DVsyE+X8"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="cFyFExWa"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Dx4Q0tV7zDqT1
 for <linux-aspeed@lists.ozlabs.org>; Thu, 30 May 2019 15:30:30 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id ABA8021B42;
 Thu, 30 May 2019 01:30:27 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 30 May 2019 01:30:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=CzFtZ9I8cNfdZpCeL+UPORC3ICYpQX5
 KalmGG602HJg=; b=DVsyE+X8EZQsJqyYiTsTIT78wC1usk00mmn1QgTjw8aJfMB
 /xLNKmYskf1OgW/QRQxUzyLJ4GKjswGVLPpY/vvUNOKQrfXa1JPhSNHslT8JqjAy
 1UENXTroSWRaWXlKiSLj06ZSRi6qbSm8RGRHJa3YqNoBEQbdg40AwfDDgCRsnNUA
 YavQAmIyWoOYzL7qWaebzwFEV1yDDO8MiW6Wi2RXjSH9P/HK96DbULZ2gRpezUIS
 HK3Vnob6yJphrVX43wCBsuji9MNa72EWKy5GnCwneMdiJ9d+GTDGNVMD16AUYvq1
 IxoBHwTRcCjIcf65oki8M2g+Gg5Gg09eX8NyhOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=CzFtZ9
 I8cNfdZpCeL+UPORC3ICYpQX5KalmGG602HJg=; b=cFyFExWaa6RvA0mSG6Wp3X
 GcR05ifkLyAGsnrfjI9uy2DrcAohOCWS7DuIGlK/+OB27HJn0wWe8r+RdNgCPW1a
 q99dkV15OogxhlaPL8g4JxK7KenK+j5/ODiuR70UpIn1/VTcj9mLyMikY1NZfGJ6
 gSBuHlWuHkwOTY/CzPNZtXUCKmiJh3sIusaOQz/ipVZKz9TgSnnttyRHdpHBGP3g
 R6YoL/xS7FBJh7XFInGf+xziUA3C3qjQAy2DaHgmLV7ixavj6nqBC0PLGavR4dRm
 JsKD54xZHNgWIX3CDivtpTGUGIitZEQhXyRkw8J9vkj+UxRUWmBTW0NT2XJtjHLw
 ==
X-ME-Sender: <xms:cmrvXJbPZLx8TJ8KdHwMpH5wrvGX2bmAp7ZY0RBxeW00P-ckfO0shw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddruddvkedgleegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:cmrvXFowtEqPt7N8i6upVHrKgl0Lusi3Hqr2l57jgGFo2h7hM6gtGg>
 <xmx:cmrvXNoRtSn9-uFwWAwU-kG89-khz3PtbkrMvkAdExtIqadQE0s_3w>
 <xmx:cmrvXP1rYyWJu8tvy05WeAOaYlexZ4u0Cn_-f908UWl_mu_EzTtslQ>
 <xmx:c2rvXFf5DBzK4kZ0617dC3MnfyPnsO-Wkm1zxSfFLcCKwy1nYB29og>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id F326EE00A1; Thu, 30 May 2019 01:30:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-555-g49357e1-fmstable-20190528v2
Mime-Version: 1.0
Message-Id: <58b74556-cbf0-4da2-9392-4c4ac40ad760@www.fastmail.com>
In-Reply-To: <1559153408-31190-2-git-send-email-eajames@linux.ibm.com>
References: <1559153408-31190-1-git-send-email-eajames@linux.ibm.com>
 <1559153408-31190-2-git-send-email-eajames@linux.ibm.com>
Date: Thu, 30 May 2019 15:00:25 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, linux-aspeed@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_v3_1/8]_dt-bindings:_soc:_Add_Aspeed_XDMA_engine_bi?=
 =?UTF-8?Q?nding_documentation?=
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
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Thu, 30 May 2019, at 03:40, Eddie James wrote:
> Document the bindings.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  .../devicetree/bindings/soc/aspeed/xdma.txt        | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/aspeed/xdma.txt
> 
> diff --git a/Documentation/devicetree/bindings/soc/aspeed/xdma.txt 
> b/Documentation/devicetree/bindings/soc/aspeed/xdma.txt
> new file mode 100644
> index 0000000..85e82ea
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/aspeed/xdma.txt
> @@ -0,0 +1,23 @@
> +* Device tree bindings for the Aspeed XDMA Engine
> +
> +The XDMA Engine embedded in the AST2500 SOC can perform automatic DMA
> +operations over PCI between the AST2500 (acting as a BMC) and a host 
> processor.
> +
> +Required properties:
> +
> + - compatible		"aspeed,ast2500-xdma"
> + - reg			contains the offset and length of the memory region
> +			assigned to the XDMA registers
> + - resets		reset specifier for the syscon reset associated with
> +			the XDMA engine
> + - interrupts		the interrupt associated with the XDMA engine on this
> +			platform

The indentation is quite distracting. If you rev the series can you fix it?

Otherwise,

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> +
> +Example:
> +
> +    xdma@1e6e7000 {
> +        compatible = "aspeed,ast2500-xdma";
> +        reg = <0x1e6e7000 0x100>;
> +        resets = <&syscon ASPEED_RESET_XDMA>;
> +        interrupts = <6>;
> +    };
> -- 
> 1.8.3.1
> 
>
