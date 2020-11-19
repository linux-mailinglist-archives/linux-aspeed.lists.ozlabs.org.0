Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0982B8AC4
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Nov 2020 06:17:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cc7G73DL8zDqhH
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Nov 2020 16:17:03 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::843;
 helo=mail-qt1-x843.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=mB18Ck6T; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cc7G13hnwzDqfD
 for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Nov 2020 16:16:57 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id v11so3500467qtq.12
 for <linux-aspeed@lists.ozlabs.org>; Wed, 18 Nov 2020 21:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B3EsZPkEoXT4zxYNqPu9hgFRzc3MjaFuHgLigF/TdUA=;
 b=mB18Ck6Tz7z0cXqOihGrAMiJ/GnPs9KT900EfdjJLwpeP5GN4lwiXu3CAijjoyu7zs
 d1NJ0vPeWKwN3Zg1DbXu/cE7WCd1rfOSy5iV78pV2EGE1+PBA0KhLx8MTGTJjxEo37so
 K8s2xLtBBa4HkGUE8ZwHgSxApEXIWuNn2UyHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B3EsZPkEoXT4zxYNqPu9hgFRzc3MjaFuHgLigF/TdUA=;
 b=OtnkVfEbb4bcb5eBLkmInqx/myuASaUuL0yD0RE9y2nFw8W1iladc9GHCrzX1Zg9YQ
 IVVMZnJsqKNhB84PWEvLpBw0z+QdR+oRRDp4Hp7gx+1hX3t1sfDYHTqqFVXTAYODErzg
 TKtjYWW4rT5FDbcIHVCb2hXM3LqBWOq2vtM7yVVIg5eURq4DWjzA/GlcMAQILlchmVlp
 7umOCRB+lWr9GKgpIBsRdJ9lXGmUiBNzCFsAFyFfzKoCJsG0BPAhx7tOpaWWHOU2RUfr
 Uwtr6vi5eyGwl76lKZf49IigM2ucEh5JNrzH9d04jLpFnJJwWnCf5kXJEHnPH79hlBS5
 c2bQ==
X-Gm-Message-State: AOAM531veQ7qADI6BQoZ7c4PBazoB29/0MmlguwnYItSRGBygbQ6IQFL
 z6KNZZH2ZnTDePmjG/CiA5iVhxhKV79Q1yeJs5Y=
X-Google-Smtp-Source: ABdhPJwaZ2P8OVw0eTYSMERex8ss/IbbVRE4igK+EhHFqzAxCx62g6h7rOfvyNtGh1y12f4jZ5BPpknmovuWitSNJOQ=
X-Received: by 2002:ac8:75c9:: with SMTP id z9mr9218129qtq.363.1605763012893; 
 Wed, 18 Nov 2020 21:16:52 -0800 (PST)
MIME-Version: 1.0
References: <20201022014731.2035438-1-andrew@aj.id.au>
 <20201022014731.2035438-2-andrew@aj.id.au>
In-Reply-To: <20201022014731.2035438-2-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 19 Nov 2020 05:16:40 +0000
Message-ID: <CACPK8XeGoJWt_DW0q-mZf7LKTM_mFPWf8odL+BUjA7FDzL=y3A@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] ARM: dts: tacoma: Fix node vs reg mismatch for
 flash memory
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 22 Oct 2020 at 01:48, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> The mismatch lead to a miscalculation of regions in another patch, and
> shouldn't be mismatched anyway, so make them consistent.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Fixes: 575640201e66 ("ARM: dts: aspeed: tacoma: Use 64MB for firmware memory")
Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> index 4d070d6ba09f..e86c22ce6d12 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> @@ -26,7 +26,7 @@ reserved-memory {
>                 #size-cells = <1>;
>                 ranges;
>
> -               flash_memory: region@ba000000 {
> +               flash_memory: region@b8000000 {
>                         no-map;
>                         reg = <0xb8000000 0x4000000>; /* 64M */
>                 };
> --
> 2.25.1
>
