Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A3B9DA11
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Aug 2019 01:41:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HT6S1L7hzDqk7
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Aug 2019 09:41:20 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="cQqchq0o"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="IdCtWamy"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HT6K65GlzDqgZ
 for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Aug 2019 09:41:13 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id BC21320F5C;
 Mon, 26 Aug 2019 19:41:10 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 26 Aug 2019 19:41:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=b6gK9Z0HBCIrzjuVL3PtgdZDNROaOQs
 GEZzEggIRfVE=; b=cQqchq0ozGW0puceRe7q9wyVlMbfVN2H+TSD66CiOi7utLk
 7NitNr1kiS6uuRkPfEwPrUgj2Y3B4SNBeKaQUwUBRx//DehErGWC2CS1KRUa8rpG
 lV5UuR4ZObgeYC20Ijbn7C1uxAxv31dD/pIl2+w7/ogpa3N1O07r3JGrWNpOKX0l
 wkU6ILc5I3mCilwsn+9C23OEIbEG/ZxdE+ptNR+F2qgN7Oi5cjXsE+g8HeiPJiD8
 OMNoZByDAKiZF5cANroqhiQSCJYVqsqMQA5SoOU2DJRx08qTDw3FPh2t65xgh1e9
 fSnE5O2Dq3pBW/3HFux71yadgAmhivOUgYge1Rg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=b6gK9Z
 0HBCIrzjuVL3PtgdZDNROaOQsGEZzEggIRfVE=; b=IdCtWamyrlUuRijPg3dExw
 WnKjrXYjEt1zYLN4MyAIdDcJrZW7z0MZZddYwJjT+AtQ7w4ysurVaX5fwKpwdlRx
 LyrydUkHxRZWsurCJuKwyt9xZx+rv6wENQ7r5wOV8ih5buRpPJPxAlYRmFmmz+wu
 HoZJtYUSA9sl2kWecaOjcLqDvqV8LCTWC3Rb2HeBEi4DDx7A1SlQ1ephRqj7lPDA
 EsSkce2LiHYErWkOnWlfxCXsFV4WCVEFqyDYSuPBieyO3RlqzV7nONp/ETj58ZbS
 8LZCUH0iLfa7zWiQoXqq9+NtAFhUAfyKMxjmO8T+yYixmQL2ibkGquQ8+KOAFguQ
 ==
X-ME-Sender: <xms:FW5kXWqZeLZ3N9nOExpzv1HyQalR89DNl0zMPCF5mdCpldGueVTLTQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudehhedgvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:FW5kXUVjbpswDRQyx4ktX97fB8NTndYQnvhSJhH5lc09OsfXmD5utg>
 <xmx:FW5kXWCIpgdbS1DYVzJJ2m0UypAAXXyecHKEtAzT1XVHjx1DIExWfQ>
 <xmx:FW5kXYUMP_dLuKeXT6Ld14yCOrsbFeYKspCwqkR0wnU5UD28cKXJKg>
 <xmx:Fm5kXWIkRy4USgX5OrGvI47HsHeE14uSKVtv-C2VMMMU7qsE1yxxdg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 3F0F8E00A3; Mon, 26 Aug 2019 19:41:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-916-g49fca03-fmstable-20190821v7
Mime-Version: 1.0
Message-Id: <e23e0193-51c8-41a2-95f7-d48f0ef00eb5@www.fastmail.com>
In-Reply-To: <20190826120013.183435-1-weiyongjun1@huawei.com>
References: <20190826120013.183435-1-weiyongjun1@huawei.com>
Date: Tue, 27 Aug 2019 09:10:37 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Wei Yongjun" <weiyongjun1@huawei.com>,
 "Adrian Hunter" <adrian.hunter@intel.com>,
 "Ulf Hansson" <ulf.hansson@linaro.org>, "Joel Stanley" <joel@jms.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH_-next]_mmc:_aspeed:_Fix_return_value_check_in_aspee?=
 =?UTF-8?Q?d=5Fsdc=5Fprobe()?=
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
Cc: kernel-janitors@vger.kernel.org, linux-mmc <linux-mmc@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Mon, 26 Aug 2019, at 21:27, Wei Yongjun wrote:
> In case of error, the function of_platform_device_create() returns
> NULL pointer not ERR_PTR(). The IS_ERR() test in the return value
> check should be replaced with NULL test.
> 
> Fixes: 09eed7fffd33 ("mmc: Add support for the ASPEED SD controller")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/mmc/host/sdhci-of-aspeed.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-of-aspeed.c 
> b/drivers/mmc/host/sdhci-of-aspeed.c
> index 8bb095ca2fa9..d5acb5afc50f 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> @@ -261,9 +261,9 @@ static int aspeed_sdc_probe(struct platform_device 
> *pdev)
>  		struct platform_device *cpdev;
>  
>  		cpdev = of_platform_device_create(child, NULL, &pdev->dev);
> -		if (IS_ERR(cpdev)) {
> +		if (!cpdev) {
>  			of_node_put(child);
> -			ret = PTR_ERR(cpdev);
> +			ret = -ENODEV;
>  			goto err_clk;
>  		}
>  	}

I ... have no idea why I wrote it that way. I must have just assumed it returned
an ERR_PTR(). Thanks for finding/fixing that.

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
