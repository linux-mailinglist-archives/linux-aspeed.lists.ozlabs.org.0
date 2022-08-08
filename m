Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0190158BF2E
	for <lists+linux-aspeed@lfdr.de>; Mon,  8 Aug 2022 03:36:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1JhS1kN5z308b
	for <lists+linux-aspeed@lfdr.de>; Mon,  8 Aug 2022 11:36:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=jWLobC4K;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=xAhHkPXB;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=jWLobC4K;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=xAhHkPXB;
	dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1JhN1l08z2xGd
	for <linux-aspeed@lists.ozlabs.org>; Mon,  8 Aug 2022 11:36:36 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 3B7E75C00B7;
	Sun,  7 Aug 2022 21:36:34 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Sun, 07 Aug 2022 21:36:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1659922594; x=1660008994; bh=wPmZAZ1DOC
	5MLpgXHbfw9hWoYqDBWz9rz/oL4D0HM1w=; b=jWLobC4KPvbg4opjCJE24ctar8
	4vKMEgATegq39xYhxy79X4t94s3PuN5ZeqzIsW0IJSUM5xCZAr9LfL02pw4l7ri6
	RFhh5Kq8B9fAa1ECXD011prOSP4Sf34OF4+gRkWYv+6eYq6EF+Z44E6XdyPHlTSa
	PO6FHZAGQUknDiPWSFzZ+kNNQdq4eFqWK67+dcijI0xJHWbAMYjbPE9E+IEK2/Vn
	41kN0tNp0LdsmdfwVP2cougvStOo2j7WlGs96ntRNfM0+as5nmCHB1rkO4umYDcw
	lN5pn1cUJo/SGamyDbgCNgxC+c2dStM47RoyWRIB9tmbMAn/ckFUI1vUobrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1659922594; x=1660008994; bh=wPmZAZ1DOC5MLpgXHbfw9hWoYqDB
	Wz9rz/oL4D0HM1w=; b=xAhHkPXBvZN+cz4fYh1GTzYn27ucz3ALKXh5T4jKsh8h
	XbV7kxXcwHFSK4t1TllrLGYkW32kckvfCLPK55Dqxu8Ua+w07Z1KS4kWIrCl3Fke
	r0UFUUpp1JddC7on7aCXrLI8pof0bvOG5IWcOJRNgepedjUG0ZJmASg6GK5jWBEF
	w2rLtRBonyNWra8QUdqgdsA0SuzkyYnQwmp0DohT/pSCU/Mw4lEVhx3Egy1HbYbJ
	dkn/Zq14wWDiFC73VCDntCEl45aNjfVH+dSDWV50RALnvh3uu3RMYiD12wvAZPSI
	pOd+z8fOCmSInRyXJTIRn6dlDXZDp1qVow6G2w2Y0A==
X-ME-Sender: <xms:oWjwYr-uoWmnfz7HWwthonOruXdquO70096DnmncXZIRzw4T6Ha6HQ>
    <xme:oWjwYnsd4T7u0bkmLRT93B53kjBa65-nzDDqedk_siLeL7yh7Pr187RAoQXeb91Vo
    xob7V2J502-4BKlwg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdefjedggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
    hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:omjwYpBnGtU7Vz2r5qfUHltHtwgRTxmHc069jsaYl6exqCt3IQjwpw>
    <xmx:omjwYnfk7BJ8yqXPc5GNGOmV9Gsee9-SBTWF_J-0jc6faxCJxfrepw>
    <xmx:omjwYgP1F_C0VCb6ZZktmcgWdgbM5k3-ejjVwx9cpY9o499cEa_hFA>
    <xmx:omjwYv3blxSGTyawhohXyObalajxIa7HME0KHFMsdqwPiUgjbGGLEw>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id DAF71170007E; Sun,  7 Aug 2022 21:36:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-758-ge0d20a54e1-fm-20220729.001-ge0d20a54
Mime-Version: 1.0
Message-Id: <86969f10-9eb1-4c1e-955c-1a00890d10dd@www.fastmail.com>
In-Reply-To: <20220804092727.64742-1-krzysztof.kozlowski@linaro.org>
References: <20220804092727.64742-1-krzysztof.kozlowski@linaro.org>
Date: Mon, 08 Aug 2022 11:06:13 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Joel Stanley" <joel@jms.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: ast2600-evb: correct compatible (drop -a1)
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Thu, 4 Aug 2022, at 18:57, Krzysztof Kozlowski wrote:
> Due to copy-paste, the ast2600-evb and ast2600-evb-a1 got the same
> compatible.  Drop the '-a1' suffix from the first to match what is
> expected by bindings.
>
> Fixes: aa5e06208500 ("ARM: dts: ast2600-evb: fix board compatible")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
