Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A3239EA7B
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Jun 2021 01:59:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzVhL2psTz2yyK
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Jun 2021 09:58:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=pOiRQdTP;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=BuGBNfq0;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=pOiRQdTP; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=BuGBNfq0; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzVhF2znXz2xts
 for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Jun 2021 09:58:53 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id C9F795C01AE;
 Mon,  7 Jun 2021 19:58:49 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Mon, 07 Jun 2021 19:58:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=ne+JsiJU5jlgktAyKhn+V+0GEp/jc8/
 x/cz2nLTaw8k=; b=pOiRQdTPDBGdHksNpl6OVYuv1QYeOqnXAUg0/jOjiyNStmL
 dGeM/5IrUVGGwl5RwwN1enzPJPk7qxCsOPskowgWI3HJw+6K3ahnjuw/UfQ9Q3E6
 gblIF8mxINy46MQDAGAbPeOOkFN3gTcUvz7puBz1WQWmjuA0bt5WIQmHEKY16fDD
 K8ivLnvcnKYVgaAqUTnF+xlhGpSjcoXgbzZLnjglDxtYtZBa5bpVtG3jHnZ+wm77
 eWpTtQkxc0iHL+dumb83IHfDD2NsusylttW6C0+vJU5KZdk3vtbnLwldd/N7+J8G
 /8YR9dJTYduru+QHneu5FYKiAgt30+A0Eb4P0Ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ne+Jsi
 JU5jlgktAyKhn+V+0GEp/jc8/x/cz2nLTaw8k=; b=BuGBNfq0Ksct3dtp8aPRUp
 wuZ++56RJgj0FtCQhWu+eKNav0en/cgDSrjmTlfDKEJgA3Vizk+jCMAH5RIa107e
 Px64jtNkYx5NjgO5G0wdgoTHGgHhwLrMZeUWk5SfUwoScwwCs04weFFhQtbmWlXe
 cC8iyR6t5ZH6BD3ioZwrcG3oBEkFBBm/yh7FVqmj7ArNRfg6wl5A9bxipmALSul6
 7m76f51IUvdCfJiMz93i5bEII0/sWeslv/ZoKgAVFjB9+ZvqmaJxAdgJZxgg5vA9
 YEy6YJV9yCZFnQAOo7UWIQOBmeP/kaqTfik7DWutouVH1WLwmqWpa2+OaDl2b/1A
 ==
X-ME-Sender: <xms:uLK-YMV1kpqIJydo2_wWy1CVr4bjalrenfWewNZMYa7d35vX8g1w9Q>
 <xme:uLK-YAk_vRVPcFsJjIPOnplcHoxZms27ejAJvAgBv6NyChc4KNStUTdl5-Pc9alYR
 nWCIv6T9v-APv9CMg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtkedgudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:uLK-YAZF4ilZfz-ldQ-WK0sA3H6OFEduirsedH1QB7JfN7liQHewhQ>
 <xmx:uLK-YLUzxjnG-KV_XOgeAXhJJ1z-f3TfboV-gJMc3b0qDqV5Ap5z0g>
 <xmx:uLK-YGlm-Ihgpi4i3jnWlFs5SoWv_1ArsEom0HqEf_0l09-9-7VeCg>
 <xmx:ubK-YNu8NMuB21Ndc-aRpEE3MXPS3wylhUBlS_F0BNwDPeR7sAH1VA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 6BD86AC0062; Mon,  7 Jun 2021 19:58:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-519-g27a961944e-fm-20210531.001-g27a96194
Mime-Version: 1.0
Message-Id: <30d321ed-cb87-4bf9-b931-7b9725e327e7@www.fastmail.com>
In-Reply-To: <20210603040906.125109-1-joel@jms.id.au>
References: <20210603040906.125109-1-joel@jms.id.au>
Date: Tue, 08 Jun 2021 09:28:28 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH] ARM: config: aspeed: Add DEBUG_FS and EXT4
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
Cc: linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Thu, 3 Jun 2021, at 13:39, Joel Stanley wrote:
> DEBUG_FS was lost way back in v5.5, and EXT4 is used by ast2600 systems
> that have MMC.
> 
> Fixes: 0e4a459f56c3 ("tracing: Remove unnecessary DEBUG_FS dependency")
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
