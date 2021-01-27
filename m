Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5A830679A
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Jan 2021 00:17:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQzyx3NrfzDqVZ
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Jan 2021 10:17:29 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=EEk6+7Uv; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=pfwUWuzT; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQzyB01G0zDqQ1
 for <linux-aspeed@lists.ozlabs.org>; Thu, 28 Jan 2021 10:16:49 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 89FC55C00E9;
 Wed, 27 Jan 2021 18:16:47 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 27 Jan 2021 18:16:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=gGcwVS/68YhbCGlzsQkOFgWjM+FCtEk
 PcloKgFmi6Pc=; b=EEk6+7Uv7zZFrOgpqzSxNCsPYT+upXvbPKB9zpYJsn8Agqw
 oP2+ZQU2qMWIzwUEt8ysK9NWkd7TuVBNEPzWAti16+JNkDDVfzhT6RGY3Dr/m0BE
 OMlkyCtDNH68HRl3rRXlOdKFAODAVg3wib363PDaWBaIQ2lKINw02uCSPV+p9MOF
 /YGjYSE3XkYSAVb6Ka4//g/6b9S0mGIZyi1+o83RwDc/Oi5wahGDLaueFmykaJvg
 1WvRG3l8CyBBiPBWef7FFR79EhbjnDImGL+jZNvOpm8Nmx88oJV4Pbvvt69ge953
 VPhWE/yHLG75ftHkSKh7LgMVeUueWygT3txmlXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=gGcwVS
 /68YhbCGlzsQkOFgWjM+FCtEkPcloKgFmi6Pc=; b=pfwUWuzTZm5eBII5lNS7u3
 4UYD5OuT+ES2cSYMMZ9MWDVGxVYxp209jO1PMqBu9KnkNaykNYD0Fu9argdqij18
 VmC5J9H/hn27bU7qadWNmKpgwRPSnNcAwix7mhByKArnhBbwAw9lE5MRMqxC0+9Q
 /sY8nyXn142eQ8D+RlO3e/j/8rvJRLJfmnFqwWGEbl2QL7AbK0GCcGGWHubGM1Up
 NVNB6oVFMv1bHqBjJ3cGGhDQ+fO723NyG6V2elYOO5x+QpwYnCoonMkskcjEiMWa
 NsxuvPZHU+AUkN5V0hXXAf7d6OBkaIYjgdMaXytl9K8WLCxCXI7kMNZQtWXUVHFQ
 ==
X-ME-Sender: <xms:XfQRYHDebcMnOZep2n0u5Aoj9_QIPSRCp1lLiwnqkslYf0JCMkoWfA>
 <xme:XfQRYNhx1mLGtVLhMMQFT0zmqUBBHaeKWtwZ7dMdA69D8nly3D9DuUtzOzFcTWohb
 UnPtZkxtIEmtqgKSA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdelgddtjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpedutddtkeeugeegvddttdeukeeiuddtgfeuuddtfeeiueetfeeileettedv
 tdfhieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:XfQRYCnhFvrsbmvWH7AIk48UIgNlF36fmKNXupN-BUc4maz2soussQ>
 <xmx:XfQRYJwguG4iygmfPqouLBzSi6JgEpWOiYRoK78ftTqXBeC_mx9tCA>
 <xmx:XfQRYMTOxSUF5y7FMB9NqOQ-E-0bxhLu6ltCvwm5G5CXYeM62J20GQ>
 <xmx:X_QRYBJvdAcOqOBWd45DqZd626LDG84vJNZbv1bakRpudRdcm3q96w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id AD14AA0005D; Wed, 27 Jan 2021 18:16:45 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-84-gfc141fe8b8-fm-20210125.001-gfc141fe8
Mime-Version: 1.0
Message-Id: <7d7a0990-c9ca-4113-aa41-415b5cb54cf5@www.fastmail.com>
In-Reply-To: <20210127182326.424-1-aladyshev22@gmail.com>
References: <20210127182326.424-1-aladyshev22@gmail.com>
Date: Thu, 28 Jan 2021 09:46:25 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Konstantin Aladyshev" <aladyshev22@gmail.com>
Subject: =?UTF-8?Q?Re:_[PATCH]_ARM:_dts:_aspeed:_amd-ethanolx:_Enable_secondary_L?=
 =?UTF-8?Q?PC_snooping_address?=
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 supreeth.venkatesh@amd.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Thu, 28 Jan 2021, at 04:53, Konstantin Aladyshev wrote:
> AMD EthanolX CRB uses 2-byte POST codes which are sent to ports 0x80/0x81.
> Currently ASPEED controller snoops only 0x80 port and therefore captures
> only the lower byte of each POST code.
> Enable secondary LPC snooping address to capture the higher byte of POST
> codes.
> 
> Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
