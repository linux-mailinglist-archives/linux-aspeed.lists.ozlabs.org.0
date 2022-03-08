Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1044D0CED
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Mar 2022 01:43:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCGlT1HM8z30gk
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Mar 2022 11:43:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=vLgWvuXc;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=orE9fWPw;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=vLgWvuXc; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=orE9fWPw; 
 dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCGlN6f5Xz2x9b
 for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Mar 2022 11:43:12 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 979FA580251;
 Mon,  7 Mar 2022 19:43:10 -0500 (EST)
Received: from imap49 ([10.202.2.99])
 by compute3.internal (MEProxy); Mon, 07 Mar 2022 19:43:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=kJpfgL8nFQHpOTsfeAGiwBs5xsrxSBkErE2idA
 sac0Q=; b=vLgWvuXcKsO4azkJbPKJlZP1oCR4kX+M963VAb2IusynOl5xnrvuPq
 9+ZgzzTIqnYN+M5M6CHOIH15Yx0zYFe9i6l7++Bw4nO8Qojd8rMu/e+FKVjymqpY
 edgATc9OVUETiyHYKZEAaBhGKUnKNLcG0T5+eNw6Qu37iHDW5G1nacO/qXPp8i03
 P3HAvSTPsww0q31P/ClZy1oEbcd2WTcOBs006E3qD1vANUpIqGli1m8edWXSb/ci
 N4/Ow5xxkCcSPN4Z1Jf0Habcs9tq9sdMh6f1R31EGHlEp/VVx/ah0nNxxtrWsqfq
 MAvfd322LAd8vuLW/RyQhq07DUNV7o7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=kJpfgL8nFQHpOTsfe
 AGiwBs5xsrxSBkErE2idAsac0Q=; b=orE9fWPw70PWNkbSo6y1pS7Sz2K2hdUwk
 CnORTek4F6OngCKDT4NlxKLw0fPIFN1YOHMmr9/dClojDOl1F+/LX1DpPBb8JkRi
 ggtaBbMAkBjeYW18R4JdlLdLPPCyUx+KC1M9bVZfWjyWEVU9s25h29WO9Kj7L+sc
 ocCEBLg3OKOJMMcNTkipCu6uFssQo4I8p/fkfOVCAIGwE1eVpzmIWxrWY9JBzsAe
 w/aKUcPLFJTZcl6dlMPz4TUlWtnGwOZs+10Kk6RlSoSBEPvhJfjocYjTCkr1lGk2
 K2iBJLLCUve/0WPN1I1Ln4MH2oeX1xeDQ3NsqhLVxyjt58FJFqOwQ==
X-ME-Sender: <xms:lKYmYuO9iYkwCCIQT37PKLtjxQMtEBg1Q0OLt93U-axJoYPwPhLlbA>
 <xme:lKYmYs_neX_bhLf-KrrfgW5pU9b9GlqAFnbYHo4sEX4UdiHP1DHT3T4J-edohIQZ0
 BAtm0M3peme7biMbw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudduhedgvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepudfftddvveekfffgteffffeuveegjeelgefhffejtdehtdfhlefgkeef
 hfefkeeinecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:lKYmYlQFYPmCMZVUgnpz7pgyX1IWTxjACAjSJOnOLE8BbUlcjez6tw>
 <xmx:lKYmYuso_3i_Hebehkoa8yRz58q-UOFBs4swBHeC58yfYWivf0yu2g>
 <xmx:lKYmYmdST4IxGw3zqxJn5ODOfNMSb3pabQ0Oo55RFVxYlfRuDu4TLA>
 <xmx:nqYmYgri0ELXVgLVFsNnCnHvVERPBSFAED_3zi8z7dPfViX1cCvdag>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 67142F6007E; Mon,  7 Mar 2022 19:43:00 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4778-g14fba9972e-fm-20220217.001-g14fba997
Mime-Version: 1.0
Message-Id: <d2f125d8-07d1-4bff-8718-7dfba4d8fdb3@www.fastmail.com>
In-Reply-To: <20220308003136.3930466-1-quic_jaehyoo@quicinc.com>
References: <20220308003136.3930466-1-quic_jaehyoo@quicinc.com>
Date: Tue, 08 Mar 2022 11:11:57 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Jae Hyun Yoo" <quic_jaehyoo@quicinc.com>,
 "Joel Stanley" <joel@jms.id.au>, "Rob Herring" <robh+dt@kernel.org>,
 "Linus Walleij" <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: aspeed: Add FWQSPI pinmux
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



On Tue, 8 Mar 2022, at 11:01, Jae Hyun Yoo wrote:
> From: Johnny Huang <johnny_huang@aspeedtech.com>
>
> AST2600 FW SPI quad mode only need to set AE12 and AF12, no need
> to set Y1~Y4. FW SPI cs, clk, mosi and miso pins are dedicated.

They're not dedicated according to the datasheet?

Can you please look at this patch?

https://lore.kernel.org/all/20220304011010.974863-1-joel@jms.id.au/

Cheers,

Andrew
