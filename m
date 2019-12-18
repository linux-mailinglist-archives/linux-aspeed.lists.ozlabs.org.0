Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2D11256C2
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Dec 2019 23:31:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dV9N4SVDzDqkW
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Dec 2019 09:31:36 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="fgkh+Wd1"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Ag20xibj"; dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dV93585nzDqgb
 for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Dec 2019 09:31:18 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 239BD1E0B;
 Wed, 18 Dec 2019 17:31:14 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 18 Dec 2019 17:31:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=Lzyvf/oAweCjZ5qIV56uJI0Ozerep15
 7X4x8VBFaL2w=; b=fgkh+Wd1faRZ80tV79SqEgiqfO47hlCbRGjvMXW/tF7jki9
 WynI1IF7nJLBpyfFNBrs5kB/iD9B1kZ4Zct/KVqlmhAjbOmezDRIj68BgFn9cKrO
 6zVbHOITS5uYfxQbYW64M2VcaKodkAdmf+8kBkA/mm8cEojiNaJ0rBJMWyM5iOrA
 cQ32L48NZETL5UM0mGXuk5qtld06H6KvTLd/QRZEBWK2uUjG/fMq3afcmeP2Ih1F
 6wwQweBoXijypJ+cC4RH5UgCYG4mCFKK+XeG8mS/OMQRoqwSejkVoevxOJ5J8BBd
 yxNpuEGrb4n1BnHbYP8kBZFKKwJAzpuZRUsVhCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Lzyvf/
 oAweCjZ5qIV56uJI0Ozerep157X4x8VBFaL2w=; b=Ag20xibjqHXMkA9a8aMYoI
 ymKmoMLALOwuT3RPU4NmvqWfucAiAItau1LrU6oqlFu5Yx7AnxaOgXYQMK83j5BD
 Xi1ou27OAwT6EHUZYDWbaBwW7nB4IMXpjyYFK81CtGRS9SggF7BweRFMTXZKLofv
 kCqCYoxzUG30G17iZ0lyC3lAIjCUrYlFLS1vUlnyAANTVhmi+s5Alwy696plDaFd
 E0C+9w7DORjvdmRgIErOl5NlfrXWfyzy0F1IucCKgW3Xu4ij9y72lfbNNZK4AuLs
 upfQ+Wh+GcQNPNLmDWGZvMamMOwyk6GpA6Q+MIAHaYL0ghXKPB5vJHWjuphfW6rQ
 ==
X-ME-Sender: <xms:rqj6XfEXRl9AX1MZQR9DICsNKazBcDuTVlw-GrXsNQfmXGJubEBsiA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddtledgudehkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrg
 hrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushht
 vghrufhiiigvpedt
X-ME-Proxy: <xmx:rqj6Xfa4-8pcRXygko6cwYT0kJmFx7aETOpInZFh_-vM2nBcvhtrvA>
 <xmx:rqj6XbycQMjEhwpDN8jUPmY8f2_5AiuUjH9h8oL23BayYpp2vVsdAA>
 <xmx:rqj6XZQbpq4QZV3aBoG8HOYeycBGUTb1k2zNIIiwFumDcPWv7qe7GQ>
 <xmx:sqj6XXWAf5MO83LJorjEsG5NKdLUN_wd55TeemMVrtKwttyCxseetw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id CAC89E00A3; Wed, 18 Dec 2019 17:31:10 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-694-gd5bab98-fmstable-20191218v1
Mime-Version: 1.0
Message-Id: <524f6f1c-c32d-498b-b835-ae01c338a7e2@www.fastmail.com>
In-Reply-To: <1576648806-1114-1-git-send-email-vulab@iscas.ac.cn>
References: <1576648806-1114-1-git-send-email-vulab@iscas.ac.cn>
Date: Thu, 19 Dec 2019 09:02:53 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Xu Wang" <vulab@iscas.ac.cn>, "Stefan M Schaeckeler" <sschaeck@cisco.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>, tony.luck@intel.com,
 "James Morse" <james.morse@arm.com>, rrichter@marvell.com,
 "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH] EDAC: aspeed: Remove unneeded semicolon
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
Cc: linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Wed, 18 Dec 2019, at 16:30, Xu Wang wrote:
> Remove unneeded semicolon reported by coccinelle.
> 
> Signed-off-by: Xu Wang <vulab@iscas.ac.cn>

Acked-by: Andrew Jeffery <andrew@aj.id.au>
