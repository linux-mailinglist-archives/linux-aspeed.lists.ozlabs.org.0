Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F1457D8B9
	for <lists+linux-aspeed@lfdr.de>; Fri, 22 Jul 2022 04:44:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lpv0t1VYcz3cF8
	for <lists+linux-aspeed@lfdr.de>; Fri, 22 Jul 2022 12:44:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=hUKqTsOU;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=haPlDvjU;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=hUKqTsOU;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=haPlDvjU;
	dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lpv0p260tz30LR
	for <linux-aspeed@lists.ozlabs.org>; Fri, 22 Jul 2022 12:44:42 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 7027432009ED;
	Thu, 21 Jul 2022 22:44:39 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Thu, 21 Jul 2022 22:44:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1658457878; x=1658544278; bh=XDg/JTeepS
	Y/EfsVsA29YcGjoEzuSt6+4EI1pFHO4Ok=; b=hUKqTsOU0TwjlrJwox7IMflh6r
	kewF5mXoii2LMCD3hjwUNMbjSNXB/Ih6pIuM/dyUw7EpsoH2SgQW23miDuMYFxGP
	6Lx7SvDG3v6xgxJ7pk6I+IOBDyzlJHkRiFZuVClz6xXgOrdxzeJx10QGon2Bs/Nv
	cx79Eb8Au04cneG51bEpRYrtb1ebpTyCOg7Vxsws990QYFVESlV8CkNB9pwXV4Zq
	xJnwLoJB2lrjFj+uqSx1NT6/Q8VMpR5DW0WEwSi0rfZUBCNZArF7f2l5I5l7ry4Q
	JaQRJLRVRxe9vyVg+Z9JQKiXYAlc4LxBAI5eDgwyh1xaF2i+KZPyrKRq4dQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1658457878; x=1658544278; bh=XDg/JTeepSY/EfsVsA29YcGjoEzu
	St6+4EI1pFHO4Ok=; b=haPlDvjU5HypPODSHzKRmU2me7LDxGUJvHwI9cxci+oR
	kYxs7g7Mm85zVzShl8PISQ+1ubU3uV2yCT+2hmkrWVemBi82NXcnDY71I59HlQ+B
	RZfvOYZSAw1/gkPToiJh0dydFxqLrs9eNA8hFIiYkWaprk1muhJ/VWRlXYm/4TfJ
	+PRWDS8pnlC4alfApQ+iEWSiPEqVhCRnW2TD+RucOrSHyFJJcC5OewPreX3sGPz2
	UdefW+0Rq++gb44nXku+mhYbQjMrHinutbBzvRTdeZhDpZB4TQNIgS0w1dkhvz3d
	TBv8VxBvR++YCKbd2Z8UPlMvEG+P0mMBB/+JX1HTIw==
X-ME-Sender: <xms:Fg_aYqY_iqMWKlvXKcWFMBdXmIsCypGAhiAXful8Ys4q_qfmhENRig>
    <xme:Fg_aYtZZCsD7rwXolJPsfJYOeVVM25zZTw1X6LRKpEXljur5FA5vNv_PUHgyLkjYW
    y9s3caf4Yb5McsNUw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddtuddgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpeekvdekjeekgfejudffteetgeejkeetteduvedtffdtledutdfhheev
    feetkeeiteenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:Fg_aYk_cxm1gILvNSOsK34Pc2Ot13N7i-AnJewQqzke696sNXwqp7g>
    <xmx:Fg_aYsozUkfp5XNzAHGHR07z6vSfKgu1B3jN8gMtGj2ZMXEsrIOm_Q>
    <xmx:Fg_aYlpNA1-F_WMBTuD3PAZObquz0xy44JREULwYqXUrT21muFnJVQ>
    <xmx:Fg_aYg3b4xTjTdxqJDZoEQtUdqbIQ64NMw0iVATOLlPBs78c8miatg>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id B8CC9170007E; Thu, 21 Jul 2022 22:44:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-755-g3e1da8b93f-fm-20220708.002-g3e1da8b9
Mime-Version: 1.0
Message-Id: <580e2700-e4e5-4226-beb5-d21d815acdb3@www.fastmail.com>
In-Reply-To: <20220529104928.79636-7-krzysztof.kozlowski@linaro.org>
References: <20220529104928.79636-1-krzysztof.kozlowski@linaro.org>
 <20220529104928.79636-7-krzysztof.kozlowski@linaro.org>
Date: Fri, 22 Jul 2022 12:14:18 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Joel Stanley" <joel@jms.id.au>, "Arnd Bergmann" <arnd@arndb.de>,
 "Steven Lee" <steven_lee@aspeedtech.com>,
 "Ken Chen" <chen.kenyy@inventec.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] ARM: dts: aspeed: centriq2400: use qcom compatible
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
Cc: David Wang <David_Wang6097@jabil.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Sun, 29 May 2022, at 20:19, Krzysztof Kozlowski wrote:
> "qualcomm" is not a documented compatible and instead "qcom" should be
> used.
>
> Fixes: 3719a1b13056 ("ARM: dts: aspeed: Add Qualcomm Centriq 2400 REP BMC")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Andrew Jeffery <andrew@aj.id.au>
