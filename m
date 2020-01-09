Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 318BE1352F4
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Jan 2020 07:00:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tb853n4TzDqWp
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Jan 2020 17:00:53 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=TUpA+YST; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=pYgh4MG+; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tb7v0j5qzDqWg
 for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Jan 2020 17:00:43 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C1C9D21F18;
 Thu,  9 Jan 2020 01:00:40 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 09 Jan 2020 01:00:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=Ynx/sG4Nu6QytMUoZxOmN9kX3FtDIxE
 I42xzek+Pfn0=; b=TUpA+YSTG1tGmezaZ9Ah0mNl6rxp8Ybki5q4KLihafGSdz0
 GuUuOlEF2247hWUPdze9hMGZUycaksL6VTUnk60pXHIg8sd1kjpGCZGEKRF7J26e
 mfvLZggOTBI9ZGZ6IFZRgapabYwzExHTREuyZcjX2CThxc++T/ojrlJ+rApjKuOx
 9v3kKerGLy18L5clOgZa6b4c7/GfBE3/K1Tz2Z62e7XlcTTx57tKjMoiOGv4WV6R
 dv2ed5WCpA9FI8UDmsr1JzUNEKRXM4PvOP0LO9CTpaitVjchwdglCcI5pP3jvv3O
 NqMyu5lx8UBU+fnx3vKuXe68Natiwn0CWPgYPwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Ynx/sG
 4Nu6QytMUoZxOmN9kX3FtDIxEI42xzek+Pfn0=; b=pYgh4MG+6v0x/kOzN58ZwD
 0bVlCg+bvMKnJ7HSV3dTsd9CepSbqqD5giIeoZZBaMHx2Mv7SIlLoFgtfv7QRU3e
 HLQ3OGZgtuvSwfOfJheVMQAPDMBa3SHtG+2etnMBnwkufyrXUHUkTqNZsO5uOrvn
 lqhg3exfvjV6CfiAzG7CJYSpOiWB1LNlHzMxhTVmjxUgCFNupoMt0PxkOEuJ8HdC
 5cEK6tPNWZZaUbaeYEXO2Y+nIBjMaCiTgLPzvv/5WhO/aGea8epxvvbH6hNItUdI
 OfihBIct4QIZc2uDsakv2heOp9LBoP8A4JPTVnxuJt35cnHF4ZWoklN4zrWY3EaQ
 ==
X-ME-Sender: <xms:iMEWXie_pANBnkpVJ4G9iIWhVSn1ALKEyq2jE_ZuYKEhu8L-MVBvAA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdehledgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgepvd
X-ME-Proxy: <xmx:iMEWXk8EVHkyetfY_EsZL1wQLhQeBQjFOptSNMGyVAYBpqZGWhbCSg>
 <xmx:iMEWXo_Qww5xAHrrrDWUtFRccjch_zScy46gp45C_EOn9GUp_8ndbw>
 <xmx:iMEWXjrPfJjDS8JJfVAUBmuo6aJzHGu1cPnOfhZ-hZMxZIkhXMgESg>
 <xmx:iMEWXu4fJaFzyS2ddFpjcI0zT-HJL02VY4DSGpXxjYd0z_OfiycH_g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 8D45EE00A5; Thu,  9 Jan 2020 01:00:40 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-740-g7d9d84e-fmstable-20200109v1
Mime-Version: 1.0
Message-Id: <581ff3b5-c6c1-4e29-b87c-3bd961c4e659@www.fastmail.com>
In-Reply-To: <1577993276-2184-11-git-send-email-eajames@linux.ibm.com>
References: <1577993276-2184-1-git-send-email-eajames@linux.ibm.com>
 <1577993276-2184-11-git-send-email-eajames@linux.ibm.com>
Date: Thu, 09 Jan 2020 16:32:40 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH v4 10/12] ARM: dts: aspeed: ast2600: Add XDMA Engine
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



On Fri, 3 Jan 2020, at 05:57, Eddie James wrote:
> Add a node for the XDMA engine with all the necessary information.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
