Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C5610C03F
	for <lists+linux-aspeed@lfdr.de>; Wed, 27 Nov 2019 23:34:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47NbD409pSzDqxj
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Nov 2019 09:34:12 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="JyfZhtH6"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="CkWluTh8"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47NbCn4qg5zDqwJ
 for <linux-aspeed@lists.ozlabs.org>; Thu, 28 Nov 2019 09:33:56 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 32353226DF;
 Wed, 27 Nov 2019 17:33:52 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 27 Nov 2019 17:33:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=IzkBKtsIWNt/0KHfahdEn8h/zDvhTn2
 y2qgOjDS+X54=; b=JyfZhtH6I0ZKd2o2M57TsCUen61dfpyhBJHt1MIXtLQoq+m
 +2SV44eMSwO3/Sg3qCJSQzC9ivUtSYXsGmQPjJx1x92rJGsl7jg4F3Q5kkIqS/3Q
 TeMYsnZJix15P8V/a/Q704xp6FdQdOwNkTmacY8XgVnOU0z0YplSIS1yS/31rJLU
 FD2hdDpUnu37PYM9byWslm84bFryGXoRbHA3XgHg0pnQn4YiXchz+H9KCI4BhHKX
 S1MSNRCgJuzAyk/rq0SKAb7PHdCh2TaV8QgqOc/izm/fljxM23UEQYh6VAAYFCou
 cXe2zHFlCv63fYqIRSutrZI9lcymfM820VwNejQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=IzkBKt
 sIWNt/0KHfahdEn8h/zDvhTn2y2qgOjDS+X54=; b=CkWluTh8Tm5dT5epjP51lz
 jx5K+LxQqnCvdtEo+rOmMggbUljcIaeSvt4GZrpi/CBMMN2fQpfnar53Sl4FC8ab
 62BiZNuRSczkqqqKfOTf+pQfwmnlrf0eF7isYQijN+JU1G/PTE2IUIBhpzKeme0K
 a4SYsLk2pofV41p9vwvlbfz9taVYkkHsQhb4+F27+NBG1QKivNfw+B2fXW5a67RF
 0q4ZB1acSoXDf2Xbas7pyFvq1KGNPmBlJV8CRY6y2aLvNhAVW4TaQk+/rhSKwOdM
 W9njISK6GvSGBakXljoJHbW55s7/ISiNUc2ohS8LlolIEkGfbxCCW3sfesUeimWg
 ==
X-ME-Sender: <xms:z_neXWo_Igav66JgJT3RYTIr2u4xyUZNi1yFgbw3Wy14hBTB9E0AIA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudeihedgudeiudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrg
 hrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushht
 vghrufhiiigvpedt
X-ME-Proxy: <xmx:z_neXepZLzgoxCq1TKoy6h_wUuwIOut7c0gQ21N767Ijq-tGRS5EsQ>
 <xmx:z_neXR0T6G5V7ONdwjjHPXe5jUtOs4CAzG5U_3A8MjBUl8VAoCL-IQ>
 <xmx:z_neXUEvcF8WiaBzxrpdy6Ggbfx9A5ZUuz1dSqQ_MNVaMbPtgNVzog>
 <xmx:0PneXRjJxm8EcHfJjrEapQVWzrxWaqNwBpczZCUwNS8kJhVFDJohyA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 3D649E00A3; Wed, 27 Nov 2019 17:33:51 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-578-g826f590-fmstable-20191119v1
Mime-Version: 1.0
Message-Id: <ba027dc2-613c-40c6-bb5e-1d320e51b191@www.fastmail.com>
In-Reply-To: <20191127132340.GA22672@cnn>
References: <20191127132340.GA22672@cnn>
Date: Thu, 28 Nov 2019 09:05:21 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: manikandan-e <manikandan.hcl.ers.epl@gmail.com>
Subject: Re: [PATCH v4] ARM: dts: aspeed: Adding Facebook Yosemite V2 BMC
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
Cc: devicetree@vger.kernel.org, Sai Dasari <sdasari@fb.com>,
 manikandan.e@hcl.com, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Wed, 27 Nov 2019, at 23:53, manikandan-e wrote:
> The Yosemite V2 is a facebook multi-node server
> platform that host four OCP server. The BMC
> in the Yosemite V2 platorm based on AST2500 SoC.
> 
> This patch adds linux device tree entry related to
> Yosemite V2 specific devices connected to BMC SoC.
> 
> Signed-off-by: manikandan-e <manikandan.hcl.ers.epl@gmail.com>

If people have reviewed previous versions of your patches and sent
Reviewed-by/Acked-by/Tested-by tags, please make sure to include
them on future versions of the patches _unless_ there has been
significant change that might invalidate the tag. In that case, also
provide a short description as to why you dropped the tags. You can
add free-form information below the `---` and it will not be included
in the commit for the patch.

Cheers,

Andrew
