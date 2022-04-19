Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EA3506135
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 Apr 2022 02:52:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kj4z65kKlz2yhD
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 Apr 2022 10:52:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=aH7G+Kj+;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=qq4Z+yIA;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=aH7G+Kj+; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=qq4Z+yIA; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kj4z30w5wz2xnB
 for <linux-aspeed@lists.ozlabs.org>; Tue, 19 Apr 2022 10:52:47 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 8722D32009DF;
 Mon, 18 Apr 2022 20:52:43 -0400 (EDT)
Received: from imap49 ([10.202.2.99])
 by compute3.internal (MEProxy); Mon, 18 Apr 2022 20:52:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1650329563; x=1650415963; bh=Q+UkHYdRY4
 bcWoKWy81Uw5N+ObVEnpsmv3BsOG7SVlk=; b=aH7G+Kj+oeomJwlrgT2E3AJXry
 8YkxmEVKmE0X7dI29BFoP9NBD8QRXwYyu6AarfOZS2wqmNTtvpPtdVm4mOBphmv3
 +EW0JKSI2k3bykPok/8KwFUoWVxLIbQMtod+eYe0Y60BQRFMioIRiGAMcO/gpqtj
 HJ19JmhvzWjn/ydPwXErQmcODpnVvhU0xtQZ07GYqmbc5/tPi+gXNsTfJuRi0/F+
 XFKtaWOj2B7YWmsd3R2lh1PZI1A8V5VAzCTcAr8R7zkHBoMI0O77pK/57qL1YdzT
 A2o1vVp4azgI6bioHlT25lMneSly+qInfolRo7EcP4K/C++MzrjRFVMZs28g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1650329563; x=
 1650415963; bh=Q+UkHYdRY4bcWoKWy81Uw5N+ObVEnpsmv3BsOG7SVlk=; b=q
 q4Z+yIAQLYU8S0STUBwKLCnAH2cBQwwZCJ9rK33IDNNncWX3ftiEtDSTk1vC9Z2l
 Bi75bnetzhNDOISiNj4+j70tvvfbKY5amLnY/CX78KqkR1zINfK6VQhsjdpkTUoz
 bknRyiE4wIAh+pDeUuIWP8RFwr5Ncj/tQIylJdDHBakB/rOok2JGNqoe5cXJknk2
 +HrPBPdx5iYrVaN/1VAMyFjOdVoAN8WajGRPFp6XM1ZQr9fcqd+ej0zrAQT6tuAq
 fi3OUSoK9m95bvEugShyPsrr+RW/RpZUO9s7hgDArjXE3t9JCPkHecUaBqJYHLok
 8cqyRuMXBCTM9N/VkIt2g==
X-ME-Sender: <xms:2gdeYq8fBzQTFWV-nfe5OWJk3I-iFAS3QWvzpMbvMQqPPDsIokrWPw>
 <xme:2gdeYqvTycy0Gzqmw9g373Vvv2M3XcqVfpqo2eNJDjHd9SyuKKv-rgQ1vevypX7y8
 OxykRa-VofRriQcZQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvddtvddggedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:2gdeYgAaH-lyzlXFXLi4A36Hwr4VJ1NY8FlHVVdt7R3HUe4P0EpQYQ>
 <xmx:2gdeYid-fXDe-lLgk8lIZcBX4k98dZr8eAepXAW30h6Nl8Esuxo3pg>
 <xmx:2gdeYvOE_f7NEdT366MV3Lb65oS7LGF3G0DRbZqdeWfGu7WmMltXEA>
 <xmx:2wdeYmncg7oishQfyyFkZVSjsrP5MiFOeNhtklUNNC8BfRGzzWmiZQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 44ADC15A0069; Mon, 18 Apr 2022 20:52:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-387-g7ea99c4045-fm-20220413.002-g7ea99c40
Mime-Version: 1.0
Message-Id: <74dac063-1e2a-4a67-8fc4-622795b43ee2@www.fastmail.com>
In-Reply-To: <20220418014059.3054-3-dylan_hung@aspeedtech.com>
References: <20220418014059.3054-1-dylan_hung@aspeedtech.com>
 <20220418014059.3054-3-dylan_hung@aspeedtech.com>
Date: Tue, 19 Apr 2022 10:22:21 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Dylan Hung" <dylan_hung@aspeedtech.com>,
 "Rob Herring" <robh+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>,
 "Andrew Lunn" <andrew@lunn.ch>, "Heiner Kallweit" <hkallweit1@gmail.com>,
 "Russell King" <linux@armlinux.org.uk>, "David Miller" <davem@davemloft.net>, 
 "Jakub Kicinski" <kuba@kernel.org>, pabeni@redhat.com,
 "Philipp Zabel" <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, netdev <netdev@vger.kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>
Subject: Re: [PATCH net-next RESEND v5 2/3] net: mdio: add reset control for
 Aspeed MDIO
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
Cc: BMC-SW@aspeedtech.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Mon, 18 Apr 2022, at 11:10, Dylan Hung wrote:
> Add reset assertion/deassertion for Aspeed MDIO.  There are 4 MDIO
> controllers embedded in Aspeed AST2600 SOC and share one reset control
> register SCU50[3].  To work with old DT blobs which don't have the reset
> property, devm_reset_control_get_optional_shared is used in this change.
>
> Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
