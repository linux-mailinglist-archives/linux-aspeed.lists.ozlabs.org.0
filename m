Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 268144FB0F5
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Apr 2022 02:16:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kc8XY5mMFz3bXq
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Apr 2022 10:16:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=S8vxj8OP;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=eL9SkB6a;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=S8vxj8OP; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=eL9SkB6a; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kc8XN5wm3z2xYQ
 for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Apr 2022 10:16:03 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 0BE0B5C0170;
 Sun, 10 Apr 2022 20:15:57 -0400 (EDT)
Received: from imap49 ([10.202.2.99])
 by compute3.internal (MEProxy); Sun, 10 Apr 2022 20:15:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=dXHAm3z4tHh0Mh9DCwiFQXs0dDzLplgovQi8uT
 MwfCo=; b=S8vxj8OPWf6SGtbLLFubtaYn6pEuq8jgI7De51ASehkIYH1X2DOqav
 35x+Qq63Pi0USpZQw3+Mj/fSrQ+suiiQ6Xye+Byr4zHqj2Aoxr4LJWrW3u1ywHHt
 k3jzV0S73f1CCL/my5YXrpOPr6iXGde6bNXzfT/GvNavkCc/WQmXXN3bAsgnua9v
 aBYJ4pxmL2muJiPtyVDoQVijIbZL99J/4bsoEDdZN5/X3a/FG4+xRUhoxhc+zz9n
 w2vrFSVO5g/JvNPQqALOQ+OfDIg7QmYu+4f+HrCdfb2BWFtAdszxuUattwRbCCcO
 72to41T1GN/TACfEZ1FHII3fB7dUIqYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=dXHAm3z4tHh0Mh9DC
 wiFQXs0dDzLplgovQi8uTMwfCo=; b=eL9SkB6aSP3VvVWAtHSve0LtgDqy6guq+
 cq+unj2ZcoE7JdAziBx33SMlBgt5vO0btc332b4W+jftz9ptEsT63vtZ2dKn1Sln
 T+g5h5b84vq2OtONLN7OUF9RsDZvSuTUaL49Gt8+OyON+p70mOn/e5pKk+w6SPjb
 ZvLaux6HLb6pnvmbFzywZzKWYZz1oMh/6z5qCtO2hc8zVB8CtkiqhFaRt5WEPC6f
 QlOoVkIEHFyHRcQCvSPyI0GlebHcrALseV0QZ5bOuhTlEdQEj2v2QzKEUKICL8HD
 lZ3T3VDK/1x4yQwzUwF7mr3DNR3AFE8SADu1r3olZem+Q5YHerhMQ==
X-ME-Sender: <xms:PHNTYjXvumB48-XHUf8RktCZ7hW5IjC2Vk5YPwHCrPpM7rXEKdNJuQ>
 <xme:PHNTYrmTU-VkCTgLO9Of22i01BV25VTo-rfKVIh9tTif0qzsTbV1jsP9dvaaHgfHn
 MGU4z6FJ4xGeDELkQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekhedgvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:PHNTYvZzOk_XZqRSL1dq7pl9EiVDKF3NXhGIfuf_vYHDleBDU7ez6w>
 <xmx:PHNTYuXPvb_FyNPv_X2NFeZXfz0L3js9LLFEYQGq_mnLXHRWZ1p7bA>
 <xmx:PHNTYtkG-aWJApj1Q8aGUtJM9YaqI04HgA497iwTRQfmVs-ocVBrfA>
 <xmx:PXNTYi_0nkeCzyYbQid88OAoZh7YIm9qjOhjgsvMflq4_epZm4s_-w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 040DF15A005F; Sun, 10 Apr 2022 20:15:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-386-g4174665229-fm-20220406.001-g41746652
Mime-Version: 1.0
Message-Id: <41242dce-15e6-471e-bb44-bf8659175045@www.fastmail.com>
In-Reply-To: <20220407075734.19644-2-dylan_hung@aspeedtech.com>
References: <20220407075734.19644-1-dylan_hung@aspeedtech.com>
 <20220407075734.19644-2-dylan_hung@aspeedtech.com>
Date: Mon, 11 Apr 2022 09:45:23 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Dylan Hung" <dylan_hung@aspeedtech.com>,
 "Rob Herring" <robh+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>,
 "Andrew Lunn" <andrew@lunn.ch>, "Heiner Kallweit" <hkallweit1@gmail.com>,
 "Russell King" <linux@armlinux.org.uk>, "David Miller" <davem@davemloft.net>, 
 "Jakub Kicinski" <kuba@kernel.org>, pabeni@redhat.com,
 "Philipp Zabel" <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, netdev <netdev@vger.kernel.org>
Subject: Re: [PATCH RESEND v3 1/3] dt-bindings: net: add reset property for
 aspeed, ast2600-mdio binding
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
Cc: BMC-SW@aspeedtech.com, Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Dylan,

On Thu, 7 Apr 2022, at 17:27, Dylan Hung wrote:
> The AST2600 MDIO bus controller has a reset control bit and must be
> deasserted before manipulating the MDIO controller. By default, the
> hardware asserts the reset so the driver only need to deassert it.
>
> Regarding to the old DT blobs which don't have reset property in them,
> the reset deassertion is usually done by the bootloader so the reset
> property is optional to work with them.
>
> Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../devicetree/bindings/net/aspeed,ast2600-mdio.yaml         | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git 
> a/Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml 
> b/Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml
> index 1c88820cbcdf..7f43b4fe86a3 100644
> --- a/Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml
> +++ b/Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml
> @@ -20,10 +20,14 @@ allOf:
>  properties:
>    compatible:
>      const: aspeed,ast2600-mdio
> +
>    reg:
>      maxItems: 1
>      description: The register range of the MDIO controller instance
> 
> +  resets:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> @@ -39,6 +43,7 @@ examples:
>              reg = <0x1e650000 0x8>;
>              #address-cells = <1>;
>              #size-cells = <0>;
> +            resets = <&syscon 35>;

This is just the example but we should probably have it do the 
canonical thing and use ASPEED_RESET_MII from 
include/dt-bindings/clock/ast2600-clock.h

Andrew
