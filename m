Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB521400A4
	for <lists+linux-aspeed@lfdr.de>; Fri, 17 Jan 2020 01:15:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zM611NLszDrJj
	for <lists+linux-aspeed@lfdr.de>; Fri, 17 Jan 2020 11:15:37 +1100 (AEDT)
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
 header.s=fm1 header.b=nIHuqEaQ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=xFzk6qeH; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zLwb6KJ1zDrJP
 for <linux-aspeed@lists.ozlabs.org>; Fri, 17 Jan 2020 11:07:27 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A1EFB22076;
 Thu, 16 Jan 2020 19:07:23 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 16 Jan 2020 19:07:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=iVwt3LIcBpxtFQ+R6FD04TuQoW5u6ub
 4oIPG6WUenUY=; b=nIHuqEaQ/sdrRrnsOodMgfAs3fTxRyGjWwxoiqVpAMqh/Qt
 kVmSJqwZU8bxBNnsMPqiJWa3s0SHfcPlBXlASOT6jfKblehz662os+gJu2EBMeaa
 9JbzPVWSCEOyV7kFfSCx2jFlF7UAkrTFk75kwCmJGUqKByCuzo3lJi8J4IKijzOJ
 c7k5D6XTfXPB9jkSddI5Y58MeMkV2TvDbMQLvwun1uQrmEyg1n1ERely/joAyYvY
 /3+hP0wvNMi1ci8CRPAeyjIYn9okYHnAouz0og82Aidmpgq9V014K/bd6n03j5EJ
 WDa5RL8omgYZ99MzbUTm+3Dz+tQKdxdfrYSKvyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=iVwt3L
 IcBpxtFQ+R6FD04TuQoW5u6ub4oIPG6WUenUY=; b=xFzk6qeH/mvGkHHqBRPCx8
 Xy+0sptLa18T7CSAZs0gGyWF8+Puym2AKTUC9fW9XW/YqU6iMWL9KjUYN41VYBnH
 53v39rwy/b6QLXY2ltb6l+GV05GE2jYAD+dGpcjoG7sPBklxgKdqrOJf58JTaJq1
 M/SUMx5W4GAtg7AKf/yaT8CUjUvKxkx5zNxb2WmYWLDvzFyjeeMsRaol0yYoCYud
 p3EohTACIeJ85/jDuL8YXXyiKAqYyHO1XwhW2j9XCbWFOmQXw6rSa5AeWjpLGEsP
 GRkNHBSh7WpgVuLg/qYhXTy6rS2IQ8DUO100xA6YrJergIXuVpL9lYik/ljWQBog
 ==
X-ME-Sender: <xms:uvogXrsTmHavIf-jDnARkqGfVjrD6osK6CKmwH0D9y7gJRFUyY4PHg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrtdeigdduhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:uvogXjvPrn-SFp5F3ABf5eUxaaF1D1iuRGqUc7kLHp4u7khdoD_BYA>
 <xmx:uvogXnWgjI5Th7WMD_W1W_ecOgLJK6NVEFt2DlkgkYqGuEmWXAW6UQ>
 <xmx:uvogXnkPWU1OIPoNXerWWvGb2FFpP08Ba9Nafp2fogsNj56kBDjA5g>
 <xmx:u_ogXuKuvqk1CinQv_y0rRqWGw2T-enbioXnTs6QkD0pJQb3jp68Sg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id AF383E00A2; Thu, 16 Jan 2020 19:07:22 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-754-g09d1619-fmstable-20200113v1
Mime-Version: 1.0
Message-Id: <34acf604-d2e4-4efe-91ae-52b7a0dee187@www.fastmail.com>
In-Reply-To: <1579123790-6894-7-git-send-email-eajames@linux.ibm.com>
References: <1579123790-6894-1-git-send-email-eajames@linux.ibm.com>
 <1579123790-6894-7-git-send-email-eajames@linux.ibm.com>
Date: Fri, 17 Jan 2020 10:37:02 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH v6 06/12] soc: aspeed: Add XDMA Engine Driver
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
> The XDMA engine embedded in the AST2500 and AST2600 SOCs performs PCI
> DMA operations between the SOC (acting as a BMC) and a host processor
> in a server.
> 
> This commit adds a driver to control the XDMA engine and adds functions
> to initialize the hardware and memory and start DMA operations.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
