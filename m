Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D0D1400A3
	for <lists+linux-aspeed@lfdr.de>; Fri, 17 Jan 2020 01:15:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zM5w4xswzDrJj
	for <lists+linux-aspeed@lfdr.de>; Fri, 17 Jan 2020 11:15:32 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=pU3O/TGz; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=sOzSyMqv; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zLpB2QZLzDrDf
 for <linux-aspeed@lists.ozlabs.org>; Fri, 17 Jan 2020 11:01:54 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 50F0D22077;
 Thu, 16 Jan 2020 19:01:51 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 16 Jan 2020 19:01:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=+4d46nAg69apB++QN888O8Q+rlJqDsK
 iGI/rETf8CM4=; b=pU3O/TGzgUZ3cp3Ae/Qw15GIvIjIhv/92V3RUdmVj6lSds/
 pXL0Z7/YbEl3E0cFfDuhfUm0ckwZwa6rxViF7OcVTGxni6emI4oQ2LLu5bswSN8l
 kZkhu81p1sWyemLn6DViC0DKSGaE39pcIzvK8ffh+7VE6Vl0o65OEtJy//REukeb
 tfGWPjc037eNB0SvKApmpr4rlcLNaIs3kxHCQbt/We8haJm600Li3uDmgU7hVlX8
 knBTLQ1X54GMJMpeGBOca1nMU2MPEGX91VPIOvtiqtxxc67osNpieHi0XjfT5VwZ
 dBSKTyp+awkXY5/upHAG3sOhdIzNmoj3V6dm30w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=+4d46n
 Ag69apB++QN888O8Q+rlJqDsKiGI/rETf8CM4=; b=sOzSyMqvMQhD65VKHv+Mg2
 pj1KC1HwCxPjpA+4oJr6HoWgigppLMyvZp51ONbGdaW4aLv+BxC+cXgeOO0f8tJs
 M+bA2zaqxHEOnEuguEWztQSxkn76/XN7r6Ju27Ti/o95F2JWH5d23Nmu7qFe+JcJ
 Q6LUSdj3elIlkPKnLfNEHq03PbgiHIOMbykFZRn7fyiYlm1oqzlWvGTH4AL8zgV3
 mzuc8nj0DQEoWbhGl1P5LH0jOiNXDl4ep8cSV4HUtrjYrdI0Ow3BVyeJSiIoKghD
 fJlI9w/q4O5btBE+JtblN0+Ghe8V0hH72S5epN/hS4HUHO1wR83yy3MbRztZhtzw
 ==
X-ME-Sender: <xms:bvkgXrwp2O7KjDadKYhXFxuD_ExIQbhRvZrHICMXQhVuzo6jm8X_CQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrtdeigddugecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:bvkgXlrTSkyde1d1nfqk5OXTTD2kEYACVJ1253A8zSxeDrdMRZKduQ>
 <xmx:bvkgXunaSZJfs2iTREwtxands2Y9uFDPHpdw4J7KZX1ze64THoavXA>
 <xmx:bvkgXoo2rAyhshiNGu-So5CQPpZawZ0EOO1diF6-5V1YCLlWB7TtAg>
 <xmx:b_kgXmn2xVH8CBc3Khf_qc91iCtNFOjCWCY0rnCuspTEJHtAa-pfeg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 7DCD5E00A2; Thu, 16 Jan 2020 19:01:50 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-754-g09d1619-fmstable-20200113v1
Mime-Version: 1.0
Message-Id: <9007a9db-5250-4ad7-b436-da26d6e1b620@www.fastmail.com>
In-Reply-To: <1579123790-6894-6-git-send-email-eajames@linux.ibm.com>
References: <1579123790-6894-1-git-send-email-eajames@linux.ibm.com>
 <1579123790-6894-6-git-send-email-eajames@linux.ibm.com>
Date: Fri, 17 Jan 2020 10:31:30 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH v6 05/12] dt-bindings: soc: Add Aspeed XDMA Engine
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
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 tglx@linutronix.de
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Thu, 16 Jan 2020, at 07:59, Eddie James wrote:
> Document the bindings for the Aspeed AST25XX and AST26XX XDMA engine.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
