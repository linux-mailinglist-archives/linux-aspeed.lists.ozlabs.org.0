Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4692119F6A
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Dec 2019 00:31:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Xbsg6cghzDqcy
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Dec 2019 10:31:03 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="cgpB9lst"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="rMYazVOw"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47XbsP33p4zDqbB
 for <linux-aspeed@lists.ozlabs.org>; Wed, 11 Dec 2019 10:30:48 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A872122627;
 Tue, 10 Dec 2019 18:30:44 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 10 Dec 2019 18:30:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=KewIFKwD0k1qZtpv8/vXSRFOEyol5yj
 yCj+BNo+n0KQ=; b=cgpB9lst8+3l5mRDQ3IEKYJP8mRmKqsQHbS9WT+5OBxKoyo
 0jbY5bLqMXyhv+ioPdmaOW17z1aU1LYJFMOaygIN1fR5C6hD0V20hMo3BT1LlzLA
 IFG7ukqYAz84x4IY5BZ9rHr/LlXmLJvlQSKl5oOyQIXoyu9JNXJMrYYJ0e9pgqtB
 wpLokJZ9pn9rf1f0jECc40WAKf9ZnJa9/w4Vckq9bRM6D2EQSHG/lWl7CrecQ8Sq
 +VmUofEt2v/MRHcRs5Jwg7oO/EILnXoFUVbuvhMpSecrKX6NlW0mqMnjx/Q3vNS3
 D0LSNz8YUsXo7Miwi1GN0zEVANPGe3tnPG+RcQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=KewIFK
 wD0k1qZtpv8/vXSRFOEyol5yjyCj+BNo+n0KQ=; b=rMYazVOwcL2T/FbaAPnmYz
 D7NeDJOu5c9BanlfZi2xOoEcLtm4Y4TD4jTiQxdZWAuyUOMFXk6pDSnknI4x38Lu
 tJ0nQ12FAqaQN/mX3vdTal8CZhXTG2aDLeOcD7e/k0ejsTrKYzvgJKQ/gZV8QM52
 kqxr/s+IfBN3UbXkFOwF4NC4IKvS1cQo1KJ7/c2jOHyXQmM2zXo+yf6MNmx/0Zyl
 MafMOJJpplZFsQpJp4jLQc5AMKLRKphdscC/UAgJhpYmBvi1Kmf5ULWutDPQs1AD
 kg6pT/Lintk1AotWOI1QaTi+SertEteS3iw/Ano7y4fGmMlkxbD3eSiKVCMLPymQ
 ==
X-ME-Sender: <xms:oyrwXbX5h3bcQzK2DXOMAW8HNHvBsiI5Cw0JFwXweYJ-nj5-eD7A0w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudelgedgtdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:oyrwXbf6xOV5QTAYLLJmzVLmiVzjJntDeC9Gxnl5X6edn89nmRNomw>
 <xmx:oyrwXWyJhlRmEslO2GvRoY6pRmofVGsNHtmrvfXGU3YZsWRoNTiHyQ>
 <xmx:oyrwXeESoUgQX5dfbVu4_HfW6xkNOCkSNstbdpHRrcXN81s-iyEDow>
 <xmx:pCrwXdf5OC7zCLBhZGpyIiWJFRlRpNyfBH46x4hEBkrV_EXNYzbu0A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 219FCE00A2; Tue, 10 Dec 2019 18:30:43 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-679-g1f7ccac-fmstable-20191210v1
Mime-Version: 1.0
Message-Id: <e8d37ccd-ffe3-4969-b2db-9519e68da086@www.fastmail.com>
In-Reply-To: <1575566112-11658-2-git-send-email-eajames@linux.ibm.com>
References: <1575566112-11658-1-git-send-email-eajames@linux.ibm.com>
 <1575566112-11658-2-git-send-email-eajames@linux.ibm.com>
Date: Wed, 11 Dec 2019 10:02:22 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, linux-kernel@vger.kernel.org
Subject: =?UTF-8?Q?Re:_[PATCH_v2_01/12]_dt-bindings:_interrupt-controller:_Add_As?=
 =?UTF-8?Q?peed_SCU_interrupt_controller?=
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Jason Cooper <jason@lakedaemon.net>, linux-aspeed@lists.ozlabs.org,
 Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 tglx@linutronix.de
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Fri, 6 Dec 2019, at 03:45, Eddie James wrote:
> Document the Aspeed SCU interrupt controller and add an include file
> for the interrupts it provides.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> Changes since v1:
>  - Remove 'reg' required property.

Hmm, I have a series that rearranges the SCU bindings to fix up some
issues we have with dtc warnings. I'm happy for this to go in now as it's
consistent with what we have as my patches are not yet merged,  but
we should circle back later.

Acked-by: Andrew Jeffery <andrew@aj.id.au>
