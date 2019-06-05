Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B289F35503
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Jun 2019 03:31:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45JWV65zb3zDqVn
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Jun 2019 11:31:42 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="boT0MTed"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="nHnOcozc"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45JWV15573zDqGP
 for <linux-aspeed@lists.ozlabs.org>; Wed,  5 Jun 2019 11:31:37 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 42D9B2210C;
 Tue,  4 Jun 2019 21:31:35 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 04 Jun 2019 21:31:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=/EWPTD+qPhbo26yslb0jEUCcDXDMMu1
 NnNiOXIfrmYs=; b=boT0MTedmWfzg2/ZwHtHcIzKC88eMJIH1TBFvYMWGGyp2k7
 LWPB/f+rs4b64hobSCMp0hEKoxurYgVnn2tDiBoAyDx0lGX3k3ifyBjmw83Sjc7H
 XC69+6x+vNq0sAWcOjiITwhfJmD07+oM7uktT6iKtt1Edbi6H3/vuzwFL8KqsZIB
 EoBUuEnKzQelyDOy+QTQQyWju7pG3xnnfGgifn+sWohI820PQnO7e8A0AuFKIiz8
 gkxrOCAzxj1C+U9ZPF4Gug29Vdsn/TWj5s+Esv1LZ7AtC96omHcFiMkI3+EVt4kc
 Ef+CzW4BlVYoeHjTZZSupK1yUEXPD06O55eSqOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=/EWPTD
 +qPhbo26yslb0jEUCcDXDMMu1NnNiOXIfrmYs=; b=nHnOcozcPFEf9vG5q6SnWj
 YZSn4aKnrJxEFBYwWWSoegyN1r1P0tSrIBxpNXo28A8B2AvD3sMQKNjlBHvXE0vF
 0yaM+RaFdqp2a9GFDOrgjQe629+RihqbMQhPdZA+fzjooUgBKicz64A3wa1S4MHE
 2cWzsyZXOxbsJV4AV4kh4qlDQTLweAQOxQ/q4U225hek9hQcSFHGvhiUafzwQz1a
 Lgvvlx4OxyEavLvDnh5YGHHD8s8BIQSkHcW+cwhC1+1RDCPMDDz1SVVzaKgA6QpR
 vHuwgWmrvnjiVbI0iGw0QVTBuhUiz1V0tgvD94kL7OpBQrH00Y4FCSlbZjbI/n0w
 ==
X-ME-Sender: <xms:dxv3XLLTDJYG3VKEMWs3peYBBm4nBR81-bZeQS_uXgUtFJ5tXL6luA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudeguddggeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:dxv3XLxaXCrBaekgEdwOU76V4Zn0iJNmAf4JDTx1ZRCtYPhAFHRJNg>
 <xmx:dxv3XKHvR1RCQT7lVHvqiwUW6YHZLrIf0WzfTZ-shuF0ga7uLRfzYQ>
 <xmx:dxv3XORD5ecn5hP5-2ugGVLfahXiDZNTKxvLFGAeW2jIj2661VTP2g>
 <xmx:dxv3XFsOw_IZvKkPJO-NMnMhaSk6iYiiGCLnzzVNGu1TiWFxg70lOg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id EDB92E00A1; Tue,  4 Jun 2019 21:31:34 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-650-g74f8db0-fmstable-20190604v3
Mime-Version: 1.0
Message-Id: <b899d98e-6f13-4728-9a62-3228ae7a2021@www.fastmail.com>
In-Reply-To: <1559684524-15583-1-git-send-email-hongweiz@ami.com>
References: <1559684524-15583-1-git-send-email-hongweiz@ami.com>
Date: Wed, 05 Jun 2019 11:01:34 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Hongwei Zhang" <hongweiz@ami.com>, "Rob Herring" <robh+dt@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>, "Joel Stanley" <joel@jms.id.au>,
 "Linus Walleij" <linus.walleij@linaro.org>
Subject: =?UTF-8?Q?Re:_[PATCH_1/3_linux_dev-5.1_arm/soc_v2]_ARM:_dts:_aspeed:_Add?=
 =?UTF-8?Q?_SGPM_pinmux?=
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Wed, 5 Jun 2019, at 07:12, Hongwei Zhang wrote:
> Add SGPM pinmux to ast2500-pinctrl function and group, to prepare for
> supporting SGPIO in AST2500 SoC.
> 
> Signed-off-by: Hongwei Zhang <hongweiz@ami.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  arch/arm/boot/dts/aspeed-g5.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
> index 85ed9db..8d30818 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -1321,6 +1321,11 @@
>  		groups = "SDA2";
>  	};
>  
> +	pinctrl_sgpm_default: sgpm_default {
> +		function = "SGPM";
> +		groups = "SGPM";
> +	};
> +
>  	pinctrl_sgps1_default: sgps1_default {
>  		function = "SGPS1";
>  		groups = "SGPS1";
> -- 
> 2.7.4
> 
>
