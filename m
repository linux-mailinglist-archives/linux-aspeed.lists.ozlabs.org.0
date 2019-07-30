Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F5979DA9
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Jul 2019 02:57:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45yJ723mrlzDqSB
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Jul 2019 10:57:18 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="h1PIV387"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="rHjfhPAe"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45yJ6v3bd4zDqQs
 for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Jul 2019 10:57:11 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0EFCD22007;
 Mon, 29 Jul 2019 20:57:08 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 29 Jul 2019 20:57:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=XPnERhW2H0wWGWtbugb+2NkxwKfRT+Z
 B/CqbqW3bjzc=; b=h1PIV3879MIbvLKd771VEtBSSBLdChbMkdBG6HYaltryFjK
 mU1OLaic4mf14xFo8ZWZzUzPe6rroi70VBY08UIX3AlZXlzh5I0CqFjw4BlcTYaW
 O4dNQHc2bJBjpdqfTWeopf8r179OhBG0R8ISxB6I7EKpyj6LdRyT+AO5mJAtuwNV
 ePUqD9lp9yh7ot9sCTzyl3eCLuSvXXtT+DLQIVs7UW4/g0k6eO79hJJRtZPWp7vC
 gDVXO/VSsgW1+UkFEXHnfYNUaZI7N65bNBnqtmq1s9AuzkO+x1BjNlppZpO40+BK
 KfIx5oXoWZDtJGM+vcOv28yo0E20PIo7HwF2BVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=XPnERh
 W2H0wWGWtbugb+2NkxwKfRT+ZB/CqbqW3bjzc=; b=rHjfhPAeXGVIKUKHK0ZtHU
 KPebvOVCz4K35x3/yIwo38Z6vHaE/DRewVuG9FQJGl1wbPCN1Djhiq5e6eAUR22e
 2+gHsZob35CnOBHa4wnZgH5bvCNlUaGCBUKOMwAb5QXn0GFlj+YbQcCjTZzdyL60
 4dNqlB8oj5u8DqN6AL03SPeBFKhGijwDuaEy0HMrKplJRJUmzCqpHlgDsuBojwRG
 wPzsfYw7LQQcnM1REKCXGmDdL3OAX+ml65J7RolnUQrxYMjBYJKc+NMV5N9VM2Uz
 pNZLbeYVURJSTNDY2bVQSeK060sJ6ePvQkrYhO3JRZgultwSPUMR77bDxKBLrUfA
 ==
X-ME-Sender: <xms:4pU_XWAnTrWrXYdqp2G9pCGl9cfD-y6t-0eaEXgYB4urZrIjx-pVCg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrledvgdegtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:4pU_XadJXpf3MrjT7KtdMHx-e5YWzp46XKN8NQDBp1KNm25P5jWbgg>
 <xmx:4pU_XbdvJPn1CD30grWzCYKFW-1gQLAf38r4KRKUxJuX5cCGU7ZyqQ>
 <xmx:4pU_XQN6nVXKotBXQvgv-BNkYhQJBPIWWZu7B0RXPSGTEWo3g5hqUA>
 <xmx:5JU_XVOINtfdY87NdCVpOsBSgkIdwDoWxJCqBiXYIiPN9OvP4B4V3g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 26AF6E00A2; Mon, 29 Jul 2019 20:57:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-736-gdfb8e44-fmstable-20190718v2
Mime-Version: 1.0
Message-Id: <9d0f2b20-e6f6-419c-a866-c4a0dd92aa63@www.fastmail.com>
In-Reply-To: <CACRpkdapypySGPrLgSMSNy1fzkca2BfMUGzf3koFWQZ-M5VOvg@mail.gmail.com>
References: <20190724081313.12934-1-andrew@aj.id.au>
 <CACRpkdapypySGPrLgSMSNy1fzkca2BfMUGzf3koFWQZ-M5VOvg@mail.gmail.com>
Date: Tue, 30 Jul 2019 10:27:25 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Linus Walleij" <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/3] ARM: dts: aspeed: Deprecate g[45]-style compatibles
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Tue, 30 Jul 2019, at 07:23, Linus Walleij wrote:
> On Wed, Jul 24, 2019 at 10:13 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> 
> > It's probably best if we push the three patches all through one tree rather
> > than fragmenting. Is everyone happy if Joel applies them to the aspeed tree?
> 
> If you are sure it will not collide with parallell work in the
> pinctrl tree, yes.
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> (If it does collide I'd prefer to take the pinctrl patches and fix the
> conflicts in my tree.)

Fair enough, I don't know the answer so I'll poke around. I don't really mind
where the series goes in, I just want to avoid landing only part of it if I split it up.

Andrew
