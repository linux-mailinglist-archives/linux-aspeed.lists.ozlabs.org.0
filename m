Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8DD4EB82B
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Mar 2022 04:04:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSqVw6BxYz2yg5
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Mar 2022 13:04:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=V9YjlGLy;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=oMOvExnb;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=V9YjlGLy; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=oMOvExnb; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSqVs0GM8z2xt7
 for <linux-aspeed@lists.ozlabs.org>; Wed, 30 Mar 2022 13:04:20 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 05AAE5C0135;
 Tue, 29 Mar 2022 22:04:19 -0400 (EDT)
Received: from imap49 ([10.202.2.99])
 by compute5.internal (MEProxy); Tue, 29 Mar 2022 22:04:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=NIpyGkqRkWw3Y7sDshii26yHD3TWoCmmcaYVoG
 pKQSU=; b=V9YjlGLyCihdgB5+0McmMEV16HZ4c5k4hZFPrgOnhEeepg6loBB6du
 IEYuCLJjrmkKs9yIqLsEyk8FNHXE/AZsF/QL/Ha7C3p6zbr1PIR7ZNNBjb7HmvKw
 6f9mP0wuIUqi4a3GwFAI3dTCZDh7BZyhBBJl864cDuO9rGWMJTdA0u4UHUBCaqnM
 rBP7L4kTw0gernM6221l1h5KJXW4ZsGtIe0ym8ZdAvhJaxJQEPIIgPvK/ccHSz1r
 EQPsq1ReErlcGlJR1/+wQTvah1P3Ca0ebRg89ln/l+wQFBsMNJj5OHl8jOsXXTzs
 SwWvWpJ1GoBDN9T6HJT9sgbU/sPLjKEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=NIpyGkqRkWw3Y7sDs
 hii26yHD3TWoCmmcaYVoGpKQSU=; b=oMOvExnb4aPcGfpOuidhjDBHQDJsjYSjN
 oFyfP3YziewV88tImNTNf0SwVsIoFMnaPGr9Ds+JfrmZybzer+NK3Jwx6ygqi/s/
 IF4QlyRe6Xx6iBi4zJaPHwK7m25P/yVcadUIcDnuRLdqTpNSNd4yka6qt64vU0o8
 cLOewl2AiXYDEmrrR+F+ol8khmL1hfa3U8XJIMAiE4c8lXGM4MFzGB7QaWjRVhx6
 nhMyqFDCecb5QvLN2bkaFji+u/aflh77HCD1yQRz2xHbkG/FUcfSH39F+BvzihTg
 JMIVhte9ukQAloO5FlUzdBE5h0kp3XfbXSVM5ONYU3bHOtc+fCkWQ==
X-ME-Sender: <xms:orpDYqzRfZbUGx1hCUbmYGDFEMy-TGmwogTUUV9RVRH4kLgOw3etiQ>
 <xme:orpDYmTqeNi60aDDPK1VOqd18p7GUX2luBsRQYbdbjOd7MyeIc8SQfZsiUiyThpqp
 pVelmVF9_q0iZm77A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeiuddgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:orpDYsX8oZES-Y63qCXx1O97hur4gUFsPtIXJ7YIFRMKgRMWJ3bQzw>
 <xmx:orpDYggKkauencbt97Du26DWo5si_ccCcEV3Bs242f0CRkkxR4VuoQ>
 <xmx:orpDYsA5aMd9wT3jwq7Mj5s_E1-yWCifOtE_bzZEBRlxoeK5wK-Fvg>
 <xmx:o7pDYsu8nFpOldp3zbcX7zg-XLLo-RWxwVTMMPMBX33Zk8fEJBVEuw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C6175F6043F; Tue, 29 Mar 2022 22:04:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4911-g925b585eab-fm-20220323.003-g925b585e
Mime-Version: 1.0
Message-Id: <5d92ed84-be77-45f2-98e9-29f9ad0d233b@www.fastmail.com>
In-Reply-To: <20220329173932.2588289-7-quic_jaehyoo@quicinc.com>
References: <20220329173932.2588289-1-quic_jaehyoo@quicinc.com>
 <20220329173932.2588289-7-quic_jaehyoo@quicinc.com>
Date: Wed, 30 Mar 2022 12:33:58 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Jae Hyun Yoo" <quic_jaehyoo@quicinc.com>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>,
 "Arnd Bergmann" <arnd@arndb.de>
Subject: Re: [PATCH v3 6/7] ARM: dts: aspeed-g6: add FWQSPI group in pinctrl
 dtsi
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
Cc: devicetree@vger.kernel.org, Johnny Huang <johnny_huang@aspeedtech.com>,
 linux-aspeed@lists.ozlabs.org, Jamie Iles <quic_jiles@quicinc.com>,
 Graeme Gregory <quic_ggregory@quicinc.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Wed, 30 Mar 2022, at 04:09, Jae Hyun Yoo wrote:
> From: Johnny Huang <johnny_huang@aspeedtech.com>
>
> Add FWSPIDQ2 and FWSPIDQ3 group to support AST2600 FW SPI quad mode.
> These pins can be used with dedicated FW SPI pins - FWSPICS0#,
> FWSPICK, FWSPIMOSI and FWSPIMISO.
>
> Signed-off-by: Johnny Huang <johnny_huang@aspeedtech.com>
> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
