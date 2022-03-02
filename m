Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E44E4CACC9
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Mar 2022 19:01:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K82465Cgzz3bvb
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Mar 2022 05:01:26 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.161.49; helo=mail-oo1-f49.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com
 [209.85.161.49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K82433l13z3bqt
 for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Mar 2022 05:01:22 +1100 (AEDT)
Received: by mail-oo1-f49.google.com with SMTP id
 d134-20020a4a528c000000b00319244f4b04so2795738oob.8
 for <linux-aspeed@lists.ozlabs.org>; Wed, 02 Mar 2022 10:01:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/goqT9AknfrrTEcTqtCY9P/6UOTTnBDztD2PHfR3fqA=;
 b=sEDFJdetA4DPYfLaIi/wyKE63c1/g/lJrk8Jr95D37aI5hJo5aq5SKp2nTZdGbZy1l
 6gclMv+dHFWs0vy7q35z7hsnLJWuj58p8se1qs0Iw3ZaKP2J4pAgItjodu6LhzxEMmp6
 /dbTRmTJiqDzoK+6DDek9hzMkTbh4VbWHvXODwASGFa6ZG2eb0iHBskcKRJN/5RrDyH5
 mBbg0i5U8K1RsyOPQYvGgsVdyM9Ml91cne03bGwnKAkPUAfseOuBEmMR1tteQyVfMkP2
 RZqj9BmqIE1NRpEPnv/rZ1s6tOWLrStlbiSG2gWveKiiLh4dX9wDhzy6IA5jbhxadrkx
 Xl9w==
X-Gm-Message-State: AOAM5322NhUUt+MeuFbPmSWZ7IQAbNF1vgA1N09DoFrcdwCJ1sdBdNkZ
 lt35dp39xJFB1GweYutQ9270PqzquA==
X-Google-Smtp-Source: ABdhPJwU081ZnsYALg3ngDKnxVTNDVswhLhomVWcfKM5MhTUgPTmsvi/R9c2nx7mXVO6EHrERhIVNA==
X-Received: by 2002:a05:6870:f58f:b0:d4:395b:535e with SMTP id
 eh15-20020a056870f58f00b000d4395b535emr820759oab.136.1646244081294; 
 Wed, 02 Mar 2022 10:01:21 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 g2-20020a056830160200b005af14cf9962sm7986991otr.32.2022.03.02.10.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 10:01:20 -0800 (PST)
Received: (nullmailer pid 3969417 invoked by uid 1000);
 Wed, 02 Mar 2022 18:01:19 -0000
Date: Wed, 2 Mar 2022 12:01:19 -0600
From: Rob Herring <robh@kernel.org>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] dt-bindings: gpu: Convert aspeed-gfx bindings to yaml
Message-ID: <Yh+w7+CdtYYJoRkh@robh.at.kernel.org>
References: <20220302051056.678367-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220302051056.678367-1-joel@jms.id.au>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Mar 02, 2022 at 03:40:56PM +1030, Joel Stanley wrote:
> Convert the bindings to yaml and add the ast2600 compatible string.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  .../devicetree/bindings/gpu/aspeed,gfx.yaml   | 69 +++++++++++++++++++
>  .../devicetree/bindings/gpu/aspeed-gfx.txt    | 41 -----------
>  2 files changed, 69 insertions(+), 41 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpu/aspeed,gfx.yaml
>  delete mode 100644 Documentation/devicetree/bindings/gpu/aspeed-gfx.txt

Applied, thanks.
