Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEC829CE22
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Oct 2020 06:26:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLcW41mTpzDqCG
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Oct 2020 16:26:24 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f41;
 helo=mail-qv1-xf41.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=FSQtUdM1; dkim-atps=neutral
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLcVw6N0CzDqCG
 for <linux-aspeed@lists.ozlabs.org>; Wed, 28 Oct 2020 16:26:13 +1100 (AEDT)
Received: by mail-qv1-xf41.google.com with SMTP id t20so1862177qvv.8
 for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Oct 2020 22:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NiuLglo/RooNrUdsk62yJO/eKT8250r1cbAiCmJYYP4=;
 b=FSQtUdM1SZB5DSgqJi9I/A4oUEsT8il9S6lD++yoK3rwBrCJaJyuXiYEf81lk65OJK
 uEY/yzCXna56iQn4yBF+3/ZcLtudz+wIQjkpIeQvvbOn7+R3euHQc7IB13ilB7It7YFK
 LSC6kH5oyL4k6YEokuVUKs09EG40s5Hupp9xs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NiuLglo/RooNrUdsk62yJO/eKT8250r1cbAiCmJYYP4=;
 b=XfdgkU6k7h7Xfot8gQtogXZPe37SqYX4kMuzQr4BqSgDPkDBh9ubuk6DKkKsqE36A0
 8ssD6BPv/8GePltKi9+zJnRVwoOPhIBKq3+cfI2J8ya4SI6Z7bLypYSc4dUfYTA/DOH5
 Ji/We2GBg7vTcRRHGx3rtK66a34KQ8piUbjFwGDOgdCtlaDH7UeJ4fKdotZ6mfoww6xD
 hlh2Mycf62HgCxjZjad/6o9wifuZqr4hQVtQOdNxClmsOLl62ZwwvyA1qrC+8Hfkl3DH
 spPRzeGnAETVZApZz27fM7fVZHXnXjrRd+WJjALEEmojsbfoQXrkpB3ecpzmLhEN9VJ7
 AKSg==
X-Gm-Message-State: AOAM533ikzGaZtUa6QviTgQjoz/ttN7ctxlXajizvopPdruvbNp0iDBh
 jR2ECXh9nCmQRmoScEey1j5LkzC1Z3JqyqWn9BE=
X-Google-Smtp-Source: ABdhPJxs1lICeCbecmA7Kb6hunQLw5cZyDwwkGGe2Xl6vC36f+QScSgTyLD5IxOjvCFLsKmFQ9uRNniWvFV1WVzsS10=
X-Received: by 2002:ad4:54e9:: with SMTP id k9mr6099105qvx.18.1603862769484;
 Tue, 27 Oct 2020 22:26:09 -0700 (PDT)
MIME-Version: 1.0
References: <20201027123722.2935-1-aladyshev22@gmail.com>
In-Reply-To: <20201027123722.2935-1-aladyshev22@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 28 Oct 2020 05:25:54 +0000
Message-ID: <CACPK8XcgKTEEfPL54Spd_AQTdJVm=xt+rqbteaYygLQw-GKRcQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] ARM: dts: aspeed: amd-ethanolx: Update KCS nodes to
 use v2 binding
To: Konstantin Aladyshev <aladyshev22@gmail.com>
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Supreeth Venkatesh <supreeth.venkatesh@amd.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 27 Oct 2020 at 12:38, Konstantin Aladyshev
<aladyshev22@gmail.com> wrote:
>
> KCS nodes compatible property in the 'aspeed-g5.dtsi' file was
> changed to use v2 binding in the commit fa4c8ec6feaa
> ("ARM: dts: aspeed: Change KCS nodes to v2 binding").
> For the proper initialization of /dev/ipmi-kcs* devices
> KCS node variables also need to be changed to use v2 binding.
>
> Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>

Fixes: 09f5f680707e ("ipmi: kcs: aspeed: Implement v2 bindings")
Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
> index 60ba86f3e5bc..89ddc3847222 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
> @@ -139,17 +139,17 @@
>
>  &kcs1 {
>         status = "okay";
> -       kcs_addr = <0x60>;
> +       aspeed,lpc-io-reg = <0x60>;
>  };
>
>  &kcs2 {
>         status = "okay";
> -       kcs_addr = <0x62>;
> +       aspeed,lpc-io-reg = <0x62>;
>  };
>
>  &kcs4 {
>         status = "okay";
> -       kcs_addr = <0x97DE>;
> +       aspeed,lpc-io-reg = <0x97DE>;
>  };
>
>  &lpc_snoop {
> --
> 2.17.1
>
