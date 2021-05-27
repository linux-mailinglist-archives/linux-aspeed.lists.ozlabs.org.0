Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B2B39246B
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 May 2021 03:40:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fr9VZ6ypYz2yhf
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 May 2021 11:40:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=MhjuPl8E;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=tugK6A7D;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=MhjuPl8E; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=tugK6A7D; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fr9VS6TgLz2xv1
 for <linux-aspeed@lists.ozlabs.org>; Thu, 27 May 2021 11:40:00 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0D86A58060A;
 Wed, 26 May 2021 21:39:58 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 26 May 2021 21:39:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=L+fivTA27mQM4nAAxth200/TuxEV89H
 UUTPJI9Oe6LI=; b=MhjuPl8E1Vo/PddEIYT4qvh1AgOWgjrrMsw9dOM0Kr847RI
 Yfl4qbLiSu5LAXBu5stXaZcgiaALUY/nJsbE00j4vk5jLG3Mf/1IOVSiOwPtJRDX
 aw3W3G5YO0XkTu7cdqRxS5PAZRO6Zkmfy8r7HQMeUGjiWnjvZNDjBlbrPKMY3WT5
 I7hLgbzY4RriYMfoyfZQa2GqKreRUDjzlvNQin3Q3wfDf00wAEQVsVLJJuy19n8R
 izIARg1BArS02RibY4WXOpKu5F5FbfAyWimilxm8U+NBY46+6oWV3LEyWkVDx0YS
 MBXRt0xh5QFMQjmze7lS6h95TwLJoaLwIrgsvwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=L+fivT
 A27mQM4nAAxth200/TuxEV89HUUTPJI9Oe6LI=; b=tugK6A7D4C7XLnVyZcV6AB
 +laFhJ2H31UwSA8hue2hJbitoUWTS57M0IfCd0ZvYPRsAnP8xIn9qbbgatqZPmJT
 0RbklhY3WtekCt2A2sZfX9zTTJiJauzcWf6m3ZS8/gT53zEhLb5trDI+YS0arXmy
 EzjT4ZBDaoQehhMYAKbo7WYiqDK20xy8/zIBu1cIdJ07CC2M95t/OSy+rctVSg9u
 QZmMQsrh1FqO/QGx0x4juyIZ06I1fJsHFwq3EtwdC72liRCkOOtxanSXa0x5djeZ
 1MgZx3UwSrVelrVhp8XZ4x7DAJ6ue0fUOdb60Nh5fNSTKPmHPWQfumCF2MPdhYJw
 ==
X-ME-Sender: <xms:afiuYPNLPmPxl71aZTTMeZ_2N5V4InN-5Iq0_vAmXYOU3Ho6gDo2Zg>
 <xme:afiuYJ_EvD-9LozlBwwFoNBfIN8LwrqALWlj5GQfbnAvXpc_yJKvpFgw8wmMEaotg
 qkQgZkN6-DA1ITYCQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekgedggeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:afiuYOTp-te6-0QbsbTf4J12FKp2H-jUdVzvahgMM3a_9bPq391hyA>
 <xmx:afiuYDvaC__kXHSMTqj9oheiXSdnoSOYLB2NhAkH-0jDzBiEjfc4ew>
 <xmx:afiuYHexxNKDGdWdcVamn5wr5fP1HN8DRRlvSIa8Na3Fjg8p1uIR_A>
 <xmx:bviuYN9rRU7Q0lKvcLfdi5neZC1jMJehQDmo3Qh55yvZmHPQSi4Ubg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D4102A0007A; Wed, 26 May 2021 21:39:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-468-gdb53729b73-fm-20210517.001-gdb53729b
Mime-Version: 1.0
Message-Id: <2176d536-c7c0-482a-84eb-b1d02da1b067@www.fastmail.com>
In-Reply-To: <20210526051220.136432-1-joel@jms.id.au>
References: <20210526051220.136432-1-joel@jms.id.au>
Date: Thu, 27 May 2021 11:09:33 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, "Arnd Bergmann" <arnd@arndb.de>,
 linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH] ARM: dts: aspeed: Set earlycon boot argument
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
Cc: Ryan Sie <ryans@supermicro.com.tw>, Ben Pai <Ben_Pai@wistron.com>,
 Zev Weiss <zev@bewilderbeest.net>, Ken Chen <chen.kenyy@inventec.com>,
 Andrew Peng <pengms1@lenovo.com>, Adriana Kobylak <anoo@us.ibm.com>,
 "\(Exiting\) Yao Yuan" <yao.yuan@linaro.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 =?UTF-8?Q?YangBrianC=2EW_=E6=A5=8A=E5=98=89=E5=81=89_TAO?=
 <yang.brianc.w@inventec.com>, linux-arm-kernel@lists.infradead.org,
 Supreeth Venkatesh <supreeth.venkatesh@amd.com>, Xo Wang <xow@google.com>,
 manikandan-e <manikandan.hcl.ers.epl@gmail.com>,
 Lotus Xu <xuxiaohan@bytedance.com>, Hongwei Zhang <hongweiz@ami.com>,
 "Alexander A. Filippov" <a.filippov@yadro.com>,
 Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Wed, 26 May 2021, at 14:42, Joel Stanley wrote:
> 
> Most of the aspeed boards have copied the 'earlyprink' string in
> the bootargs. However, there's no earlyprink driver configured in the
> defconfigs, so this does nothing.
> 
> A combination of setting stdout in the chosen node and adding earlycon
> to bootargs causes early serial output to appear early. This changes all
> boards to use this option.
> 
> The console=ttyS4,115200 option is still required, as this is used by
> the run time uart driver.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Acked-by: Andrew Jeffery <andrew@aj.id.au>
