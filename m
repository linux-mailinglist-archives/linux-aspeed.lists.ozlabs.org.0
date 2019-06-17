Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F357547882
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Jun 2019 05:08:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Rx490VyVzDqZR
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Jun 2019 13:08:25 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="pMNesVI1"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="PBfRxPvi"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Rx3w57kLzDqWQ
 for <linux-aspeed@lists.ozlabs.org>; Mon, 17 Jun 2019 13:08:11 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 39AAE2073F;
 Sun, 16 Jun 2019 23:08:08 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 16 Jun 2019 23:08:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=7Ke5IHCQc6To6gIdApJVmoXexrwL5gM
 UiXPsvkOjLXQ=; b=pMNesVI1iH2mLTkcSmMSUIrW148uXc6UNhcPpSv18rjIepT
 lE7oFtHZHsEGeOe+nWDyxXaIWrBcGeVQ02PVcIL0MZYA0yucnwQtKU49l76uVWRc
 YUcBkvA92NXbqz0c8otKug1mtQBTzP2bzOR6IfqqYbjkDWpUkXn3/NnBIv+tuEQj
 SywVfPs/k8rB4XtIROYBrVNs/S/BRCRyBr478E6glnnG4SE1pxiUNQSTlfXri+hB
 /MxLJvsMrjmfgOx0B/tOGIgdZTHblxOTN1KfA77aMd0EFcw0VO2wmFwC29jFGPYf
 2Dm3Wu/YsbvdmNjGl03xgemqHVojIbUkVud4stw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=7Ke5IH
 CQc6To6gIdApJVmoXexrwL5gMUiXPsvkOjLXQ=; b=PBfRxPviRr8swajBEeMOGu
 whlErxWIxJGztiT4/OCYkPaUpOA8McouLsXMuEzNEwTal9QHZ6ZEl7M9I7wqfBhh
 4qwHjpGxDVaN/pws6ecCfQbPOEwUKAbcVjfrcxzm+qjpTAK5Cp6PrvgldPl1o3Dr
 BbJfAqdyklN0+7AppE6hDjiVMUkPg8+VfGEImxIema5M1Dl58w3w5IEv+/1hMr7V
 bz0Zp2glkvQSQjghqooKYttA5wLx1vlN2yNj50EzYSpx+SFMbZUp3JXW8bSsnokQ
 3i1wm9IlFItIut3x3YQp9ixnzbGka1Cjrmy2sV0d51Kp9IRyA+aW44JTR/QKAJ3A
 ==
X-ME-Sender: <xms:FwQHXSeON9UDPz2jG4Iqlr-inXy-tPH4uCUzU48dw1vCrdwha1ngNA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudeiiedgiedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:FwQHXfIm4G2IoAWckCVAwkz8hHS9PzHJq6VVkyDcpCEbZOOCtmiC4w>
 <xmx:FwQHXXvMhwYuLOOf78QHC3vVoZdH4oAhbXh_vNYt7igaFAD-3j2VIg>
 <xmx:FwQHXdIVnRTr-O_EQxpxlc9VV117FsfT7rYYeqLuxhB-JlCMNkX6xA>
 <xmx:GAQHXX-UPOTzKKughhtwmokFom6azpOym-54dORZSvpXuveABjsstw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id DE09BE00A1; Sun, 16 Jun 2019 23:08:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-663-gf46ad30-fmstable-20190607v1
Mime-Version: 1.0
Message-Id: <70de7e7a-2b2b-4409-beb8-7f61d4d25def@www.fastmail.com>
In-Reply-To: <C4D5C095-A715-4D39-9DEB-1B7734760666@fb.com>
References: <20190530203654.3860925-1-vijaykhemka@fb.com>
 <6828A39D-8950-4C07-8340-7AE9E2DD3EC0@fb.com>
 <C4D5C095-A715-4D39-9DEB-1B7734760666@fb.com>
Date: Mon, 17 Jun 2019 12:38:06 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Vijay Khemka" <vijaykhemka@fb.com>, "Joel Stanley" <joel@jms.id.au>,
 "Patrick Venture" <venture@google.com>, "Olof Johansson" <olof@lixom.net>,
 "Arnd Bergmann" <arnd@arndb.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] soc: aspeed: lpc-ctrl: make parameter optional
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sai Dasari <sdasari@fb.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Sat, 15 Jun 2019, at 07:11, Vijay Khemka wrote:
> Hi Andrew,
> Any update on this patch or do I need any more rework.

No, no more reworks. I've pinged Joel, he'll pick it up.

Andrew
