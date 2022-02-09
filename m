Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF97F4AE8F3
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Feb 2022 06:16:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jtp5F1rqZz3bSv
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Feb 2022 16:16:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=WTT81p4d;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=VjZd44bo;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=WTT81p4d; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=VjZd44bo; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jtp5427xBz2yZ6
 for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Feb 2022 16:16:23 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id AAA0C32020AB;
 Wed,  9 Feb 2022 00:16:18 -0500 (EST)
Received: from imap50 ([10.202.2.100])
 by compute3.internal (MEProxy); Wed, 09 Feb 2022 00:16:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=l/FEKsTk/RJ/bVdkbuaJ+iJNXUpU8kXt2BasTM
 UnMok=; b=WTT81p4d5J+2TwiLLg5KCuJHsUsWcBsVQz99jJX3jaWLGjmOTvM+8t
 FIu7f42bAaxMqGUH/4HfW1wqnkKb+PvAc63CY+SKzINnI/MkOr0X9iN+j+zzLRtR
 brlNg+HHdzafQpZJV185OjbJJuZ4AATnOuCTfYcbzkCue6ngzP9SHRL4A3sU/1WK
 yurkAL1dqJmTPTCTdocd+RFPvJlSHb93b7GAxqYPqRyDYWT0uOfk1ezGAl79PiV6
 /8ka9iflSunKkb1JdKhekwsR+MlqBg0jyRruadzcqUYg+pLsyA5adF1EabkmqD3K
 S7P6R3vMraesdoVC1Ff1h4UFX6wzsRpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=l/FEKsTk/RJ/bVdkb
 uaJ+iJNXUpU8kXt2BasTMUnMok=; b=VjZd44boL/hyl1Or446GSWGOYEYdaHCom
 dBkoUdEUW6bTwrGEhPiD5H3EjcJSjXEDsRLnpGXZqKzsF1WVJg05YvTKzJ2BUT18
 cB02YoM85YwmNxZ5KwB9C5S2iX6HGRfHC3i4TfTSvOF998vnfdbsJZWkxmY3guwi
 QY6k1t53P0XQ7QyFR4jNgpiFJXADE3Ja1XMxhwkNnfVpA7zjeL17BCviCp+33hFQ
 mmFAHGHWCv6p1EgTz0zRSI6X0fYVZUAymnRD2xnA2mXEZeD6+qmfc6zTybUtpU+h
 8MY2hRYVG14vApaMMRQzDgidtHh3C06RyGqDrc5faSMxe7R0xFxpg==
X-ME-Sender: <xms:Ik4DYrxr8VmhNINkd4T2K56yQoISs_ITlRMjvbWTmqkNXzSiqCBEWw>
 <xme:Ik4DYjTj29Om3uJ-rlR6g-qXc8ICn-nz-DWqYN9dD_nxSJJjaPZFciZauiaTS55LV
 cS9uy-NVqSiPvolmg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheekgdejkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:Ik4DYlXNEEZBlnmEBhRQXjNSoaiOeOksUSI9yWTDWlbUZ9C2aJKKcw>
 <xmx:Ik4DYlg34TLMJtrwjE8hJ4vkYTseuGnEAIFZJ3076Tyj6dsKhW_KkQ>
 <xmx:Ik4DYtBkAZOBydv5szhH9Z0obnkpM-S8rjJxMd-MnNoxj9ETcrSJ3w>
 <xmx:Ik4DYsNIdT9jxZmcOhn6lc6Hm3ds-cTBeMgi_bGPTBAmGohZsI9LlA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id DF9E01920084; Wed,  9 Feb 2022 00:16:17 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4748-g31a5b5f50e-fm-cal2020-20220204.001-g31a5b5f5
Mime-Version: 1.0
Message-Id: <8748d41d-ac5a-451a-b38b-6ec0fc2bcb99@www.fastmail.com>
In-Reply-To: <20220209000359.372978-1-joel@jms.id.au>
References: <20220209000359.372978-1-joel@jms.id.au>
Date: Wed, 09 Feb 2022 15:45:57 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, "Andrew Lunn" <andrew@lunn.ch>,
 "David Miller" <davem@davemloft.net>, "Jakub Kicinski" <kuba@kernel.org>
Subject: Re: [PATCH net] net: mdio: aspeed: Add missing MODULE_DEVICE_TABLE
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
Cc: netdev <netdev@vger.kernel.org>, linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 9 Feb 2022, at 10:33, Joel Stanley wrote:
> Fix loading of the driver when built as a module.
>
> Fixes: f160e99462c6 ("net: phy: Add mdio-aspeed")
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Acked-by: Andrew Jeffery <andrew@aj.id.au>
