Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 642D12A2279
	for <lists+linux-aspeed@lfdr.de>; Mon,  2 Nov 2020 00:59:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CPY184vW7zDqRG
	for <lists+linux-aspeed@lfdr.de>; Mon,  2 Nov 2020 10:59:08 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::844;
 helo=mail-qt1-x844.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=brNJSku0; dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CPY136KKSzDqNZ
 for <linux-aspeed@lists.ozlabs.org>; Mon,  2 Nov 2020 10:58:59 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id c5so8200095qtw.3
 for <linux-aspeed@lists.ozlabs.org>; Sun, 01 Nov 2020 15:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k0kRy+Nx/QnWYbnmGzwht3fo9mypVSfVLNNpjvfeF7Y=;
 b=brNJSku0bPKWosQMJXoWRGAomXJHS//QnKnot+pwva9tggddcof7eebITAxeSQqISR
 0shntSkFIew5/XuK/at+g071ttN0u3P5qb6hi9WbqpHd0NH8ZbFymxybJDYkZitbEodF
 b6d2g1d8MRMbKxo2Tnlnr4HmIfKWHriMjW+hw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k0kRy+Nx/QnWYbnmGzwht3fo9mypVSfVLNNpjvfeF7Y=;
 b=eheMH1W8ZYQZPCNS557IigxcnPsGplTA/DYcrNswZgX00xfrXPUWUVGKeGO7drN0Tx
 POm9ScOiDpc/p555XFQLygEYR6cvG5SCDWAZdL/9THH9mXrL6hPUa1/ye4aot1Jml1yw
 yAn+k5SeanyZhyG6CevGSFmHDECvbieC8j+Gz3kaelVFyTOh8VBZVn2+5PQS79A8fq73
 dmzNJdBfcZnxe5N4ozKvGO46UvMPEgLDqohQsfZ8oIzH694Hk+b+Wg2S7fFnsbWKT5mV
 E4HPY21eiwCULe9RF3V5Aqe8Q2cbmexKf6FPlVnIxdO+dNVasH58wref9+KA1NlWNonA
 hoTA==
X-Gm-Message-State: AOAM5336ziG4BecChf7gyV9eNnSjBWyXQSGp4Mf++ni53xIzH/o4u8Th
 8cARHY0ep4nbp5J1shulMk6Hn79JJ+al+5SdE/4=
X-Google-Smtp-Source: ABdhPJzQB5EPcYDgX2QkiYwah4UMZ5U4K0vEkbXYMHSrPooTsRW4trT5qeGhOH4iMIk8EMMTIgScxdMc83Ni2J3YO6k=
X-Received: by 2002:ac8:5854:: with SMTP id h20mr12022217qth.176.1604275137155; 
 Sun, 01 Nov 2020 15:58:57 -0800 (PST)
MIME-Version: 1.0
References: <20200813190431.3331026-1-vijaykhemka@fb.com>
In-Reply-To: <20200813190431.3331026-1-vijaykhemka@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Sun, 1 Nov 2020 23:58:44 +0000
Message-ID: <CACPK8Xe8cfQO2=+66_xE3gVWnqThWqPkhVuELpOowdaXORZCbw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: tiogapass: Remove vuart
To: Vijay Khemka <vijaykhemka@fb.com>
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
Cc: devicetree <devicetree@vger.kernel.org>, Sai Dasari <sdasari@fb.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 13 Aug 2020 at 19:04, Vijay Khemka <vijaykhemka@fb.com> wrote:
>
> Removed vuart for facebook tiogapass platform as it uses uart2 and
> uart3 pin with aspeed uart routing feature.
>
> Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
> index 2d44d9ad4e40..e6ad821a8635 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
> @@ -82,11 +82,6 @@ &lpc_ctrl {
>         status = "okay";
>  };
>
> -&vuart {
> -       // VUART Host Console
> -       status = "okay";
> -};
> -
>  &uart1 {
>         // Host Console
>         status = "okay";
> --
> 2.24.1
>
