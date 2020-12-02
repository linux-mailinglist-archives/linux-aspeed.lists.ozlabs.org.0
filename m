Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBE12CC03D
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Dec 2020 16:03:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmMfq4wjWzDr0l
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Dec 2020 02:03:31 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=inplWYyf; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=Fq+VbBky; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmMfV4g0XzDqcX
 for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Dec 2020 02:03:13 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4DF59580132;
 Wed,  2 Dec 2020 10:03:09 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 02 Dec 2020 10:03:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=zKHBXpuw+WPRxYjKCr+NVoOy6HmLEmi
 pUWxQdocXY44=; b=inplWYyfQJqds7vglOwm5zUoQr2WvvTwZ81yB/6SWEAfzt4
 yyfNOxpkuC8Gho2V8At4KOUsKV3LESaha0MQQa5dEm/UcT8ailj9ZNY1kPCaOqaj
 Fh37aCFHPOB2pQLhVcqXD1X4d2oXJ7CXjuGzkIQ0Gwdta0ytwJhsWIh/HTxom0Bt
 gCC1QVNvKEpMU/OTL2tA5qQCoqZvePhEG3pcEiaJ3vNXM2Sa6tyQmH9sPDfSFHmp
 V68iVy14EvlkSFiaLVadcaCdfX1C7uyEpvqTCx9Qy6iu4WpY330rdErGufQInr6t
 +S58OJd4UF3qpt6GZ0d11EIikMwcf6BQjEDQTGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=zKHBXp
 uw+WPRxYjKCr+NVoOy6HmLEmipUWxQdocXY44=; b=Fq+VbBkybpikgWgp2qOWLZ
 gYejKwOvXLsdF7H0+DdyZb2/oH2bgEK+1ZzGR7Tb+GQgL0jsCi7+t7pjRP2pJlPe
 ooCgBttACOiSMU/fU7NiM5Ou55eQWXS2rDK+4ygx7JWnsCEWdaL2EQzSA5l72hms
 tbfyX6Mmu+WiZhlQz+ERKFiK9vqoMEt1sMXlx3aS3OzLyG2B3BDfP5v/AKLystW6
 Ppr1jmNbSzq3Qpra9VEfIT/xRZ0vGIvnAzc5WCbc6v0OnTzRLJRdN+a195mWDCD9
 sGt0hwaRdNhj2jdUDF9RzRsknSrL4fTk0QgJfk0LbH/qaAIYHiVunifURA/zVhRQ
 ==
X-ME-Sender: <xms:qqzHX1lcbG5TkCi8uQk1gkT7pXtoVu_8oYLi2EPrMRkYEia26nfdnw>
 <xme:qqzHXw1kHffEpb5fby9_o_FjulyaLKPOknZcqXqJL0b2Af3JHsCZp3JfH-71skvDQ
 RNjs7DGbUHSCSJiZw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeigedgjeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:qqzHX7qfwxhOYMJQNx5SUJDRbo2oMhBVBlkU63XiUu39paomza-F9A>
 <xmx:qqzHX1mKJx3F9u2t9pFvDHWt4oW19eJkxuQEOKTMtZXSKUavxcfovA>
 <xmx:qqzHXz2iceQ461WQJ4IKjsMPsrXx9Ku41EdyJRDEXIR_wsGyChPV_g>
 <xmx:razHX60C_AWcQXD-jkuSWLjePszNYKpAS5RXWOb-XFIy1tz3DcViaQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 7CD5CE00D4; Wed,  2 Dec 2020 10:03:04 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-622-g4a97c0b-fm-20201115.001-g4a97c0b3
Mime-Version: 1.0
Message-Id: <b6dd3a91-abe7-4e9d-b801-6e54e4c88827@www.fastmail.com>
In-Reply-To: <PS1PR06MB26008E4BCB805553EDEC45038AF30@PS1PR06MB2600.apcprd06.prod.outlook.com>
References: <20201202063612.21241-1-troy_lee@aspeedtech.com>
 <20201202063612.21241-3-troy_lee@aspeedtech.com>
 <CACPK8XcBTm8-cAPmtswHbYAf2B+PdBiZ2s1XK1UqKA_NQX_-mw@mail.gmail.com>
 <PS1PR06MB26008E4BCB805553EDEC45038AF30@PS1PR06MB2600.apcprd06.prod.outlook.com>
Date: Thu, 03 Dec 2020 01:32:44 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Troy Lee" <troy_lee@aspeedtech.com>, "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH v2 3/3] edac: Supporting AST2400 and AST2600 edac driver
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Tony Luck <tony.luck@intel.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "leetroy@gmail.com" <leetroy@gmail.com>, Robert Richter <rrichter@marvell.com>,
 James Morse <james.morse@arm.com>, Stefan M Schaeckeler <sschaeck@cisco.com>,
 Borislav Petkov <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:EDAC-CORE" <linux-edac@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Wed, 2 Dec 2020, at 19:11, Troy Lee wrote:
> Hi Joel,
> 
> Thanks for the suggestion, I'll fix the review and create an new patch 
> against 
> latest Linux branch. Those exported function will be referenced in 
> other driver yet 
> to be upstream, so should I move those exported functions out of this 
> patch?
> 

Yes, let's leave the exports out of this patch, and add them in when you send 
the patch that depends on them.

Andrew
