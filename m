Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7636C4EB824
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Mar 2022 04:03:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSqTT2hC5z2yg7
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Mar 2022 13:03:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=C5ToEF7Q;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=gt36O6XY;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=C5ToEF7Q; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=gt36O6XY; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSqTN45Hvz2xt7
 for <linux-aspeed@lists.ozlabs.org>; Wed, 30 Mar 2022 13:03:04 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 749BC5C0139;
 Tue, 29 Mar 2022 22:03:02 -0400 (EDT)
Received: from imap49 ([10.202.2.99])
 by compute5.internal (MEProxy); Tue, 29 Mar 2022 22:03:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=wEpEjAf2Kyjbb2L9jqCTw9PREJ1VL23kPZArqb
 knM70=; b=C5ToEF7Q7CGQ1OXZkq8UEkufgxS1Bfd6PZRoie+huBfIu+aIvVibEj
 /coO4BSwr2AcSB7hUygWQdmFn5wPcNF8spfoNG+9MTaROoY/svN+BwAqCQ2XKAXU
 ozDJDjxQGowoF79y5i6ApYQo3em5jWs761aUtqDx3emHNdWrL0eHfJovJCplSTlY
 svVDua6DLrWoBBX5NODaMr5dTX3MZKpV5JswD7M4clwjSM0ELELdjGBQMVcc4BWX
 aSDIzoROt5TYBgsPn90Q/XejBSzCvIlpBBp/xZie/mv2VyLkdkHREl2WWVouMRdI
 VhL/ZRtbRpHRq2gL9so2pnLgfT2Jg8cQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=wEpEjAf2Kyjbb2L9j
 qCTw9PREJ1VL23kPZArqbknM70=; b=gt36O6XYnCv0vil5hQ2q+l9ALmDoV14Cy
 oW6xwnfGPjIkwU7iDwfg40rLeVRLOyu8L8pVMdX4UxJtrYM7yeejfVI5tgKo0NSe
 udS370IHohqw41YkZo4Kg/vyRQ3v6IMjaF7ivT82KdTDvMEF7oPP/I8431j9sh2Y
 d1QLHwoyEopzVRMJQsfkfcM/+vr28T+oVJ0caigFQViYrdk8sInYTjyVPWm2K/uJ
 XweK48zukM2pKdUlXv2HScj/N6mlcMLBz6YBQfjDs0pimy2+Z1OdXnnWItygfw30
 eswoh5NBHCGQ8Q+cqPvb1+gDUI/8RUo1ic+geFDmmHfDp0PA+2F+g==
X-ME-Sender: <xms:VbpDYuxZ8-IO3gKsutyqcEStLp9iXQwkil9-EM-VLscVYp0rttYcDQ>
 <xme:VbpDYqRt7RkEYIQCthRXMiAdHAuDQ-XIgqYBo78LePmmb2OFrHntYA6nfWnJY8j7M
 iLqNJuNZAaulYOI8g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeiuddgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:VbpDYgVfKZ3K8jlpziXhGeFw4md5Q-WgccpOPUVtg8FnHuI97cMK5w>
 <xmx:VbpDYkhfe0kvrXq-NOULebsBM-4nqLGDrZyU2OOiMden0CWkIAeCLA>
 <xmx:VbpDYgAGxqO_3jh9lC31ByYalNvpR-Wa0SZOcLHvoTTmePAzCCDWZA>
 <xmx:VrpDYgvixuiXdgh6kN2HDYYuxscNWh74sKqGfE1YvD-V0zu7FvMGkA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id AC094F6043F; Tue, 29 Mar 2022 22:03:01 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4911-g925b585eab-fm-20220323.003-g925b585e
Mime-Version: 1.0
Message-Id: <484751b1-86d0-40e6-b5cd-013ef076f3e5@www.fastmail.com>
In-Reply-To: <20220329173932.2588289-5-quic_jaehyoo@quicinc.com>
References: <20220329173932.2588289-1-quic_jaehyoo@quicinc.com>
 <20220329173932.2588289-5-quic_jaehyoo@quicinc.com>
Date: Wed, 30 Mar 2022 12:32:41 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Jae Hyun Yoo" <quic_jaehyoo@quicinc.com>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>,
 "Arnd Bergmann" <arnd@arndb.de>
Subject: Re: [PATCH v3 4/7] pinctrl: pinctrl-aspeed-g6: add FWQSPI
 function-group
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
> Add FWSPIDQ2 (AE12) and FWSPIDQ3 (AF12) function-group to support
> AST2600 FW SPI quad mode. These pins can be used with dedicated FW
> SPI pins - FWSPICS0# (AB14), FWSPICK (AF13), FWSPIMOSI (AC14)
> and FWSPIMISO (AB13).
>
> Signed-off-by: Johnny Huang <johnny_huang@aspeedtech.com>
> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
