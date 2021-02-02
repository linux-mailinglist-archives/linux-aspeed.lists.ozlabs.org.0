Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6807630B697
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Feb 2021 05:39:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVBsd67dKzDrNV
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Feb 2021 15:39:01 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVBsV1ljNzDqfQ
 for <linux-aspeed@lists.ozlabs.org>; Tue,  2 Feb 2021 15:38:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=XIPtQDSl; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DVBsQ4WfVz9tjx;
 Tue,  2 Feb 2021 15:38:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1612240733; bh=JV5mvPqI7mC12a0Jzv79/LqoKulofPvb0rBJOXH5x7U=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=XIPtQDSlstzubdvttEp8uPfdS7mLrKN3vwh7wUgmJ4vAQgXvxrdFl1p1akbbIf8qQ
 SPTa5eD6Zf3ndknJEYHt6Qf/t7UCFg6VzsIkNrpkV3yrcK63lxTlg/qXFQwDf/9X5N
 O4unuidXpzNgx3gD38YpP+gLogyfNF3eO61WaJ4+L1UABVssCXwWUKAkCzzrm+pnbn
 grvFAwftmNL495Bk0e2WNxN4ugcm95DBbXhNlKTKrlY4HsXYjlsF6K4DRUB8QLEyFZ
 t79+YmPRvzzNLUCNd8qdejMHMhw+Aw6w2nHJXeQlrZ0iuLFHivEfb/KdKaye+vh0pk
 LG5b/5YbjU1+Q==
Message-ID: <8ff9f9d92271b25bd11cf473bf64466816efe93b.camel@ozlabs.org>
Subject: Re: [PATCH 1/2] drm/aspeed: Look up syscon by phandle
From: Jeremy Kerr <jk@ozlabs.org>
To: Joel Stanley <joel@jms.id.au>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Andrew Jeffery <andrew@aj.id.au>
Date: Tue, 02 Feb 2021 12:38:45 +0800
In-Reply-To: <20210111044638.290909-2-joel@jms.id.au>
References: <20210111044638.290909-1-joel@jms.id.au>
 <20210111044638.290909-2-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Joel,

Sounds like a good idea! One comment though:

> @@ -111,10 +112,13 @@ static int aspeed_gfx_load(struct drm_device *drm)
>         if (IS_ERR(priv->base))
>                 return PTR_ERR(priv->base);
>  
> -       priv->scu = syscon_regmap_lookup_by_compatible("aspeed,ast2500-scu");
> +       priv->scu = syscon_regmap_lookup_by_phandle(np, "syscon");
>         if (IS_ERR(priv->scu)) {
> -               dev_err(&pdev->dev, "failed to find SCU regmap\n");
> -               return PTR_ERR(priv->scu);
> +               priv->scu = syscon_regmap_lookup_by_compatible("aspeed,aspeed-scu");

Is this (more generic) compatible value guaranteed to exist alongside
aspeed,ast2500-scu? The scu binding only specifies the model-specific
ones:

    Documentation/devicetree/bindings/mfd/aspeed-scu.txt:

    Required properties:
    - compatible:	One of:
                    "aspeed,ast2400-scu", "syscon", "simple-mfd"
                    "aspeed,ast2500-scu", "syscon", "simple-mfd"

- the only mention of the new compatible value that I can find is this
thread. Maybe we should retain the existing one to keep the fallback
case working?

Cheers,


Jeremy

