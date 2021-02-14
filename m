Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A14131B335
	for <lists+linux-aspeed@lfdr.de>; Mon, 15 Feb 2021 00:11:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Df2zC5hjWz30JT
	for <lists+linux-aspeed@lfdr.de>; Mon, 15 Feb 2021 10:11:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=hzgnm4oN;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Ni6LAFxw;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=hzgnm4oN; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Ni6LAFxw; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Df2z84P9zz30HX
 for <linux-aspeed@lists.ozlabs.org>; Mon, 15 Feb 2021 10:11:00 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 8345C5C006A;
 Sun, 14 Feb 2021 18:01:33 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 14 Feb 2021 18:01:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=snkvzb1ggS9C8QvMX/GQM31i1UEdkII
 zzhRoFN4f03k=; b=hzgnm4oNsjpTvTF1J2SjNPDebm77FaH8DW3FMpjosU77acJ
 KfC9SjQKwX5lxG1sKn5D3b3/rv38TWyxY/mZhDwbk6ab7iHRvetmN0BvQSpxrL7y
 /NAtsIR1wcBNOT0cREV4cS8Rc+Gi10IH7b5I2x4BMP+2TajNEXQCDMI3XItWtLO0
 RZrFJbZVDrX1wJ5iIdvqVtTCM3iVY/n4oF7nERSVsvHG1twHwyZtqKsai3hZTssf
 X0nGUMGtPN6ycrpY9dwdOJT6sKlDwlzoIrlAPRlhB3iy9ZDAQ6n/t/NKcwmqvC7/
 beZaIe7QNLPDcIocRrSCUs6/qni4DPALkKqypYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=snkvzb
 1ggS9C8QvMX/GQM31i1UEdkIIzzhRoFN4f03k=; b=Ni6LAFxw2SmKTnf/Z98bmN
 BlhxRqroN3wpNTOCkuhn9rakGC0+bLuNuQp9O/acmTnqKgFLflCmQDfZBsfY05cN
 rj+sl2Q6Z+XWLgvmRPBS44sfJkl5szFAJEbCf/kJBsP3ZDmHqWVdWkb9vNWFKTqf
 fKdYMkccEPn6wgd3vDJ4amLCh1bZ0vGw9TunoMO8Ze4ZGxCqhE12wZb2VBInqXpZ
 +TuCY8PDqsQ6kvc61Teg713NFcUDgxGXouJQfBn8NR4SkB4n+SwTNm51pUet5Xk5
 GiWlFjRNil1ClanzA8K9mOy/vme7SFGqIhSxgvdfceoWdr7ItXRihBznj52PKhKA
 ==
X-ME-Sender: <xms:y6spYG2YeCaOstsqAcj2i5zyKWOjC-Pghbyhk-u8GcEVO3SJYrrOSg>
 <xme:y6spYJHwvAypTwqeLA2aTqx4lPVWiSJJtGrpokA8WYDiRvr6V7TDqZz_h98OJpLOQ
 nLlFbgnolF2Ds6DBA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrieeigddtgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:y6spYO4LoafffIM2J-fvhD--Ljq964Pt8zBW_hBXDcb7-O_ruRd8RQ>
 <xmx:y6spYH1Ulbg-kFmfpvHsm1oALli2htlFiqNqKXH_UbJ2jEiffsU48A>
 <xmx:y6spYJEL_UYPpCoE7WrI3BzJGD-o6NcSrHqrFa75b_vRLTDRP10U-w>
 <xmx:zaspYHOSIX9u84LCY7A5I5rKhaDteUzCs8ITC86ZxmEE7ZB7JFQGWg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C496BA00060; Sun, 14 Feb 2021 18:01:31 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-141-gf094924a34-fm-20210210.001-gf094924a
Mime-Version: 1.0
Message-Id: <78fe9c2a-aa41-45b5-b0ec-35fe77b58598@www.fastmail.com>
In-Reply-To: <20210210114651.334324-1-joel@jms.id.au>
References: <20210210114651.334324-1-joel@jms.id.au>
Date: Mon, 15 Feb 2021 09:31:10 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH] soc: aspeed: socinfo: Add new systems
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
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Wed, 10 Feb 2021, at 22:16, Joel Stanley wrote:
> Aspeed's u-boot sdk has been updated with the SoC IDs for the AST2605
> variant, as well as A2 and A3 variants of the 2600 family.
> 
> From u-boot's arch/arm/mach-aspeed/ast2600/scu_info.c:
> 
>     SOC_ID("AST2600-A0", 0x0500030305000303),
>     SOC_ID("AST2600-A1", 0x0501030305010303),
>     SOC_ID("AST2620-A1", 0x0501020305010203),
>     SOC_ID("AST2600-A2", 0x0502030305010303),
>     SOC_ID("AST2620-A2", 0x0502020305010203),
>     SOC_ID("AST2605-A2", 0x0502010305010103),
>     SOC_ID("AST2600-A3", 0x0503030305030303),
>     SOC_ID("AST2620-A3", 0x0503020305030203),
>     SOC_ID("AST2605-A3", 0x0503010305030103),
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
