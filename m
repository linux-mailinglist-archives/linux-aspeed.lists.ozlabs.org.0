Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B25852B3BD9
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Nov 2020 04:33:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZF6M0X5wzDqPg
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Nov 2020 14:33:47 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::842;
 helo=mail-qt1-x842.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=QbtMGSSG; dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZF6F5NXnzDq63;
 Mon, 16 Nov 2020 14:33:40 +1100 (AEDT)
Received: by mail-qt1-x842.google.com with SMTP id g17so11992322qts.5;
 Sun, 15 Nov 2020 19:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sp+Xd0qXLR5F3GGLG/m/VIpVfX8rv5kyrzW97rCHfyg=;
 b=QbtMGSSGq4rMRr95cxbyhkZXwyj3dBEBWqRsjEIQMkVzxgIBiDTnwXWGOR8OEhT6Ia
 facXJ4PrC2xTitPiKMh0E5bvbbLV4OMDxfCWgaWmeEPE01xBdXSdYUsWOdTTkkLsPwNU
 YfeSK/926BxBsxm0zxxbutrFtZXsCp2pcxFnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sp+Xd0qXLR5F3GGLG/m/VIpVfX8rv5kyrzW97rCHfyg=;
 b=bGLKjvvEaCYbLhimy8uEvE+V6SGRjzfxX8UDqwFQt7YQyPXdqqDqquCeMzg7uJE8fO
 QZ1Ohx31GzVxgsC534eIcR175H2tOs9iIeYvYRqDDhkSqMMz5l8XDJVk3/QaN5+HM5iQ
 jbCa14ZaGAuBFaKfGUNvNuQO6Iji+/lyRdVjZmdtneGF3MH9/F/yHxMfr98WaUkOYpjl
 tyY8SPHvHmgyZdC5idn/b03ZaaBPWBGEAwrcDCKM5So/TUqrVWAiWnd2MdJl8xbXJE/0
 a7Ja+lxz4ZZNNU3xdLtm2T14i6UzAtx1NzTmvC8tqlbr7HUmWdLFiHFp2m77fwJLxaCN
 VD4w==
X-Gm-Message-State: AOAM533s3qcGmVUkaj8TFe5Xf+0cPFJmKVQFh8jrm3BC1xrEjGeRxSp4
 kcux2x52sHFEBuLLMctzCcpoeLwJ1jmY1ZXBMrM=
X-Google-Smtp-Source: ABdhPJzsWj+yxl3qg6XjJcPGcwkO69M1HymTilFfhNlF7YBUOR+anj3VYmzWzAkwEZq6Gg3CRaGVdagtdgfvrvMw57M=
X-Received: by 2002:aed:33a3:: with SMTP id v32mr12755782qtd.263.1605497616267; 
 Sun, 15 Nov 2020 19:33:36 -0800 (PST)
MIME-Version: 1.0
References: <20201110072159.7941-1-rentao.bupt@gmail.com>
In-Reply-To: <20201110072159.7941-1-rentao.bupt@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 16 Nov 2020 03:33:24 +0000
Message-ID: <CACPK8Xcy=EAP4qTyBXoxExXthR31sqS_+gCu41X2yxL6aC8eMw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: wedge400: Fix FMC flash0 layout
To: Tao Ren <rentao.bupt@gmail.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 10 Nov 2020 at 07:22, <rentao.bupt@gmail.com> wrote:
>
> From: Tao Ren <rentao.bupt@gmail.com>
>
> Update "data0" partition's size from 8MB to 4MB to fix "partition data0
> extends beyond the end of device" warning at bootup time.

Thanks for testing :)

> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

I will apply for 5.11.

> ---
>  arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts
> index ad1fcad3676c..63a3dd548f30 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts
> @@ -124,8 +124,8 @@
>                  * "data0" partition (4MB) is reserved for persistent
>                  * data store.
>                  */
> -               data0@3800000 {
> -                       reg = <0x7c00000 0x800000>;
> +               data0@7c00000 {
> +                       reg = <0x7c00000 0x400000>;
>                         label = "data0";
>                 };
>
> --
> 2.17.1
>
