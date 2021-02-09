Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDED5315A12
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Feb 2021 00:35:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZzlD3dmDzDvZM
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Feb 2021 10:35:04 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=HB2mdtng; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=fAJtbjlT; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZzkw5WlPzDsh8
 for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Feb 2021 10:34:48 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 9FFC75C0081;
 Tue,  9 Feb 2021 18:34:44 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Tue, 09 Feb 2021 18:34:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=U9Zw6w48RG/lc0seW4k3VhU8+BX8hNn
 0DtRVGx/HKIo=; b=HB2mdtng9yjURLAy+AHfo/W/sldH0eF5O2mnMiz5yESKgWJ
 IX8tt3NdyrOPJnc28zWyZx8rQ4PiDkOYqGthxiHNqIgN4Tc3LT/6xHGCrglHT1t8
 BCvUkbBPwIe7f9xnWleo4kqTCTIF1W7pB2Lht8Ll9ItN1Hfuk9lPnzNxKAtzGxji
 +4d3FJ8uvlvW9yCkrqY9tIEgo0wuHyTBm1v4kwAZJscKqM3f5doDETw3c5JTiC59
 0vNv1glKijoRzZro/an/FW93M/ndnIq+DAYiNomDxN/KHRVIkiVVJGnOyBnzyZ+s
 fTsqArq8hVJyHAxwYVFkJO1E6Ot1/s61umN5kUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=U9Zw6w
 48RG/lc0seW4k3VhU8+BX8hNn0DtRVGx/HKIo=; b=fAJtbjlTRUiYkaTrdzyHRJ
 a2xexNBEA9Iwnraog2zQhJTR7Z73WKqyaU+DMujx0jrUvYjIcTCna1rtcGZtjDwE
 KoSlSKzzZrrG20LCAW3kQSWQHjWfxNEsMOxOxRVih63Oq8UY39WIlYoCEh//cKHC
 cdUt/m9EWsykrCClRbCVj2dSZXQ0Sh+U0Fs/GjnyVQMyIVjW0K5ffK8m+Rr6HYFV
 LlEsXB4fNW19NUfa8AiPn4dvJZ2x8K5eRO83/6zFQ5ODEyTyTHca+HwhEeyYa4F/
 dAqrl2IxYqkcwEKf3NORYkTYLL/DViyChSFGdKVpeWNHxGtEZdV324UxeEGfIilw
 ==
X-ME-Sender: <xms:ERwjYG_jJe5zNN8tJOuJB0Lpxr0yn15ZWuc6KN9jYkxw22RIeMJVAg>
 <xme:ERwjYGuswaSM40hf2hK1DqZB8x3o58rAWY3O_MmfHzhowaZG9gsY-f5vKrG9KSiKH
 uD-QRNsfhjgCL9M-A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeigddufecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:ERwjYMDjYtuXyPVwh7A-dL23mHtNspb23FiiS9GamOdH2B5tA6jIEw>
 <xmx:ERwjYOfknPve2eUDSkO_QqhWU87GhIjQN9h3todof1jZWIpjyoCaIQ>
 <xmx:ERwjYLPErKphNU2zIpurFQ-nhXON3HtpvqjNxzGf2sLoThQRnbuHzg>
 <xmx:FBwjYAoH_ADughCFUB0hzVPu21oOcd3R-7UgIlOt9Lu7KxnvjsB0xQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 8536BA0005E; Tue,  9 Feb 2021 18:34:41 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-93-gef6c4048e6-fm-20210128.002-gef6c4048
Mime-Version: 1.0
Message-Id: <cfafac8d-5162-4024-8f23-372fac7851dd@www.fastmail.com>
In-Reply-To: <20210209123734.130483-2-joel@jms.id.au>
References: <20210209123734.130483-1-joel@jms.id.au>
 <20210209123734.130483-2-joel@jms.id.au>
Date: Wed, 10 Feb 2021 10:04:20 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, "David Airlie" <airlied@linux.ie>,
 "Daniel Vetter" <daniel@ffwll.ch>, "Jeremy Kerr" <jk@ozlabs.org>
Subject: Re: [PATCH v3 1/2] drm/aspeed: Look up syscon by phandle
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
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Tue, 9 Feb 2021, at 23:07, Joel Stanley wrote:
> This scales better to multiple families of SoC. The lookup by compatible
> can be removed in a future change.
> 
> The fallback path is for the ast2500 platform only. Other platforms will
> be added with the new style, so they won't need fallback paths.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
