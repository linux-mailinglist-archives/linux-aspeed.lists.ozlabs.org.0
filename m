Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B5B4476F7
	for <lists+linux-aspeed@lfdr.de>; Mon,  8 Nov 2021 01:29:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HnX7H3WBLz2yQw
	for <lists+linux-aspeed@lfdr.de>; Mon,  8 Nov 2021 11:29:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=bERDALwF;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=lFj3OHyq;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=bERDALwF; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=lFj3OHyq; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HnX7926QDz2xDH
 for <linux-aspeed@lists.ozlabs.org>; Mon,  8 Nov 2021 11:29:41 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C3FEE5C0107;
 Sun,  7 Nov 2021 19:29:38 -0500 (EST)
Received: from imap43 ([10.202.2.93])
 by compute4.internal (MEProxy); Sun, 07 Nov 2021 19:29:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=1jp77kfuAxVjmlL4Oso1++HGrd7wy0i
 SlvG6kyF+pS4=; b=bERDALwFpaaJennT6AYLvLkbS8WZHL14V8T1PuW8nzCsUsW
 ARxVfxuxcEayevklRhKa6Cv0DCkNoOnvMJI5o6j26zHnjF3HMKsbIvLaWOukpJCE
 NVRNWusqmL4jcR8RIa7P/kJOqAX3a+Mv+pqJc2Ea9QOKfDOFM+IG5cUj0Z82M/3K
 7rzllIX7FmFnNsGgy4V76azuB98mRYzu9tK6Gyq5mGAAdBEeUFapJQ0+pX0HjfT1
 ijeCuJ6vYOxRc+5BhokXl+/AaUMylMu4sK5k1UJaWtUDH3XogivVr3y9Janxwb7C
 hpGlXREH+Zt76V3lXAIwbd0CCy4nN2QdesQdBmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=1jp77k
 fuAxVjmlL4Oso1++HGrd7wy0iSlvG6kyF+pS4=; b=lFj3OHyqTydc4B/FlO0KSd
 1/+imlqF9dsU4plUC3/GRGe5yKSXgrd0mx+uldtqHR/Yb0hdCIJfwQqYsQPLKfqp
 RawyIYCSl3ZlOxeBla41WSrYEGOzumKc3rIPd2miexczoVcTpLjXc9DND/r4WhSx
 9XozkWW+6mWSHbJRJmAiSckXDcLlfDRgG00dqTpqBPPi4Y3l6tFZz53UfqriDnOW
 gLLUoKAA+h9qpfmVAPnOUGWhF9Qs3EvI9ALP7+B68qe2CCKHdEc8KAGVrcdGhsZh
 dk4JKEfkBqaITXw+QHvZ3aY6NVPvvDg+SJUfVjCSExwuBhk6vTnZf7m9htnSiWkg
 ==
X-ME-Sender: <xms:cm-IYaXWTvR93l4RtIvTx79AXG7S578exW1aILuwRQFMwIGdDCC6qQ>
 <xme:cm-IYWm-exgdNeJ_LJ6XradmQewIbMkvng3woeSESCJPUK4dYbYvpyuWDsuMUO7-p
 P7NMiOgNXZRRLJ9Ng>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddruddugddulecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:cm-IYebA7id9ExiHpuROFQi9D1mCz8zHZF89bl3H0tOAVvyHe8Ko-w>
 <xmx:cm-IYRUy4g7zFMJYysQt7mqtY7HLy5-1kqsSlEgJ9FNHBjbGwgUAUg>
 <xmx:cm-IYUn17Syc25R2G1D6MGWnszFxZ3mAgbIcK2MLzrF0i9GlhtXBNg>
 <xmx:cm-IYTsXLCia9oPA4WyuC7FQQ7wJYTVpZrbrSVtQ2WCZs6JZthXQmA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id DC928AC0DD1; Sun,  7 Nov 2021 19:29:37 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1369-gd055fb5e7c-fm-20211018.002-gd055fb5e
Mime-Version: 1.0
Message-Id: <f2b3f804-0908-489e-8a95-65f35f4c3e61@www.fastmail.com>
In-Reply-To: <20211104173709.222912-1-jae.hyun.yoo@intel.com>
References: <20211104173709.222912-1-jae.hyun.yoo@intel.com>
Date: Mon, 08 Nov 2021 10:59:17 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Jae Hyun Yoo" <jae.hyun.yoo@intel.com>, "Joel Stanley" <joel@jms.id.au>, 
 "Winiarska, Iwona" <iwona.winiarska@intel.com>,
 "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
 "Yang Yingliang" <yangyingliang@huawei.com>,
 "Jae Hyun Yoo" <jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH v2] soc: aspeed: lpc-ctrl: Block error printing on probe
 defer cases
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



On Fri, 5 Nov 2021, at 04:07, jae.hyun.yoo@intel.com wrote:
> From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>
> Add a checking code when it gets -EPROBE_DEFER while getting a clock
> resource. In this case, it doesn't need to print out an error message
> because the probing will be re-visited.
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
