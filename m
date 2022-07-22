Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE82E57D8BF
	for <lists+linux-aspeed@lfdr.de>; Fri, 22 Jul 2022 04:46:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lpv2d2mYlz3cFL
	for <lists+linux-aspeed@lfdr.de>; Fri, 22 Jul 2022 12:46:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=ThZybTAW;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=VDfl5yEo;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=ThZybTAW;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=VDfl5yEo;
	dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lpv2Y4YWNz30LC
	for <linux-aspeed@lists.ozlabs.org>; Fri, 22 Jul 2022 12:46:13 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 266683200A1F;
	Thu, 21 Jul 2022 22:46:11 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Thu, 21 Jul 2022 22:46:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1658457970; x=1658544370; bh=5AT+tgOaPJ
	apVfmh9DJlx7xLkwqvGnfIqciFEcsi7i8=; b=ThZybTAW4USY4pIzxpihLCuwO0
	yoYRRWFVxtBWjoUOwqg8z+Ji1ylrV347VdtkRUywBWHjkbUuSv+jMuTzBpg67xpn
	zac4c9Ym2ukCsqup7poYZzUgNJEPNq9honmhPmf6DUrRcZgqKsjLNSCGYB3GRJGI
	/vpbQ5PtdV/d7bBo7WtZL/jNHQW5uuJwm7aJ5RR/WrkWBy5AiB7fXqAU/x2PxRYu
	KpF5bHjD9u8r7v8Lr688ESeLjNdCFdg+MxUeFQNKpIGTKuCe3fi/3Mg9qwlITQWM
	fxjKPYojIJp3XiLMrMvSmFvjdPB7J7nstC6X8RGMwQKkAM1+VlH3jpEsH0Mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1658457970; x=1658544370; bh=5AT+tgOaPJapVfmh9DJlx7xLkwqv
	GnfIqciFEcsi7i8=; b=VDfl5yEoDV+wPCsks5EAoXFdIXA+nb0SBlTq3PJA2y1p
	OJnuvmIso6sN1kp63QZMCLsaWhtiwCHkvMNyFbmqFe1DWRjYBzbzASWJ1I/7CUsr
	F081gUoyikr6xrOi3itW8uXer41Uib5WIidJa5Iv64pQOfpLkGLKoTnNLnWO001g
	JeG7j1NlrFKuAUB2KJejZxiWU6iV05/CXdrL0iQOQXdmnGh96HFH2whpDBlUhy10
	wRnTyfp4JD7NYQ4m0Mgy3Js6Gp/s4Iyfw0oftFQoS8kaPrJNW1n0q39NQJbAQyQm
	4oxv7zCt1O/DB9/XCN05S7ZgYFYOrIYlFILdCeTBMg==
X-ME-Sender: <xms:cg_aYgyqWk9DNXLcaLxvZAOkGS0XmXr7yoeM-qxOEQ_2h4kR-1BwCg>
    <xme:cg_aYkRLZ7FuKK9VjiQeqjYe9ecQVDB5vl9HZw8G76SUH-TpZ2ypup2QNgNh_EVT-
    YzyZB_l9M7SRmua5g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddtuddgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
    hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:cg_aYiV8qqjva40lI0CF3iqPtF-dxmPKKrSMwttt7wZRMnlBMWvbaA>
    <xmx:cg_aYuiFH8lnez9M_kJ8NPKiQtrmvuJsUOKb45roCgeKv2dUeJz-mw>
    <xmx:cg_aYiA43tJltIfjlGxAYa4TmpQhy1v3tK1y4CmmixibgGZU-e8gyw>
    <xmx:cg_aYp6SLCAtvqAe7itjw1zsAkhUWSCP-ydjOePnJPQiePbHT0TZ-A>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 6F1FC170007E; Thu, 21 Jul 2022 22:46:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-755-g3e1da8b93f-fm-20220708.002-g3e1da8b9
Mime-Version: 1.0
Message-Id: <b5772fef-607c-46cb-9b27-8259c250648e@www.fastmail.com>
In-Reply-To: <20220529111442.182722-1-krzysztof.kozlowski@linaro.org>
References: <20220529111442.182722-1-krzysztof.kozlowski@linaro.org>
Date: Fri, 22 Jul 2022 12:15:48 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Joel Stanley" <joel@jms.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: aspeed: vegman: drop unused fttmr010,pwm-outputs
 property
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



On Sun, 29 May 2022, at 20:44, Krzysztof Kozlowski wrote:
> The "fttmr010,pwm-outputs" property is neither documented, nor used in
> Linux kernel driver, so remove it.  This also fixes warning like:
>
>   aspeed-bmc-vegman-n110.dtb: timer@1e782000: 'fttmr010,pwm-outputs' 
> does not match any of the regexes:
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Andrew Jeffery <andrew@aj.id.au>
