Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E83BD392477
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 May 2021 03:41:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fr9Xh7025z2yhK
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 May 2021 11:41:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=uAOk8M7/;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Jp1/ResC;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=uAOk8M7/; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Jp1/ResC; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fr9Xd4ybQz2xv1
 for <linux-aspeed@lists.ozlabs.org>; Thu, 27 May 2021 11:41:53 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4AF7C580589;
 Wed, 26 May 2021 21:41:51 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 26 May 2021 21:41:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=HShTPGN305qweA3+k/g3h9Fb9JHGdhF
 iPsYEsyMmato=; b=uAOk8M7/y+c4HLrsrSG6nNXRB5p9ry3D5rAaQSG5miW64YJ
 D4/5YXbOhNXADNgbx3GqST/1L5Ii1f20mLv9f8B3K+dCUzcabUiUyMjMScefANDL
 7jC2G+y3MyXFTmG0/iLLqbplmsN53Dlav6qO0znx8FkZ7PUxK7Qy1heuh9xANjdr
 ggkBmPuXHytfDtSQy9YsZqYkBH4zFPAP8aG2cJdu7Xwd3yv1VmAiCp0MGTxbA25a
 4/uZ3rrbicMlxNx+PHxBAPJGdiQJG9LBKEYA5XMMeU1bWyOhjyMlSTsl11UAMH1a
 87EXgbwRSENJ0nJR684iMHgZKRAuE3i0cdkGCjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=HShTPG
 N305qweA3+k/g3h9Fb9JHGdhFiPsYEsyMmato=; b=Jp1/ResC9WoMLg2M4oUFRN
 +eQhYiCcqgvo0pTeWK5EfsypfI/V6qWAM1EgHp/125BmX1vBt5Ib240oVLXEHZ/k
 BouLwSVmzgWfhmkpx8M5wrJeM2HdQmj2orad4Y7vj1axYvJFCzVlFLsocrx3yu2E
 1oMJ4SXQByCPwjNtEFLKIo/77mT2/14H5Vm5VBVNnwYLmIO57OROj72vuheD4m/n
 m6Y7M8AHE92MqwnGk2dXs05fEBpicWFJhtEOi8SeDOPOLnTAbg0nLhKnlnUYb/ms
 aHPYtcQ2UgjTywNzZ5O+BpsZL+bCOF3S1vA04PMkU2qwWyaKzWZJpDlST+e+90jg
 ==
X-ME-Sender: <xms:3fiuYPBW4HoDBUI61GGh4PbGvNVT-uchY05o1Fgr2YOTYZmLDWkfSQ>
 <xme:3fiuYFjA1myrlGk7gBkZjvrupPthdiWPZam_t1pDpT_YGcjinLC1Drfdudtl7gOlp
 YP8o0ezX1K9yNFR7w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekgedggeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:3fiuYKlNv-D4qaHQUyFRfrU4bsY0Hqkv0XKA_PyG9pvxPS0C08TwBw>
 <xmx:3fiuYBxT6ft4vNAae4tpuX7zyvMhksDQREBYi6akoHtmsALhjroxUA>
 <xmx:3fiuYERPFwUV3-rR17fknnsJJgJxJQUYyiOp8m8Xn7NiB18ME_tzQg>
 <xmx:3_iuYJI6wHQuTSchgVNsM0abDzDtKVwXl8wpSyoRQ6cq5m2nJLcioA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C98C4A00079; Wed, 26 May 2021 21:41:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-468-gdb53729b73-fm-20210517.001-gdb53729b
Mime-Version: 1.0
Message-Id: <4d995f6e-b582-4f45-b87c-2cd795de8d14@www.fastmail.com>
In-Reply-To: <20210527005455.25758-1-steven_lee@aspeedtech.com>
References: <20210527005455.25758-1-steven_lee@aspeedtech.com>
Date: Thu, 27 May 2021 11:11:28 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Steven Lee" <steven_lee@aspeedtech.com>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
 "Rob Herring" <robh+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 "open list" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/4] ASPEED sgpio driver enhancement.
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
Cc: Hongwei Zhang <Hongweiz@ami.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Steven,

On Thu, 27 May 2021, at 10:24, Steven Lee wrote:
> AST2600 SoC has 2 SGPIO master interfaces one with 128 pins another one
> with 80 pins, AST2500/AST2400 SoC has 1 SGPIO master interface that
> supports up to 80 pins.
> In the current driver design, the max number of sgpio pins is hardcoded
> in macro MAX_NR_HW_SGPIO and the value is 80.
> 
> For supporting sgpio master interfaces of AST2600 SoC, the patch series
> contains the following enhancement:
> - Convert txt dt-bindings to yaml.
> - Update aspeed dtsi to support the enhanced sgpio.
> - Get the max number of sgpio that SoC supported from dts.
> - Support muiltiple SGPIO master interfaces.
> - Support up to 128 pins.
> 
> Changes from v1:
> * Fix yaml format issues.
> * Fix issues reported by kernel test robot.
> 
> Please help to review.

I think it's worth leaving a little more time between sending series.

I've just sent a bunch of reviews on v1.

Cheers,

Andrew
