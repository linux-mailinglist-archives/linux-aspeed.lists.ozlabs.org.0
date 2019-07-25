Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 166F8742CC
	for <lists+linux-aspeed@lfdr.de>; Thu, 25 Jul 2019 03:10:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45vDfm6jsmzDqGq
	for <lists+linux-aspeed@lfdr.de>; Thu, 25 Jul 2019 11:10:40 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="mVWrDOAS"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="YXNOT5yI"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45vDfT6Z7ZzDqBd
 for <linux-aspeed@lists.ozlabs.org>; Thu, 25 Jul 2019 11:10:25 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 355FE21FBC;
 Wed, 24 Jul 2019 21:10:21 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 24 Jul 2019 21:10:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=hT6VUAYNVIFczKSf7p2tdTIbi+IZpnd
 9IggzGcLtHyQ=; b=mVWrDOAS8HG4YyOWzxSU9uDXvpp/q9weSwMs3XphM6+9j4G
 Vn5uC+KFR+gSeezq3K6biFvC0IAw7FpCTooOSKmKNt/wAmOIGai7wXCP6hi9FMwV
 fmH8aADBK+O9iw6eWc5VQG32hdB/1zZ1mvC9tM0UDGIU/zSFZatxi103lvBA9ymE
 mQ+9YepIikdaS3zI4HcrIIgvw7sGA9Tyjcp1xYkFYmPq7OTL3ZbkQAzNJAulfvVs
 7xhpucFz6WHmVQhLoXGh0yXP3ZLy2+JnWAeVz2KrKsqzaT9sVmyWFyBsHZtlC5zQ
 t7oYf4T4oExHpv6azHLECU+C+VWrVBVxlZbsH0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=hT6VUA
 YNVIFczKSf7p2tdTIbi+IZpnd9IggzGcLtHyQ=; b=YXNOT5yI7R7e/gLkcPvVid
 o6vJv1Zkzo3zG02qo1uU4TnIth2J21EgzmyreA5qLiATdqEjgJ0T6kueXsEqoe/i
 IsvDprSz7d2La5nluRvdMpESMqz0nRTnmVuEhyjza/Rib82IcNVAMn5X8x19oj/P
 kmEh2NvRgsJKNeI4s+KhWon4/qSY01J1jkmC0f9bpuBPjL1JzsJOXasrbB6PwmSw
 WH1WUJ2iTUF1UsI9V01nGwusK5uuutXuyKPK6Ellc1yd5K+2jTgTuLBzt0BSKjk5
 rrdBpjmF1XMShHCsTZFWcTwFKLIw9XPohW2++c7WPq2aMq+jos/o0maU3Yu1/goQ
 ==
X-ME-Sender: <xms:egE5XeW7kZvQ9egeyjjFPGT_Jz-3NUpb2L8A72zmWRiLgAqmafE_sA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrkedugdefkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:egE5XVFmtKPksS0mLeVK3pJ2RvFGODGVseqK6TGANCZgoLCsneqJVQ>
 <xmx:egE5XfXzjZ6F9kA-eLW9_ZC-PHaoeYesnpKn4F1US-NptTJ5WvHDWg>
 <xmx:egE5XYDE54I6zx4Fhs2E7uu7j3gLff9Nwl8ozKKchsPSAewL0xBHjQ>
 <xmx:fQE5XQp0G_y4WUSzGSGO59QkCPaZRpqRwXl2fAfSy9Z7luzJZJ4Wdw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 64D16E0129; Wed, 24 Jul 2019 21:10:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-736-gdfb8e44-fmstable-20190718v2
Mime-Version: 1.0
Message-Id: <4f6709f8-381f-415c-8569-798b074b66c5@www.fastmail.com>
In-Reply-To: <2a0c5ef5c7e20b190156908991e4c964a501d80a.camel@perches.com>
References: <cover.1562734889.git.joe@perches.com>
 <cddd7ad7e9f81dec1e86c106f04229d21fc21920.1562734889.git.joe@perches.com>
 <2a0c5ef5c7e20b190156908991e4c964a501d80a.camel@perches.com>
Date: Thu, 25 Jul 2019 10:40:32 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joe Perches" <joe@perches.com>,
 "Andrew Morton" <akpm@linux-foundation.org>, "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH 03/12] drm: aspeed_gfx: Fix misuse of GENMASK macro
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
Cc: linux-aspeed@lists.ozlabs.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Thu, 25 Jul 2019, at 02:46, Joe Perches wrote:
> On Tue, 2019-07-09 at 22:04 -0700, Joe Perches wrote:
> > Arguments are supposed to be ordered high then low.
> > 
> > Signed-off-by: Joe Perches <joe@perches.com>
> > ---
> >  drivers/gpu/drm/aspeed/aspeed_gfx.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx.h b/drivers/gpu/drm/aspeed/aspeed_gfx.h
> > index a10358bb61ec..095ea03e5833 100644
> > --- a/drivers/gpu/drm/aspeed/aspeed_gfx.h
> > +++ b/drivers/gpu/drm/aspeed/aspeed_gfx.h
> > @@ -74,7 +74,7 @@ int aspeed_gfx_create_output(struct drm_device *drm);
> >  /* CTRL2 */
> >  #define CRT_CTRL_DAC_EN			BIT(0)
> >  #define CRT_CTRL_VBLANK_LINE(x)		(((x) << 20) & CRT_CTRL_VBLANK_LINE_MASK)
> > -#define CRT_CTRL_VBLANK_LINE_MASK	GENMASK(20, 31)
> > +#define CRT_CTRL_VBLANK_LINE_MASK	GENMASK(31, 20)

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> 
> ping?
> 
> 
>
