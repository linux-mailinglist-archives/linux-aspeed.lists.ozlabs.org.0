Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 111E210973B
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 Nov 2019 01:11:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MPSj1XKHzDqfr
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 Nov 2019 11:11:01 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="RKn4e8WA"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="wSZXJb38"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MPBj12gzzDqSt
 for <linux-aspeed@lists.ozlabs.org>; Tue, 26 Nov 2019 10:58:52 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B3FCE227E7;
 Mon, 25 Nov 2019 18:58:49 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 25 Nov 2019 18:58:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=uAocx9y1gw6K1vU7ec8ZFYtLT+FTX7p
 LzUEnRUhE+Io=; b=RKn4e8WAMvltzcv9zoc0Mif0i7TY5VxDeczY2asdJNmEBVR
 NfXK+oxI2PFiaRAm4o/RuUdGgxAgKtFJe6wzl7l3O1+91bxSzm1LBXc6TFpP5toi
 dDPuPzH4HaigtgxQc0ph0KAziWqIut9sv6JEKh+kvOsyB121b6Nk5misvzVGKmW7
 9qdFfmXBEQuDZnW2AiRXr6tEyBc5ND/sh2LQEuG+3ww9m+fqEHazQ/3YBEIKN/zl
 kK31GDiQCjJpsWnctu99luHGL0jA70kUeyuCOaepoyRbemD/bdeBedGPDu+YGXBe
 sePZePKPTQBW/6bvc8+mMbPxDXhEH6dg53P+fWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=uAocx9
 y1gw6K1vU7ec8ZFYtLT+FTX7pLzUEnRUhE+Io=; b=wSZXJb380Dy2W1S4zNtBzC
 ObLNLJQIB74ltyoBq+/up8UO9rz7bWBcqJwh4+VdhYjhS+tyPdGJUVpKymb1A89o
 YLNhhRmjyZEDGNh3EXwfvZaponAoAKDVzOesylFYG4H1DfziW6jnLj6+efydhYrD
 nsEi2IFm7cVBxzo8icAwUM+JBL6PsVZGHQwhPqNOmF0AX+QhUjiEKh+jSWPesjKM
 Ch0Brfk2zGRThlMvdAPigtlYgBWAo3+AY/QcPPCJKp9TAC8hGm5XqeW1i05KhPo6
 1Pj/XlOGronmvsJU2/uw7XMX8o8q3g4PAPOQwNZgPxS3BM60Pa2adhdLTF7mTIYQ
 ==
X-ME-Sender: <xms:t2rcXTkhGZI12cC68mbQIVXNK2nj9XctAWgoGB4UDt8G-siDCXU16A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudeivddgudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:t2rcXaFjlgvXFeexOQXfEi1rSV_qaEVJO0Yc5CA-pv_HJOBxju-Bmg>
 <xmx:t2rcXTGVwWv06sB0eUCEMok0ofGBBPJlICOnoElb5ZlML0v8TsW3pw>
 <xmx:t2rcXXMHBD8fYafTHBgYkF8J4U8MlC7mZFlUCPF1M8TH52zCKM2F7Q>
 <xmx:uWrcXXvAPMIaH3Ilw_D06RyPobF5pzdans1r9UqkrhJP4YxeizPYqA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E1E14E00A2; Mon, 25 Nov 2019 18:58:47 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-578-g826f590-fmstable-20191119v1
Mime-Version: 1.0
Message-Id: <3232fa33-559f-4086-a605-7186d81ee3f7@www.fastmail.com>
In-Reply-To: <20191125130420.GA24018@cnn>
References: <20191125130420.GA24018@cnn>
Date: Tue, 26 Nov 2019 10:30:15 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: manikandan-e <manikandan.hcl.ers.epl@gmail.com>
Subject: Re: [PATCH v3] ARM: dts: aspeed: Adding Facebook Yosemite V2 BMC
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
Cc: devicetree@vger.kernel.org, manikandan.e@hcl.com,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Mon, 25 Nov 2019, at 23:34, manikandan-e wrote:
> The Yosemite V2 is a facebook multi-node server
> platform that host four OCP server. The BMC
> in the Yosemite V2 platorm based on AST2500 SoC.
> 
> This patch adds linux device tree entry related to
> Yosemite V2 specific devices connected to BMC SoC.
> 
> Signed-off-by: manikandan-e <manikandan.hcl.ers.epl@gmail.com>

Acked-by: Andrew Jeffery <andrew@aj.id.au>
