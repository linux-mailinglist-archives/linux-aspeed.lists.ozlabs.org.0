Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5281178273
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Jul 2019 01:41:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45xfTy6P3nzDqQr
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Jul 2019 09:41:26 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.229; helo=new3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="eK8A1Thu"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="pNeZHonu"; dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45xfTm6qJbzDq7F
 for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Jul 2019 09:41:15 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id C65CD108B;
 Sun, 28 Jul 2019 19:41:12 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 28 Jul 2019 19:41:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=U4RDuA+FSEF8yU1ZGRvQY82lPLeCcjf
 hhcly0ZZX73U=; b=eK8A1ThuZVoK4sXEsuVOEEhAwXkF1Yy77aDYbCW9IrJ/OYo
 n/Xq54zf6PMwyMfx+kR6Wjxy46DHAU1UqJgSiHeCNXWdBiOfDJ2aUg+TdbGCJNXi
 yvByaeGHqMHHt3+7CX6mhuUBnjjnqKvlL+HOYEIOrFtNCF9WaOq8w/d+us4s/QSE
 5G+F6AF2yLRoX8MR0YTB5Wnpz0T7KAlp1/kWKuL8iUyL+BR28Knb31AoAZPWNKIA
 LsgMqG25wyLYu2vqIJXFjC3KwyDZyB7LFortsXGniIuL4UCzfgWM3COAOmU7W64X
 WRm2hez+5RNzFeLKhYZGyIyU0sqyR3PyECBTEpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=U4RDuA
 +FSEF8yU1ZGRvQY82lPLeCcjfhhcly0ZZX73U=; b=pNeZHonuKkVktSvIThlH/V
 fYL19ZQpECOIQs61lYsbRiQT7BVt2YitAJRtljv0NPSYHnj3KlE32wRLolJg5KL8
 UshJdoM0O2VOJEWzarRdOr335PaRZlxb3zLATuhD/4LlRwGSNWy2j4n14njuSZj5
 u9vJcualcV6GIcCK/CoF87dREOmijBshNYL8B8hvXas13tWoezDwGNjMKCcLeEeH
 xoDjie8OTu5frdKQ4rh2YvtiusrBCiMKCq3c4qAEyqvfjzNw2QeDOVBpvE+U8xmm
 v+qi1Ucu35yzKfMPn7UsQX2Zin5Ad4NnHGUqVf4piNJaXMx4SFPPmagXLB7CzhYA
 ==
X-ME-Sender: <xms:lTI-Xf0D-h9NjPtChndbt_AZAEcGOgba9qUFHi71HCoRLpxCds5Hjg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrledtgddvgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:lTI-XaIJins3UcM1v_qAS1wAwJcnzQH3zB9Z9iJzd-dsfWe_JnEAxw>
 <xmx:lTI-XV1gZJJ5wfub7rrZbuhLNdfqfhc-KxeMMkbZWoy-6-Xk7KjPIA>
 <xmx:lTI-XVyjXvVm-gpkrvZRwv0CJYJOEjsyW5wxW2m5b8pmEw8-alJt4Q>
 <xmx:mDI-XVdQMfBvgBauhlEZAvpotqZ8mpaX0JOXEV8Mkk2lONrbFJDrkw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 3062AE00A2; Sun, 28 Jul 2019 19:41:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-736-gdfb8e44-fmstable-20190718v2
Mime-Version: 1.0
Message-Id: <950b8374-2a06-44fe-a1fc-87be17e7d608@www.fastmail.com>
In-Reply-To: <CACRpkdb4pEdPHbo=3+fJXe9WG8K7A2_xVMtKWCJCfEawDO5wBw@mail.gmail.com>
References: <20190711041942.23202-1-andrew@aj.id.au>
 <CACRpkdb4pEdPHbo=3+fJXe9WG8K7A2_xVMtKWCJCfEawDO5wBw@mail.gmail.com>
Date: Mon, 29 Jul 2019 09:11:28 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Linus Walleij" <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/6] pinctrl: aspeed: Add AST2600 pinmux support
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Johnny Huang <johnny_huang@aspeedtech.com>,
 linux-aspeed@lists.ozlabs.org, Ryan Chen <ryanchen.aspeed@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Mon, 29 Jul 2019, at 08:44, Linus Walleij wrote:
> On Thu, Jul 11, 2019 at 6:19 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> 
> > This series adds pinmux support for the AST2600. Some more rework was required
> > on top of the previous cleanup series, but this rework was focussed on
> > supporting features of the AST2600 pinmux rather than fixing issues with the
> > existing infrastructure for the ASPEED drivers. Due to the dependences it's
> > based on top of pinctrl/devel, so should avoid any more SPDX issues.
> >
> > ASPEED have been testing the patches on hardware, so even for an initial pass
> > there's some confidence in the implementation.
> 
> I'm unsure if I need to wait for the DT bindings to be fixed on this
> series?

Yeah, I need to, sorry for the delay. Been distracted by other stuff.

Will send a v2 shortly.

Andrew
