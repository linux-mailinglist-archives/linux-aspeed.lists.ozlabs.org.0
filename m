Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3932C1400A8
	for <lists+linux-aspeed@lfdr.de>; Fri, 17 Jan 2020 01:15:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zM6L5KWpzDrH8
	for <lists+linux-aspeed@lfdr.de>; Fri, 17 Jan 2020 11:15:54 +1100 (AEDT)
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
 header.s=fm1 header.b=UEHhzXj2; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=bgq+qKxI; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zM4D5f3CzDrMv
 for <linux-aspeed@lists.ozlabs.org>; Fri, 17 Jan 2020 11:14:04 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D3BE121FE9;
 Thu, 16 Jan 2020 19:14:01 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 16 Jan 2020 19:14:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=eMruiSYqr1FxGghMIkkwNO55AX7K0Cr
 Pd/V2d5+JeQI=; b=UEHhzXj2olimoLouYY7utL2wHRT8JpBd69l/8SlnTrf79In
 rm8jn6XKrlsXrM+gjhdMSc/pSSkEwxj01QNES67eSFmd1yact93kuDrhYwvCf2XW
 C+RPgHEYu0DS2NWiNHNf3v4cY6z5eJXqxAkv7lF69FT8Dxps1b4j0qaIg0zueJ06
 KyLaQcvzRmiRKzAbEYzTfSKaI0fj8JCa7fQUXYFq4IMwa20uVfbibDI1eW5l70WP
 gfGsJrwgGVFqmFCEdZ0CuOERSXbBbFmeb5iA6ozuFz7Bg+EUBT1g0I90VuBUunJw
 NXPAYxqUUEqtyNXlG899EQae+a9hwS1ka1D73ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=eMruiS
 Yqr1FxGghMIkkwNO55AX7K0CrPd/V2d5+JeQI=; b=bgq+qKxIfYKvCxKG/hbX+5
 Z0ejB/RtYAQS7ZmDSdYYcimVWQ0psXs/gUadU+cBrPHDCqxiToRt2MKj8rFFYZzv
 yPO28OIiX3ZBVb6Q1yalH97PjWyLIHEMF8rLmn4T4SucYE7pEqQCUQUnuqeUBKsS
 DI9yrXG/hrIY68gBTDPw5Gtyi3XDG7A2T2A8jGU8Nqi/xBA8orfUZokiqrgVMcqD
 jZJLv1mCWObFOaT1Ar+KhKKCpA4TKmGONyPP7LY7n2zxUVGTzdqIxBIZzoEKjtrt
 I4amtndKfMk3tVZPDpOjzBp/JPrXOq9AjqFI3qS6Orp89zyTLCsbG3FvBYZVxYlQ
 ==
X-ME-Sender: <xms:SPwgXmP1zPPyT3WOAqwU2-vcYRGThHldOuR2wnOpkI5I_TCsXFNXBQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrtdeigddujecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:SPwgXk6uYAN_J-BlCFwdDIGgyK__-V9pwiBZ7lctTS9rTqgeTYewWg>
 <xmx:SPwgXo1prbAADo23zUD7Ta9PJheSGx76nBB_ao8fHoYPnEeE3bZPzA>
 <xmx:SPwgXrrzbveudwt-xIPRdYVgPsEYKvzneM4VS1r88naBCCV-YrTaMg>
 <xmx:SfwgXoYcOGbfCS6lSrZHqm6xYoho6QYWcKUKA7emjUwiWmV6fUV1aA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id CE957E00A2; Thu, 16 Jan 2020 19:14:00 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-754-g09d1619-fmstable-20200113v1
Mime-Version: 1.0
Message-Id: <17a4475c-e8e4-4514-88e4-4efe7fd8dc8a@www.fastmail.com>
In-Reply-To: <1579123790-6894-13-git-send-email-eajames@linux.ibm.com>
References: <1579123790-6894-1-git-send-email-eajames@linux.ibm.com>
 <1579123790-6894-13-git-send-email-eajames@linux.ibm.com>
Date: Fri, 17 Jan 2020 10:43:40 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH v6 12/12] ARM: dts: aspeed: tacoma: Enable XDMA engine
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
> Enable the XDMA engine node.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
