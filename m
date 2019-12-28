Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7761F12BE33
	for <lists+linux-aspeed@lfdr.de>; Sat, 28 Dec 2019 18:59:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47lWfH3pGGzDqD1
	for <lists+linux-aspeed@lfdr.de>; Sun, 29 Dec 2019 04:59:03 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=mendozajonas.com (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=sam@mendozajonas.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=mendozajonas.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="DBovQREc"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="hgV+VtQr"; dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47lWdy0xstzDqCM
 for <linux-aspeed@lists.ozlabs.org>; Sun, 29 Dec 2019 04:58:44 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 7A0964A2;
 Sat, 28 Dec 2019 12:58:41 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sat, 28 Dec 2019 12:58:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=message-id:subject:from:to:cc:date
 :in-reply-to:references:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=Ncp0zrMvtc2cM1rZlS/PPhDR8j
 OjU2Rlpb7hbpuxZA4=; b=DBovQREcauum/OSipiv0fYE+L1R/d8PpvtVYgwibdJ
 IYcfMvHZZhR3lc197VG9mbmZMDoPrvjw5iHtXsLbuxs6HCr5+gf0jHO4/mRMaBUv
 MgTWl3x/iIvEQ446pBzqWLYlgEQckkgCApeZFlwPFf2aKp+ePKOQyddJOe+wNWAj
 YNQGsI+mctI0Nm6EiAmnPlmIPlL0MtWZcEUSH2FUrtrV3qooiQn4TNIimE1yRNIP
 usDq8BWMlcyLjG269wchgLRsaQDeotri4vcuVViM//BSGhshSIoJujnZ2SkNA0pZ
 ILpp4+j91s/07OukN6/xCrX08SGamD3/6e5msHY8dolQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=Ncp0zrMvtc2cM1rZlS/PPhDR8jOjU2Rlpb7hbpuxZ
 A4=; b=hgV+VtQryPHwybTkHU48vx6v5dRKAZicLhMyhsVppANH49hkdXyYVMalc
 0pIz9I4OZPjggdxYpdZOMxklha8lBlwIOQujNgPiZ3VatWF/KzrvOnjSWc7RlX69
 Gx5+L8n7M3ayBFW21fm09Aq2GfA/HbTjTHJ0YpiCbmvk+iWpHmK6a+Xg9yGjE6Uz
 rNEuFKj3VKg9je9Jl3lKJ6OoC+Q1Fw5NCLVPNZD779rainKhhcrLEbcngoeADu2D
 9hWh+E+tDKXgYWEdSRcOB1cNGBlbAT0KqrZ/TiRkBTq39PmlijI4vSgSXFmE4/Rg
 JP/iQ/lveQS3iX8zozlHsItxWf0WA==
X-ME-Sender: <xms:0JcHXhf8RNgGV52ygbjXFiev3qpfEGAsyFTNwWR9WD86um1Tu1Glsw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdeftddguddtlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefkuffhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpefurghm
 uhgvlhcuofgvnhguohiirgdqlfhonhgrshcuoehsrghmsehmvghnughoiigrjhhonhgrsh
 drtghomheqnecukfhppeejhedrudejvddrudelkedrleelnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehsrghmsehmvghnughoiigrjhhonhgrshdrtghomhenucevlhhushhtvghruf
 hiiigvpedt
X-ME-Proxy: <xmx:0JcHXph6ZeBllcfU_KOkUOpLvMxsC2XIj-2r0H2YRTLk8aJKArKZJQ>
 <xmx:0JcHXis8WtQ6ceXnfv7WnU083zUJbl6ddT-lGM_FgR788O7yjMc9pA>
 <xmx:0JcHXl5cDgoW5_rsrhXfs4vNrDBW7r-eD1_rdF5MmdOqUUz8Ps0B7w>
 <xmx:0ZcHXrzHhzb3m4paOkJHfvA82eBWxFuno_QDLfVImyVT8UAduI4fiQ>
Received: from Singularity (unknown [75.172.198.99])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5DF158005C;
 Sat, 28 Dec 2019 12:58:39 -0500 (EST)
Message-ID: <9d5d71d2cb6be3d98ccd85f971667c2e0ed32e06.camel@mendozajonas.com>
Subject: Re: [net-next PATCH] net/ncsi: Fix gma flag setting after response
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: Vijay Khemka <vijaykhemka@fb.com>, "David S. Miller"
 <davem@davemloft.net>,  netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Sat, 28 Dec 2019 09:58:38 -0800
In-Reply-To: <20191227224349.2182366-1-vijaykhemka@fb.com>
References: <20191227224349.2182366-1-vijaykhemka@fb.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: sdasari@fb.com, linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 2019-12-27 at 14:43 -0800, Vijay Khemka wrote:
> gma_flag was set at the time of GMA command request but it should
> only be set after getting successful response. Movinng this flag
> setting in GMA response handler.
> 
> This flag is used mainly for not repeating GMA command once
> received MAC address.
> 
> Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>

Technically this means the driver will always send this command every
time it configures if the associated NIC doesn't respond to this
command, but that won't change the behaviour otherwise.

Reviewed-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>

> ---
>  net/ncsi/ncsi-manage.c | 3 ---
>  net/ncsi/ncsi-rsp.c    | 6 ++++++
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
> index 70fe02697544..e20b81514029 100644
> --- a/net/ncsi/ncsi-manage.c
> +++ b/net/ncsi/ncsi-manage.c
> @@ -764,9 +764,6 @@ static int ncsi_gma_handler(struct ncsi_cmd_arg
> *nca, unsigned int mf_id)
>  		return -1;
>  	}
>  
> -	/* Set the flag for GMA command which should only be called
> once */
> -	nca->ndp->gma_flag = 1;
> -
>  	/* Get Mac address from NCSI device */
>  	return nch->handler(nca);
>  }
> diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
> index d5611f04926d..a94bb59793f0 100644
> --- a/net/ncsi/ncsi-rsp.c
> +++ b/net/ncsi/ncsi-rsp.c
> @@ -627,6 +627,9 @@ static int ncsi_rsp_handler_oem_mlx_gma(struct
> ncsi_request *nr)
>  	saddr.sa_family = ndev->type;
>  	ndev->priv_flags |= IFF_LIVE_ADDR_CHANGE;
>  	memcpy(saddr.sa_data, &rsp->data[MLX_MAC_ADDR_OFFSET],
> ETH_ALEN);
> +	/* Set the flag for GMA command which should only be called
> once */
> +	ndp->gma_flag = 1;
> +
>  	ret = ops->ndo_set_mac_address(ndev, &saddr);
>  	if (ret < 0)
>  		netdev_warn(ndev, "NCSI: 'Writing mac address to device
> failed\n");
> @@ -671,6 +674,9 @@ static int ncsi_rsp_handler_oem_bcm_gma(struct
> ncsi_request *nr)
>  	if (!is_valid_ether_addr((const u8 *)saddr.sa_data))
>  		return -ENXIO;
>  
> +	/* Set the flag for GMA command which should only be called
> once */
> +	ndp->gma_flag = 1;
> +
>  	ret = ops->ndo_set_mac_address(ndev, &saddr);
>  	if (ret < 0)
>  		netdev_warn(ndev, "NCSI: 'Writing mac address to device
> failed\n");

