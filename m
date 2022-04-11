Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4628E4FB100
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Apr 2022 02:21:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kc8fB2Nltz3bXR
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Apr 2022 10:21:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=Qj22oIyb;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=DMxk6SQ5;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=Qj22oIyb; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=DMxk6SQ5; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kc8f70xyGz2xfC
 for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Apr 2022 10:21:03 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 3D5BC5C010D;
 Sun, 10 Apr 2022 20:21:01 -0400 (EDT)
Received: from imap49 ([10.202.2.99])
 by compute3.internal (MEProxy); Sun, 10 Apr 2022 20:21:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=dMiEdTDSrBn764E4EBfHcFKsyyPbkvpBbf7iT6
 mocbM=; b=Qj22oIybPUrwAFnFriLPsiQfeupXLdVNO77nwZWuyZ1Wjg33LY69AV
 Lej2CuXr6igKXL0FpVAiqX/VF5qfrZiAMlQSYm3AL/U3VB8Cshvfks74o0a3hXot
 VtoXk7YqnueY8UTNycDketQBjby9Cnl3mwurvVHLqq0jA9/XIeIzELfJ1jv4e68f
 Phq4KjuicVBcm/0yPoRBnbQhHLJ1cvVxikGYiVaJNDnHjhgSkcx4arRx73tlSUqZ
 4k22tKkNk1a3dIXoN7uUmwgMcO01AqaD6zqvoJJQ0TkogHrDYnV+aiO5m5U7LKHu
 LYdVIXMa0EmMzhLDDqBxeBXnHx6OQjAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=dMiEdTDSrBn764E4E
 BfHcFKsyyPbkvpBbf7iT6mocbM=; b=DMxk6SQ5zuql0Bxdkf2P/jpU5LeF7WZx9
 LTEXa5woboWQVHbyIx/TXQe1xPlqU3NdMi4ZsKsL0/9jVjooWPjd59M0+wSSIxaV
 w0UjIqIiVyQQEND47KCpzDp3w/tDojHTez1u9rCFThAO728t2CfI3IirW0bZfqtN
 aTrn9DhzRJKpXY4+ScdK+tvGL8P8l1It4adIohucrHQesz21d7CcN3iBCTvfUUFy
 DOCMiFsMwXZlJdqfr7Lnvu8VM4KQ9+ghSfGeeHWF+EIuG/Klxt0mvFO1EbTyLGed
 lrmPlwCNZbjKYqyIKu9DhDxpDn/MEU52YKDrTjHtNx2UVZJM5VkvQ==
X-ME-Sender: <xms:bXRTYuVaLsV-BTDJ_d1mITagVf0jOn8t6niaNtrAZCfzGtIVaXlEoQ>
 <xme:bXRTYqmNeEORfhqHywDWUabsea_XoBxhHxc_MnZ_WXpxPbR9HhCncXkxLQ3CpshW7
 EqfQZ03bTEvdI-AIw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekhedgvdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:bXRTYiZ_xiYmt15aQkzVTs8b28JHzx8GgOjJW2bYI9minAEWRvcYQA>
 <xmx:bXRTYlWzq0juFtj85oyVCCLB_7cwkfdOkglBKh_W9OgEA7U4ZsyDgw>
 <xmx:bXRTYol92Xg5BZbvN9ZeD_mqywS4PUPtAiJPBJ2ikx6j8SPktLpRvg>
 <xmx:bXRTYmnmAFUscrorQ-IqWhd5oU9OvVX2QV6tqoCu60jmQEqSuBl1Kg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 114ED15A005F; Sun, 10 Apr 2022 20:21:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-386-g4174665229-fm-20220406.001-g41746652
Mime-Version: 1.0
Message-Id: <1b708e26-264c-4b68-b6c8-c31a8d34a873@www.fastmail.com>
In-Reply-To: <20220407075734.19644-4-dylan_hung@aspeedtech.com>
References: <20220407075734.19644-1-dylan_hung@aspeedtech.com>
 <20220407075734.19644-4-dylan_hung@aspeedtech.com>
Date: Mon, 11 Apr 2022 09:50:40 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Dylan Hung" <dylan_hung@aspeedtech.com>,
 "Rob Herring" <robh+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>,
 "Andrew Lunn" <andrew@lunn.ch>, "Heiner Kallweit" <hkallweit1@gmail.com>,
 "Russell King" <linux@armlinux.org.uk>, "David Miller" <davem@davemloft.net>, 
 "Jakub Kicinski" <kuba@kernel.org>, pabeni@redhat.com,
 "Philipp Zabel" <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, netdev <netdev@vger.kernel.org>
Subject: Re: [PATCH RESEND v3 3/3] ARM: dts: aspeed: add reset properties into
 MDIO nodes
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



On Thu, 7 Apr 2022, at 17:27, Dylan Hung wrote:
> Add reset control properties into MDIO nodes.  The 4 MDIO controllers in
> AST2600 SOC share one reset control bit SCU50[3].
>
> Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
