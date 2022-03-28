Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C254E8C8A
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Mar 2022 05:18:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KRdFr1bLCz3c1p
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Mar 2022 14:18:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=F0W395aj;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=euMmnYVW;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=F0W395aj; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=euMmnYVW; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRdFm6401z3050
 for <linux-aspeed@lists.ozlabs.org>; Mon, 28 Mar 2022 14:18:52 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id ECDFA5C00EF;
 Sun, 27 Mar 2022 23:18:50 -0400 (EDT)
Received: from imap49 ([10.202.2.99])
 by compute5.internal (MEProxy); Sun, 27 Mar 2022 23:18:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=pfZHfvAJmaQjzh3ouAxsdllOR8zMkbNxVRYYDi
 a32x0=; b=F0W395ajoOVLUuMh6pwmk5t44jF2VONxqhjSbgO/KWsW/xC/oF93kg
 sadEdE7aMtcD9To2po8wgYyLHGrhZSHb9/tkiBGM8TKsSTDE7GdAQVwFfJQytL9R
 R1oP9XhI/Ie9LvC6LronX3fLUNA0TnRWB6PwFN/pTLGOwxBTaXxfjR1sEPP6kcTA
 cLDGV85ujke3VqKRNsFBCNvazWiVkUJqscN5Y2OrFeoheJUr3Uq9+n8NdPcQUHol
 Rs7Nt7VQtKpDfYsDNvX3+P6Dm0bLcrByh5/eK0R7Hob3SstIPtlN29aVOBLxFKYJ
 SK4ZkAcXmoi6ZEP6HOT1cEw6m4MCLJ6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=pfZHfvAJmaQjzh3ou
 AxsdllOR8zMkbNxVRYYDia32x0=; b=euMmnYVWF6vTgi7YI2m6vhyRP27Icektw
 mTLublW5cH2IjFedOGu5cV9KN9i4GoC7GH7RbxGetWnYShtR//MRVDqSphi0LVNY
 y6DoMmkXhZQBHgY+6WIOJGWwwj7VYXID1I1Ll5dcSnZ/MF8HmzOX9P/SIkgiokYb
 vj4YZVS2+cSyCKe5mJ7SaDTjqMlUrtqrqkjMF3wcaig4KgVjueOGqaI6r+eOTyGj
 WKGRfyJ15bH9rEYlXNSzZfwjashONvdTpGXrpkBcVVihu332wfduBpLi8F0hjRaF
 XerNfObbmfSsPRBBCnXXvny8nT8pWmQftRSOkVKIp07kN9iLgNxEQ==
X-ME-Sender: <xms:GilBYul4sjD4-HyPd-2hVnfLisJJeW6jQqjYjkX_0P9fp8diQJ-Oew>
 <xme:GilBYl3tYOF8V-bYfa3rEu9Me9JecjdcyAxryqxTQy6SmAPCoLt4ONUXpr02ScG_o
 bi2X573iqF112yASw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehiedgieelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:GilBYsr2onqt2wih8iK97gtqDmOXh-4-wgz96KwB2RTSuXMsZzUnIg>
 <xmx:GilBYin8N5QDm3veyTJCxDgEGRigddbqZ9uG1SKwi6auK22XJ4D2Cg>
 <xmx:GilBYs33cqh3Hj4jW3KAMvK2a8OOH2NmkaTWbPStnoYqrCRQs1YatQ>
 <xmx:GilBYtmIBFzpi-CxNyFnXxYS0zidsk9Y0dbVZrZoqDN2Xgg1gyZDZA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id BC888F6043F; Sun, 27 Mar 2022 23:18:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4911-g925b585eab-fm-20220323.003-g925b585e
Mime-Version: 1.0
Message-Id: <c681079b-5bc7-4c96-b68b-77214f64a165@www.fastmail.com>
In-Reply-To: <20220325154048.467245-5-quic_jaehyoo@quicinc.com>
References: <20220325154048.467245-1-quic_jaehyoo@quicinc.com>
 <20220325154048.467245-5-quic_jaehyoo@quicinc.com>
Date: Mon, 28 Mar 2022 13:47:43 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Jae Hyun Yoo" <quic_jaehyoo@quicinc.com>,
 "Rob Herring" <robh+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>,
 "Andrew Lunn" <andrew@lunn.ch>
Subject: Re: [PATCH v2 4/5] ARM: dts: aspeed-g6: add FWQSPI group in pinctrl
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



On Sat, 26 Mar 2022, at 02:10, Jae Hyun Yoo wrote:
> From: Johnny Huang <johnny_huang@aspeedtech.com>
>
> Add FWSPIDQ2 and FWSPIDQ3 group to support AST2600 FW SPI quad mode.
> These pins can be used with dedicated FW SPI pins - FWSPICS0#,
> FWSPICK, FWSPIMOSI and FWSPIMISO.
>
> Signed-off-by: Johnny Huang <johnny_huang@aspeedtech.com>
> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
> ---
> Changes in v2:
>  * None.
>
>  arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi 
> b/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
> index 06d60a8540e9..47c3fb137cbc 100644
> --- a/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
> @@ -117,6 +117,11 @@ pinctrl_fwspid_default: fwspid_default {
>  		groups = "FWSPID";
>  	};
> 
> +	pinctrl_fwqspi_default: fwqspi_default {
> +		function = "FWQSPI";
> +		groups = "FWQSPI";
> +	};
> +

This is okay once you update the binding documentation.

Andrew
