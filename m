Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F461B89D4
	for <lists+linux-aspeed@lfdr.de>; Fri, 20 Sep 2019 05:58:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ZKgv4ZtszF3pP
	for <lists+linux-aspeed@lfdr.de>; Fri, 20 Sep 2019 13:58:19 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="S8ckP3TA"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="FRHf49tM"; dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ZKgp26pyzF3mC
 for <linux-aspeed@lists.ozlabs.org>; Fri, 20 Sep 2019 13:58:13 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 0864651D;
 Thu, 19 Sep 2019 23:58:10 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 19 Sep 2019 23:58:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=AwV62kTNWV1jZgcM4jPwwCG4XtzAi+s
 qJivMwhaTchc=; b=S8ckP3TAWc1jyzr+qcZAPlqrX8KRAlPRLZKIWSF89qVSmcE
 D8BPpqg52UK5Vv2M4heoG52ODs17JYWWls0jh1lb3cnHQaC9gL3o3iYe78Dc3wNv
 1pAh5C9Rtr995F52EAhIf2D+uUcDJbBqv6k19AbWaBVo7SeNsF7c68MHgYS2hgZX
 DjnjPRh8ZfxXZTyr8xQV1IRTbJKJLCMFIIjEuTrV2KEmangiztW4r1L3Fnidsylk
 1hIeL0P48hds+PCyrcqeIJYDnFzVBu8T0xxLA8fjTSasi469bT0eBpl9ycEM8dOx
 S3T83yBYJKf6uO3qHsovZOlWwXF7le2FoTMJjvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=AwV62k
 TNWV1jZgcM4jPwwCG4XtzAi+sqJivMwhaTchc=; b=FRHf49tMarkCKSUmMeqRl9
 5TvM3gJKpOvcZDjmp7HjNRaHAmx2sEFCO8bx8ArOpkQDsssxOaBhF6jbMJfxGc0H
 Eaq2CIQo2QBaun7iXTlJtunt9SRljS2Wa98t/UK1PWN6sJ5DWd9QAtz5VdmLaDL5
 lNL+t2TASpVypuUpy6Gagt5wx0boP/CQQPwcnl66O1xzFSN2Ba9174IarvJ+QCZ5
 GGv4MvKUoPdm9jTZO4ahtikq0qord+LzqklRzuJzVeGfaJIcX0GafRmQaZIOIL90
 2NiLEcV9KHAeD3EsP6YP/HGwwHgPE+jDV61igL0RhcehhWnUHtmKamrZXRWy1/7w
 ==
X-ME-Sender: <xms:UU6EXWncKUZATjzQ6SVbRB_s1Vu0x-lp4Hclj7kEghwwxXWtq5AsfA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddugdejjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:UU6EXfuWkx0_SGevbBY3kDZos3ksb9bMIlDi1p2762yqs7MPPsbeTg>
 <xmx:UU6EXZQHoRVXKsIhuxJPSHyfLzrXjPiHK2262XMS2h6M5zuB-lNLEw>
 <xmx:UU6EXZF6OMpqJDST6zd_srIDGMmC-vTtxvtQNm91c7RdZxSy-i6OZg>
 <xmx:Uk6EXb0vLp6bK7FaIOmBMOilaAlTtAtEtwXP2hWaIB4dGmZL1yOZuA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id A3D12E00A9; Thu, 19 Sep 2019 23:58:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-238-g170a812-fmstable-20190913v1
Mime-Version: 1.0
Message-Id: <14d2f55b-c31e-4c1f-b75f-aff6b4729c80@www.fastmail.com>
In-Reply-To: <20190919142654.1578823-1-arnd@arndb.de>
References: <20190919142654.1578823-1-arnd@arndb.de>
Date: Fri, 20 Sep 2019 13:28:46 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Arnd Bergmann" <arnd@arndb.de>, "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH] ARM: aspeed: ast2500 is ARMv6K
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
Cc: linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Thu, 19 Sep 2019, at 23:56, Arnd Bergmann wrote:
> Linux supports both the original ARMv6 level (early ARM1136) and ARMv6K
> (later ARM1136, ARM1176 and ARM11mpcore).
> 
> ast2500 falls into the second categoy, being based on arm1176jzf-s.
> This is enabled by default when using ARCH_MULTI_V6, so we should
> not 'select CPU_V6'.
> 
> Removing this will lead to more efficient use of atomic instructions.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
