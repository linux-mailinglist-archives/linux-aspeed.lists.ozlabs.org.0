Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C6186EE0
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Aug 2019 02:38:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464RDr6grkzDqvn
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Aug 2019 10:38:36 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.230; helo=new4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Ffx6KwVw"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="N5RUPgeA"; dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464RDg2T2szDqtY
 for <linux-aspeed@lists.ozlabs.org>; Fri,  9 Aug 2019 10:38:26 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id B5AF02687;
 Thu,  8 Aug 2019 20:38:21 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 08 Aug 2019 20:38:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm3; bh=qzgxGTZsCJlvV+dr0gENjfvelG+V+hv
 DaK0KMe9R8B0=; b=Ffx6KwVwOmajjT7vxnEXIp+p/A4+WuIBUt6KPvR9e0rnVEw
 4jTCNBTUskMYYse+3gkG8HSlNZrOYm3boUcw8X3gS87V66Q4qMOlcDnTABC0OYoT
 o7eC9BbkU+ZVI1pdGlj826pZGcKN6kpIqr59yUgTRofmwLGW8hu07IxY3bzCus+a
 0y3qxmNHBFJxmJCf6pMuRlEty0fbLawuSgKTxmCyH2qfZfdpljWMHDWx5JR5Huts
 3hwSylwSCA88fB26CybC8wSClOP/Ijt3AOU+/FmlfaW9QoK4NWV4sAL4CXZ42zDE
 0Z6dLJAZU1BJfGsLoBXA4rY5zwlvbkg+K8pu7bw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=qzgxGT
 ZsCJlvV+dr0gENjfvelG+V+hvDaK0KMe9R8B0=; b=N5RUPgeAxWz+56KbGktHZv
 9freKvjIoKumB99CKFG0upclkvmCvSdG5Kz4kbZ2scT9qzDdzR5yb84FN/GB1n+6
 UM2K2meYeno617yTwdXi6Bb3v9qRrG5SM86tolzM3d0jJpMQBBLhi6t1oAet/D0f
 X/VOz+vD9q8ASlc4vAGeIHEp/viMN2Xr+5FXQc1flObHrjK9IiATcOj77QglrYvs
 RMFOcqxoiIiM9CCqdFbhWvtiJI940ZJ1IQi6caNF+o5NdM9lO5q+vxCnnJtKrBjN
 Qxtd07hqnCM04oiSgevPQjodFnhe2AWhUz0Jo2ldfHwOBtdxmHWGXorQwasl5OXg
 ==
X-ME-Sender: <xms:e8BMXakxzKbCeQxN1dJ589Vs7dWxGpbsSHwHOiNQBP-MeR8sI94-dw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudduiedgfeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:e8BMXQQY7GwMuZxOfl3_Dq-J9dvjb6Sq_2N8cvcnEehV9C63rQbzJA>
 <xmx:e8BMXbSBmUk3NhIc9ZUZ_susRr3k3bI0oL74DBvBzCrv7FpOYwuM-A>
 <xmx:e8BMXZ4HSfUlXwVgDHFEdkmhJiaiazPpaPsLfnpciwwMu0bZB2NmJg>
 <xmx:fcBMXVl3zLd7qKFTPNBayx2gKdugbBCuQ8hC0VTcBL6ncmDKaPbrwA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 64ECEE00A2; Thu,  8 Aug 2019 20:38:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-808-g930a1a1-fmstable-20190805v2
Mime-Version: 1.0
Message-Id: <7335d5d1-77c7-4cfe-9ba5-2fc81e3e69eb@www.fastmail.com>
In-Reply-To: <20190808075104.15928-1-nishkadg.linux@gmail.com>
References: <20190808075104.15928-1-nishkadg.linux@gmail.com>
Date: Fri, 09 Aug 2019 10:08:45 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Nishka Dasgupta" <nishkadg.linux@gmail.com>, marek.vasut@gmail.com,
 tudor.ambarus@microchip.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, "Joel Stanley" <joel@jms.id.au>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH] mtd: spi-nor: aspeed-smc: Add of_node_put()
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Thu, 8 Aug 2019, at 17:21, Nishka Dasgupta wrote:
> Each iteration of for_each_available_child_of_node puts the previous
> node, but in the case of a break from the middle of the loop, there is
> no put, thus causing a memory leak. Upon termination of the loop
> (whether by break or a natural exit), either ret will have a non-zero
> value or child will be NULL. Hence add an of_node_put() that will
> execute only when ret has a non-zero value, as calling of_node_put() on
> a possible NULL value does not cause any further issues.
> Issue found with Coccinelle.
> 
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
