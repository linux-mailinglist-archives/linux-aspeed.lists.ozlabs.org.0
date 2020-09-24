Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A118276A83
	for <lists+linux-aspeed@lfdr.de>; Thu, 24 Sep 2020 09:19:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bxmct41LlzDqTV
	for <lists+linux-aspeed@lfdr.de>; Thu, 24 Sep 2020 17:19:10 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=Fi8BNHxW; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=cb3V5sDt; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bxm8Z4JRgzDqkD
 for <linux-aspeed@lists.ozlabs.org>; Thu, 24 Sep 2020 16:58:06 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 033695C0175;
 Thu, 24 Sep 2020 02:58:04 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 24 Sep 2020 02:58:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=dNjNxVw62R7d53q/ILM63nDILnf5Eun
 Aj8+KXX3WPO0=; b=Fi8BNHxWus3iZ7XqPTH90YZkaSR9ozq/KU8mvGIcaH6bX4y
 U166gmdnrSfgHK18Bd2tnx88h5Gi2bELUY9y6mcofgkW8h/uFPKRQdip5NEKAisD
 wFdCGBtlpC3AE/mbnF8Vg/OYov9kmJplMKpLWWnkNNSm2vD3x7wLQtGygJhxKJz3
 f/3+1n3pSRD4S6UhXQsI8Oh3OBk2aercaXqDEDtDqvLHa1QM3ofT0q9Zj2bEjSbF
 cHkZVltlErKcED9/RUxMpu/EwEIPXyaRQ5pczMEx7mP/Btu8xPPm25rVy7INEql2
 tLoIy5nBty1k7a1Y5cIIho0DRvo6Q0iSyRgWM6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=dNjNxV
 w62R7d53q/ILM63nDILnf5EunAj8+KXX3WPO0=; b=cb3V5sDtDM2A6nehMUCCH/
 Ba4cdQCwBlvUEJslZKom2zxTDhly3rw8kIyexDjDeP6RNWKoGazpBffH8EGwBdsR
 R50NxVEdbiul9Bx26111C4AZu+xvodiWsIRH1o8mTruAxpOYUtMxw4SIk1LYzB4b
 S8SCAWqNDl8r6TZ9aEvhUscShK3VRZG+6ubwyewZ/z1cGgqD0XVroZzV4fV67/YB
 6lCKiQ9cJphzUFB5WTOckWbZzuGJ+IKmm3XGyWTDK/wJQ4kgDTrOPee+imicRNDo
 LSCQQL6+FHTRODXRq6Hp4JWP2eTFkd6hzUbcIhx587xy48P/Lg1ynHPN65K4hpww
 ==
X-ME-Sender: <xms:e0NsX5HujwgrfPMuc2nWBFKgXUe6qPxP19anxvz_chd6fu5sEsoiMw>
 <xme:e0NsX-X1QOnHiyJ7_lEaX8aAObTuJC2yKYSVUWqfZul_6-3uIGKcGaFXQjXR__4om
 jKu4N9hVVN9wD9tOg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejgdduuddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:e0NsX7LIEOqNjcXHnG1b8vuzdPHbhO1rupbvODnpHe3UQX1_Wd377Q>
 <xmx:e0NsX_HLcGL9n2-5bNRL0IDH9DREcpknX99hGmaIwUdGK2D8WCzQhA>
 <xmx:e0NsX_UfsX2nYj4mASWodns92YyR-j_FOudWZ58lwE0L-Zl5k_OcBg>
 <xmx:fENsX2cEYQPYUYEuqcW5nQyr6RmOehH8eli2LHinFlh_HCBl-9k3gw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 152ACE010F; Thu, 24 Sep 2020 02:58:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-355-g3ece53b-fm-20200922.004-g3ece53b9
Mime-Version: 1.0
Message-Id: <53bc663a-6788-43b2-bd4f-8336f3dd4a3b@www.fastmail.com>
In-Reply-To: <20200921091644.133107-4-joel@jms.id.au>
References: <20200921091644.133107-1-joel@jms.id.au>
 <20200921091644.133107-4-joel@jms.id.au>
Date: Thu, 24 Sep 2020 16:27:43 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, "Rob Herring" <robh+dt@kernel.org>
Subject: Re: [PATCH v3 3/3] ARM: dts: aspeed: Add silicon id node
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
Cc: linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Mon, 21 Sep 2020, at 18:46, Joel Stanley wrote:
> This register describes the silicon id and chip unique id. It varies
> between CPU revisions, but is always part of the SCU.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
