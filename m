Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09476923E47
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Jul 2024 15:00:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ozESms7C;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WD31K5x34z3cMX
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Jul 2024 23:00:37 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ozESms7C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WD31F3NLyz3fvM
	for <linux-aspeed@lists.ozlabs.org>; Tue,  2 Jul 2024 23:00:33 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BB159CE0F47;
	Tue,  2 Jul 2024 13:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 957EAC2BD10;
	Tue,  2 Jul 2024 13:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719925230;
	bh=3IcKndPgJRKyDI4uLAvL9dcl2uguX3FJbSHktips0FI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ozESms7CPjBSF7HnyGgtc5BOIx/GdqR1fdGFtQDO8e2pWqvWA3H92MeHHz0lsqsm+
	 KWf7GUFwobINaivWa2jXhe/rVmBOT8AoUfVKjp7KAsBbwEZcZv56xGsYPbSHNMRmyt
	 kxKgoKLsPKVU0JxTB54QYBeYbmo/xV0GmDcgfKaH03i+BnoGQFONeBS1wdTsUopZph
	 J1+kBPg8oq1Zbv7Hr3xKr7+9Jq5Z3M7bZmuZJRyFL9yBE6wW/k7KJVDxpQspfJeUMl
	 sNBOWdVlTKweq+g/p17iXmK98PgtTP+C4eqLrFg+R7K4663SzUIFoidm4LPPFwd6Em
	 BzBGnQ9P8pvOw==
Date: Tue, 2 Jul 2024 14:00:24 +0100
From: Simon Horman <horms@kernel.org>
To: Peter Yin <peteryin.openbmc@gmail.com>
Subject: Re: [PATCH v1 1/1] net/ncsi: specify maximum package to probe
Message-ID: <20240702130024.GJ598357@kernel.org>
References: <20240701154336.3536924-1-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701154336.3536924-1-peteryin.openbmc@gmail.com>
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patrick@stwcx.xyz, Eric Dumazet <edumazet@google.com>, Cosmo Chou <cosmo.chou@quantatw.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, amithash@meta.com, Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Samuel Mendoza-Jonas <sam@mendozajonas.com>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

[ As this seems to relate to: DT, ASPEED and ARM, CC:
  Rob Herring, Krzysztof Kozlowski, Conor Dooley, Joel Stanley, Andrew Jeffery,
  devicetree, linux-arm-kernel, linux-aspeed. ]

On Mon, Jul 01, 2024 at 11:43:36PM +0800, Peter Yin wrote:
> Most NICs have a single package. For OCP3.0 NICs, the package ID is
> determined by the slot ID. Probing all 8 package IDs is usually
> unnecessary. To reduce probe time, add properties to specify the
> maximum number of packages.
> 
> Signed-off-by: Cosmo Chou <cosmo.chou@quantatw.com>
> Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
> ---
>  net/ncsi/internal.h    |  1 +
>  net/ncsi/ncsi-manage.c | 16 ++++++++++++----
>  2 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
> index ef0f8f73826f..bd7ad0bf803f 100644
> --- a/net/ncsi/internal.h
> +++ b/net/ncsi/internal.h
> @@ -341,6 +341,7 @@ struct ncsi_dev_priv {
>  #define NCSI_MAX_VLAN_VIDS	15
>  	struct list_head    vlan_vids;       /* List of active VLAN IDs */
>  
> +	unsigned int        max_package;     /* Num of packages to probe   */
>  	bool                multi_package;   /* Enable multiple packages   */
>  	bool                mlx_multi_host;  /* Enable multi host Mellanox */
>  	u32                 package_whitelist; /* Packages to configure    */
> diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
> index 5ecf611c8820..159943ee1317 100644
> --- a/net/ncsi/ncsi-manage.c
> +++ b/net/ncsi/ncsi-manage.c
> @@ -1358,12 +1358,12 @@ static void ncsi_probe_channel(struct ncsi_dev_priv *ndp)
>  		nd->state = ncsi_dev_state_probe_deselect;
>  		fallthrough;
>  	case ncsi_dev_state_probe_deselect:
> -		ndp->pending_req_num = 8;
> +		ndp->pending_req_num = ndp->max_package;
>  
>  		/* Deselect all possible packages */
>  		nca.type = NCSI_PKT_CMD_DP;
>  		nca.channel = NCSI_RESERVED_CHANNEL;
> -		for (index = 0; index < 8; index++) {
> +		for (index = 0; index < ndp->max_package; index++) {
>  			nca.package = index;
>  			ret = ncsi_xmit_cmd(&nca);
>  			if (ret)
> @@ -1491,7 +1491,7 @@ static void ncsi_probe_channel(struct ncsi_dev_priv *ndp)
>  
>  		/* Probe next package */
>  		ndp->package_probe_id++;
> -		if (ndp->package_probe_id >= 8) {
> +		if (ndp->package_probe_id >= ndp->max_package) {
>  			/* Probe finished */
>  			ndp->flags |= NCSI_DEV_PROBED;
>  			break;
> @@ -1746,7 +1746,7 @@ struct ncsi_dev *ncsi_register_dev(struct net_device *dev,
>  	struct platform_device *pdev;
>  	struct device_node *np;
>  	unsigned long flags;
> -	int i;
> +	int i, ret;
>  
>  	/* Check if the device has been registered or not */
>  	nd = ncsi_find_dev(dev);
> @@ -1795,6 +1795,14 @@ struct ncsi_dev *ncsi_register_dev(struct net_device *dev,
>  		if (np && (of_property_read_bool(np, "mellanox,multi-host") ||
>  			   of_property_read_bool(np, "mlx,multi-host")))
>  			ndp->mlx_multi_host = true;
> +

Should the "ncsi-package" (and above multi-host properties) be
documented in DT bindings somewhere? I was unable to locate such
documentation.

> +		if (np) {
> +			ret = of_property_read_u32(np, "ncsi-package",
> +						   &ndp->max_package);
> +			if (ret || !ndp->max_package ||
> +			    ndp->max_package > NCSI_MAX_PACKAGE)
> +				ndp->max_package = NCSI_MAX_PACKAGE;
> +		}
>  	}

It seems that ndp->max_package will be 0 unless pdev != NULL and np != NULL.
Would it be better set to NCSI_MAX_PACKAGE in such cases?

>  
>  	return nd;
> -- 
> 2.25.1
> 
> 
