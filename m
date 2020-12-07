Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0CF2D087B
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Dec 2020 01:13:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cq3gY3Z7CzDqZR
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Dec 2020 11:13:29 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=I9f5I5cD; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=r3L/83fl; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cq3gL54dmzDqPw
 for <linux-aspeed@lists.ozlabs.org>; Mon,  7 Dec 2020 11:13:18 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 7FCF15D9;
 Sun,  6 Dec 2020 19:13:15 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 06 Dec 2020 19:13:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=FXWH2ZnmGhBk6pgYPxR/iThdke31cD5
 jkfcX6g/sp80=; b=I9f5I5cDHKgFV2tGYrdOJeP00MJz0m1JeN4fNQ/8vO1OoU3
 6yEqHtmiGEGCLm/YhyWN5lsVeBFfvN/lma2r4RRt3i7gis7hyq4Np3mQrNadjvq+
 FlcW1Onek0CYl8L80UzlQCNIWnlZKfz+cdtvEDD7rAuMVAvupzZLmCrH98zU5ZP/
 nfEK1s0XrLM2ZybiFZveM0TFhA/PpVpsK8TE1WBQ+kA1GiJiLbK/P4Jr+eLc7fTx
 AovufkAP8DOhpVhiCQ2YAzzm2hfmOTTfYuWOad/EMluYs9DButr4ubctiHOI9nd4
 qJp8qh4jFf0zG8o0O40O4ayjXJV9RAzCUZsP3Dw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=FXWH2Z
 nmGhBk6pgYPxR/iThdke31cD5jkfcX6g/sp80=; b=r3L/83flKI25Qo30XXTpSI
 Wz5f6cmVecOcR0NjzGgjCctOObxBBKFyavEBq2/wqB8POHZddMEzMFGnQE9BUUAe
 514JL7u8KgZzqGRcJNvbzlmzEMmsUXz1kNYsQXKHxXry3vDrE70D5diyO655LEkc
 vG6QePCvMRzhodYjaeZA728YkZ1AihcVUlDZ/EebZyMUlpQ1nwESp7ugHTZlPaOG
 MKc8yBNf8MvMEczy/UcFuDmSBSo+IpPwEUL1gUCLjJHNC4qCecKiuSq330YXAW9/
 +w3Tu9nQxwcDcgG4wkfDiyuw8/+7GDiyFH5S1xYljp0g1sD5pZnHR4J02NEaVr6A
 ==
X-ME-Sender: <xms:mXPNXw2F4WZPA_5_dafYwObHAPyX_G3OEbDU2zRVm6i3CP0JmmbKHg>
 <xme:mXPNX7FwgaF7eX8xNEM6qzoU16uHy5-4TjvYh5QcH9XYAMtgSKSh4003NmuGSc65v
 rVd-zCu9W9sU2jlWw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejfedgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
 vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:mXPNX45Z6GdDtVQL_1_fOqQQS6n2tX2ddWchmPyOJh5so4Bo9Quz0w>
 <xmx:mXPNX50hL_bdq-cf7cwn_N8mdZXWC9zmENc9Z-5j6JOcJqfVQBbHmQ>
 <xmx:mXPNXzEiRInL5o5Ahc-D4s7uiuEUWa9n0l33Sr8l2mTTnD-QPs40cw>
 <xmx:m3PNX45HnrdlCpBcoKgAycAm0K-Ir0BQ7w-4UN2aY-B6yOCFTdEEdQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 06ED5E00DF; Sun,  6 Dec 2020 19:13:11 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-622-g4a97c0b-fm-20201115.001-g4a97c0b3
Mime-Version: 1.0
Message-Id: <661ad7bc-b299-4ada-be93-4e2925d79143@www.fastmail.com>
In-Reply-To: <20201204085150.3063-1-vulab@iscas.ac.cn>
References: <20201204085150.3063-1-vulab@iscas.ac.cn>
Date: Mon, 07 Dec 2020 10:42:52 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Xu Wang" <vulab@iscas.ac.cn>, "Felipe Balbi" <balbi@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Joel Stanley" <joel@jms.id.au>, "Tao Ren" <rentao.bupt@gmail.com>,
 "Benjamin Herrenschmidt" <benh@kernel.crashing.org>,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH]_usb:_gadget:_aspeed:_Remove_redundant_null_check_b?=
 =?UTF-8?Q?efore_clk=5Fdisable=5Funprepare?=
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
Cc: linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Fri, 4 Dec 2020, at 19:21, Xu Wang wrote:
> Because clk_disable_unprepare() already checked NULL clock parameter,
> so the additional check is unnecessary, just remove it.
> 
> Signed-off-by: Xu Wang <vulab@iscas.ac.cn>

Pity we have to dig through the implementation of clk_disable_unprepare() to 
figure this out, but oh well.

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  drivers/usb/gadget/udc/aspeed-vhub/core.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/aspeed-vhub/core.c 
> b/drivers/usb/gadget/udc/aspeed-vhub/core.c
> index be7bb64e3594..ea47f4b98de9 100644
> --- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
> +++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
> @@ -282,8 +282,7 @@ static int ast_vhub_remove(struct platform_device 
> *pdev)
>  	       VHUB_CTRL_PHY_RESET_DIS,
>  	       vhub->regs + AST_VHUB_CTRL);
>  
> -	if (vhub->clk)
> -		clk_disable_unprepare(vhub->clk);
> +	clk_disable_unprepare(vhub->clk);
>  
>  	spin_unlock_irqrestore(&vhub->lock, flags);
>  
> -- 
> 2.17.1
> 
>
