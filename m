Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B16654E4E
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Dec 2022 10:26:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ndhcp654tz3bfD
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Dec 2022 20:26:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=niU7svzV;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=QxayEW/B;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=niU7svzV;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=QxayEW/B;
	dkim-atps=neutral
X-Greylist: delayed 340 seconds by postgrey-1.36 at boromir; Fri, 23 Dec 2022 20:25:51 AEDT
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ndhcb0H44z301F
	for <linux-aspeed@lists.ozlabs.org>; Fri, 23 Dec 2022 20:25:50 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id A97A45C00A5;
	Fri, 23 Dec 2022 04:20:03 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Fri, 23 Dec 2022 04:20:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1671787203; x=1671873603; bh=M+6COqzQYI
	XW6ZOUy2jNQWK2FQc+a9kWelFC6cvWJho=; b=niU7svzVF1fVm7tS4MPGwG0Ud1
	Gfbuy7kRzYZYHPXVZ17oeOc9uUCGRvN/wgSR0aesm+hUQs0vK4kuveTFFNIlsO/s
	x7ATSU90HQ5RXfo9VLvHgTgzkKxbUC1lTxyA/2ZwBxsbsuLfVmYIZxiqtcOBoUwQ
	31iEchwN/4YOqMj5FHrZx8X3lJ3gJmT7Jq8wTWDBoajQOby4JWudvBum5C2FJM+K
	zIQTLam/FOTXtmHF/qFYSWohi6QSMv3V7Nk1sCuegUUfDAkoGrHkXGZDcYySQ2Vm
	RShyynYGiRLrEb6LaNNmBl4prKFMoHojDALi3FyYyHTmAyQBGwPkyy3FhUtg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1671787203; x=1671873603; bh=M+6COqzQYIXW6ZOUy2jNQWK2FQc+
	a9kWelFC6cvWJho=; b=QxayEW/BTWKyRW/Aer/gR/uPHa1rGsq43oH9fv0RDrBo
	WSby7fSayNPjEhO67YrhGG1SVxo3N5vxgRoIZ0F2XzOpmOeVg+W2ThKbvahQnx62
	ZnjuI3Ha0KBKKRewzE2/WTsfxLF3ks1i0+yY8fBr1o/i86wPWweE0GBw2K2rm0HF
	U6AWZ114rhrF1J1hM1CNDCBPHr3CnY+7EKWQ8cqeLaHnHGOmiLB4dsSrxPU3zn/W
	b/GpTCAnPXmngMuAzBRDp0gcnqkuUNGyvlmjY6c+lmVB6QgBwO4KdiUkkS4ED78J
	xtMEKu/r9M9lCjQOwXIEbpmKKAVK2OGxNsmyvtPlmw==
X-ME-Sender: <xms:wnKlY-iXmMd-rYecRkd-VBHiEsU6NiiALRAsIhcli_YCGGkwjabl7A>
    <xme:wnKlY_A5SZby9fC0g53xj6-bOW13Y6GNYDEtvIb9t4562xEHiOAOh-86Uu3DGwVfA
    7yIL4EHqp1Oi830zQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrhedvgddtvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhepvdevvdeiueetheeiffdthfejvedvteffvefghffhueduffehvdekfeev
    ieeujeelnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:wnKlY2Gj20dv5kOeSv1EIlRs1428j4JI6ceCBJJYpjdngdeORWjdQg>
    <xmx:wnKlY3Qine1TWDA5v3JjmWZdrLrXnQaueuekKE00OC9hJ1K_r6MK4w>
    <xmx:wnKlY7ynD_DN-zm57U4AyThnLMW6UV0uxDURUZBzTCw08YxczBkElQ>
    <xmx:w3KlYywgNe6591_rZHwH2AIqKKCZbfMxX7NC5vDejMi8DqHkz7ef6w>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id B629B1700089; Fri, 23 Dec 2022 04:20:02 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1185-g841157300a-fm-20221208.002-g84115730
Mime-Version: 1.0
Message-Id: <48b73b96-58a8-43c1-a7ec-dd6e636a66c3@betaapp.fastmail.com>
In-Reply-To: <20221221-lanyang-lable-fix-v1-1-eb6e11eb4a6c@mricon.com>
References: <20221221-lanyang-lable-fix-v1-1-eb6e11eb4a6c@mricon.com>
Date: Fri, 23 Dec 2022 19:49:32 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: icon@mricon.com, "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH] arm: lanyang: fix lable->label typo for lanyang dts
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
Cc: linux-aspeed@lists.ozlabs.org, Jens Schleusener <Jens.Schleusener@fossies.org>, devicetree@kernel.org, Konstantin Ryabitsev <mricon@kernel.org>, linux-kernel@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Thu, 22 Dec 2022, at 05:57, Konstantin Ryabitsev via B4 Submission Endpoint wrote:
> From: Konstantin Ryabitsev <icon@mricon.com>
>
> Fix an obvious spelling error in the dts file for Lanyang BMC.
> This was reported via bugzilla a few years ago but never fixed.
>
> Reported-by: Jens Schleusener <Jens.Schleusener@fossies.org>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=205891
> Signed-off-by: Konstantin Ryabitsev <icon@mricon.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Thanks!
