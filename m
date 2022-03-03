Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B30044CCA0E
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Mar 2022 00:31:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8nLs3Dd3z2yKQ
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Mar 2022 10:31:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=QT6sA6M0;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=HEb4ozNN;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=QT6sA6M0; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=HEb4ozNN; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8nLh2L1Nz2xKK
 for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Mar 2022 10:31:39 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 3022F5C014E;
 Thu,  3 Mar 2022 18:31:35 -0500 (EST)
Received: from imap49 ([10.202.2.99])
 by compute3.internal (MEProxy); Thu, 03 Mar 2022 18:31:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=1z+e3RdeO+vwh3xrS8VKwYNZgYfo95qWmDpYzZ
 e2EB8=; b=QT6sA6M0iMstsBlzi4otXD+Z3djNGUweSEw+SXmxNq7tcJ4iy8j/gN
 ZviDFcONXLiZe1fmYhD2z4Q6Ry4Cud4vczNiRWNP8H2udHUOPE+93YVNDDExvnjF
 S0cuDKqJFKg/yuLh9DhEz8/lV566lDILQCKMvjkWNxcnxRgaSvk5IKfiw+qvD/4j
 q/6x8GDs2XoNIwDZlpasxJXaSY0/eLibRJq464lG4ashf/YJwv+4LKo4g/y2fptm
 dxDrxWl5rOz8GI9tWfHXEq5p7EgUfsHFSuv0Hk5inVipJfTCvkMJqJz2+M0DrFqV
 JNyVqDXtCvhL8sCPoNzWWSjBanZmLr8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=1z+e3RdeO+vwh3xrS
 8VKwYNZgYfo95qWmDpYzZe2EB8=; b=HEb4ozNN/BoUhoEV44Bus9a3PWua1X2qh
 zBLqdYuFyYSfkxRawkskOd8VLqbfvsBQ+QT4jwsF9Gr17w+c8OoOU5p+oG0DK53J
 kPikXN0zQQriNe3M7gBnkLGnvoiD/zpYzDhLBk/gRz315N/jFe2f/rYcBItnKiOE
 5BmIbovJxNJ09MF7/D0azKk43KNH04kj9uQAFuK3eqYdj6n+Nlbv5g0aZGWmRHkd
 a2m3UWBfzDvOcCaehbDPYkMetuS6oTeXp0Ti2EOe5sBc0UIc11dhsmCcr6zgBdFm
 eSvVOIlVp5Xgm2yuFRvChgatCne11TcbTftvoN0Kt8lfXs28NgWLw==
X-ME-Sender: <xms:1E8hYjIJunv7uvi_f5Un-JN9q9U3rMvX78RJ2d0M77H2maqRhBMMyQ>
 <xme:1E8hYnLyhvASH6H83PA-YTzj1RY-mjnj19ne_2QIB2nUrCpgeValBOTH3sgWqMG4p
 -OBUKYJVUPWUG0MNQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtjedgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:1E8hYrv-v_t66erFQXNIvG9q9V1VuSlg_agJg6vkkM2XPALWXJrjVw>
 <xmx:1E8hYsbj4vIk1jp_eiMQ-NgVHDynAnCXTSfz2_bNmG0CJBciew3X8Q>
 <xmx:1E8hYqajCi4alf1rWjEEHkI_gJkGDG5Z75I4yhqnPGP1a5IPz8WFrA>
 <xmx:108hYhzqZfMKUu-aqftV17ik5vQXXGY2p7VmNPBNty2E24gqV41p3A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D6CFFF6007E; Thu,  3 Mar 2022 18:31:32 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4778-g14fba9972e-fm-20220217.001-g14fba997
Mime-Version: 1.0
Message-Id: <c9f58633-6509-4da9-b334-97191b404033@www.fastmail.com>
In-Reply-To: <CACPK8XfYRHTPz50wgNp7Q0Pi4rKVag9-bLD7kHcyKrHwHdKW7A@mail.gmail.com>
References: <20220302051056.678367-1-joel@jms.id.au>
 <Yh+w7+CdtYYJoRkh@robh.at.kernel.org>
 <CAL_Jsq+zDTfZaYf3H98rub8e-fSmtFFQ_ok=cQ3bqPojx0_Ckg@mail.gmail.com>
 <CACPK8XfYRHTPz50wgNp7Q0Pi4rKVag9-bLD7kHcyKrHwHdKW7A@mail.gmail.com>
Date: Fri, 04 Mar 2022 10:01:08 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, "Rob Herring" <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: gpu: Convert aspeed-gfx bindings to yaml
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Fri, 4 Mar 2022, at 08:05, Joel Stanley wrote:
> On Thu, 3 Mar 2022 at 19:34, Rob Herring <robh@kernel.org> wrote:
>>
>> On Wed, Mar 2, 2022 at 12:01 PM Rob Herring <robh@kernel.org> wrote:
>> >
>> > On Wed, Mar 02, 2022 at 03:40:56PM +1030, Joel Stanley wrote:
>> > > Convert the bindings to yaml and add the ast2600 compatible string.
>> > >
>> > > Signed-off-by: Joel Stanley <joel@jms.id.au>
>> > > ---
>> > >  .../devicetree/bindings/gpu/aspeed,gfx.yaml   | 69 +++++++++++++++++++
>> > >  .../devicetree/bindings/gpu/aspeed-gfx.txt    | 41 -----------
>> > >  2 files changed, 69 insertions(+), 41 deletions(-)
>> > >  create mode 100644 Documentation/devicetree/bindings/gpu/aspeed,gfx.yaml
>> > >  delete mode 100644 Documentation/devicetree/bindings/gpu/aspeed-gfx.txt
>> >
>> > Applied, thanks.
>>
>> Uggg, now dropped...
>>
>> What's Documentation/devicetree/bindings/mfd/aspeed-gfx.txt and also
>> the example in Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml?
>> Please sort those out.
>
> I think the aspeed-gfx.txt can be deleted. And the example in the
> pinctrl bindings needs to be updated with the required properties.
>
> Andrew, can you clarify what's going on with those other files?

Looks like you'll just need to paste your example from 
aspeed,gfx.yaml into the pinctrl yamls to replace the existing gfx 
nodes.

Andrew
