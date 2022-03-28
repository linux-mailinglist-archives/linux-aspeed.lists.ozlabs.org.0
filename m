Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE374E8C8C
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Mar 2022 05:19:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KRdG13XdTz3c1p
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Mar 2022 14:19:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=PWJQBl/4;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=MkEqTFdl;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=PWJQBl/4; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=MkEqTFdl; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRdFx0Fw6z2ynk
 for <linux-aspeed@lists.ozlabs.org>; Mon, 28 Mar 2022 14:19:01 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 23D3E5C00E3;
 Sun, 27 Mar 2022 23:18:59 -0400 (EDT)
Received: from imap49 ([10.202.2.99])
 by compute5.internal (MEProxy); Sun, 27 Mar 2022 23:18:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=/VcwSKrXwmG6PLNjcuTqq8RD2bfdP/TfV3BPLQ
 v4qhI=; b=PWJQBl/4M908k0+MQc3n1E7NGMaZNPhtaoSeY75JR8KkOx1TQLYQvK
 SHiCE8sa3N8vYnL6Dizs8uIEftV3FJyqh0t4kPHYyYdlPLRRxGOibmUgIOGPGmtt
 k85TJFS/4Pr/5uivB+xcpEMu9XzyeLfY/Cwo3iTmkxpKuhp0+/DOmWjAV7vP7Opu
 OTSEhlop7bG1SfgEvTtZHwQbQoJsY9phltgOwcwYmKrxjZS2B/phYtqGj/ZLh8Jh
 lq8v9wpNg+bnSLJZBLvr0OWoT6tZ3DgfVKvK1xDEFArMtQSortSHAI6JlAKhL/n/
 67JKxvjLINs/ADvU9/zRfNPWA6eRD8iQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=/VcwSKrXwmG6PLNjc
 uTqq8RD2bfdP/TfV3BPLQv4qhI=; b=MkEqTFdluXbU5SkxbxgRvijzjJeR67zSI
 cjTDWnYuugzF/sWFr+IDlI4FidXO8JDohItnO8XlcG+3CbjVXiceiT3IGl2ctuUs
 7eA2vnR1nHG4T/C9Wj/enyqChwEA3lg3ePxrFz2MzCII9s3EpCfVna1yklS9re4b
 ztRqx62362fH3wUC0gGPHNRUIPaKW5DWhAcgEQDk/+RoFg6U2KCzX9K6OAmRY373
 XA+yt24qi5lymoye1t9xhkjew1OsKEFULKRu6fIbuZNU+dd6nJJImw3DaiXN4Hiw
 wgEBRQVd/M8dVpQzvH5j3fymCIvrvf9vfP+BxTyVI0a74kPqXIfAA==
X-ME-Sender: <xms:IilBYqTdQoAVYp3Zd-EGhd5gUVXhX2keyALFjLFkOlfNIKjBUxi-uQ>
 <xme:IilBYvzSv4JPY8TQ8_Ocpgjx-rXkq9fJzUjlTZ-cYMq0vdcNmrPumdrJL1_B-vf5u
 nc_J-qbDemiGVqVbA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehiedgieelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:IylBYn2V6wKbtFVsUZejpP4THzGmlNXvX9SMxpOrD9YFoojoD-sxyQ>
 <xmx:IylBYmBgvGDqLIDWvjrTcRAumf2OTlr6nWy1HmrsYS86qTPjOVtUyA>
 <xmx:IylBYjgNj8M5F8fhRZM9XYsp3PZDDBXyYF8EK4nn65X8LA-96t4ouw>
 <xmx:IylBYuXzcrAM2of7HyWCYmvaqvBW1krPZj7WMQCQZZoMxDuxH7zxCw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E9120F6043F; Sun, 27 Mar 2022 23:18:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4911-g925b585eab-fm-20220323.003-g925b585e
Mime-Version: 1.0
Message-Id: <8a381a39-a6f9-43d6-bfc4-6cf2ae4ead1f@www.fastmail.com>
In-Reply-To: <20220325154048.467245-6-quic_jaehyoo@quicinc.com>
References: <20220325154048.467245-1-quic_jaehyoo@quicinc.com>
 <20220325154048.467245-6-quic_jaehyoo@quicinc.com>
Date: Mon, 28 Mar 2022 13:46:58 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Jae Hyun Yoo" <quic_jaehyoo@quicinc.com>,
 "Rob Herring" <robh+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>,
 "Andrew Lunn" <andrew@lunn.ch>
Subject: Re: [PATCH v2 5/5] ARM: dts: aspeed-g6: fix SPI1/SPI2 quad pin group
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
Cc: devicetree@vger.kernel.org, Graeme Gregory <quic_ggregory@quicinc.com>,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Jamie Iles <quic_jiles@quicinc.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Sat, 26 Mar 2022, at 02:10, Jae Hyun Yoo wrote:
> Fix incorrect function mappings in pinctrl_qspi1_default and
> pinctrl_qspi2_default since there function should be SPI1 and
> SPI2 respectively.
>
> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
> Fixes: f510f04c8c83 ("ARM: dts: aspeed: Add AST2600 pinmux nodes")

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
