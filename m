Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 246AD29CE24
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Oct 2020 06:29:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLcZC2Yk6zDqQ1
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Oct 2020 16:29:07 +1100 (AEDT)
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
 header.s=google header.b=f9aolMCo; dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLcZ61lHMzDq7h
 for <linux-aspeed@lists.ozlabs.org>; Wed, 28 Oct 2020 16:29:01 +1100 (AEDT)
Received: by mail-qt1-x842.google.com with SMTP id h19so2793727qtq.4
 for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Oct 2020 22:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NjGFPMz23GeVlRYE79yV94NhJ+KQ8xemp1yemHfgYCA=;
 b=f9aolMCoETy+r8HT4s3ma4ObPD5sntGlOcNjtkyBnJfoWL4TIHpS47ar38wzs+Unn5
 lmXlw3dDHAzsoGSvuqJ1e/1JEtBZ5dbzUSJc2w8ujNW4LnXiwLy1Ri9R0tHUuTFPX6j0
 i5noJ3zdd8nHt82DrHtCzFdUW4GlYBJJs0LEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NjGFPMz23GeVlRYE79yV94NhJ+KQ8xemp1yemHfgYCA=;
 b=Z2arAwIwrbsgaokJPAjTqNVWBbYCff1Bx8khc96Jpr1lK/7s5dhOScZRLW6kp+v7uX
 lRqz3RgRJKQHvkbGupT6tkVnH1on+Eil6xueY4hTKf4XElBcfDEIb0DgNTzco8AV5TgO
 uU9sb9CFQlIQtMPsVHy1y7lPmDTmMeslAXQT8SESMMYaK6slaIfsDusM++dQryFInj0g
 FZheJpcaKvxebaIcmWMIaGiVqqpNypFns2lNGcH8++hHup4Fq/FUhQqY7aF8TjAULe0q
 4+YDlAWWm/T/lU8EUVxiQ/a497ILVlghXNkqRZfSEqZ/zkoKUKXLUu5JlelZVEczgGEk
 GoJw==
X-Gm-Message-State: AOAM532U13HGZLM2gCuj5xnwiU+J/CxFFhxJYReRmIClzaiInN9gg/cN
 eldIrnzJaFfV8cF5AYYu3ki0lF5bsSuN8YrOBgk=
X-Google-Smtp-Source: ABdhPJzh4xRpIRTmAWBzbR+sxgmkiQthr+b6gtWBimSB7/2L7ZAZVIQHzhpOjgAFO4+k9KA9abyW8Ww0SFRootb7al4=
X-Received: by 2002:ac8:5854:: with SMTP id h20mr5549863qth.176.1603862939691; 
 Tue, 27 Oct 2020 22:28:59 -0700 (PDT)
MIME-Version: 1.0
References: <20201027123722.2935-1-aladyshev22@gmail.com>
 <20201027123722.2935-3-aladyshev22@gmail.com>
In-Reply-To: <20201027123722.2935-3-aladyshev22@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 28 Oct 2020 05:28:47 +0000
Message-ID: <CACPK8XdDZTYuOb-0QvpStAO0iZH+Si4t2f3sNjPjmPwLrGMc5g@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: aspeed: amd-ethanolx: Enable devices for
 the iKVM functionality
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

On Tue, 27 Oct 2020 at 12:41, Konstantin Aladyshev
<aladyshev22@gmail.com> wrote:
>
> Enable the USB 2.0 Virtual Hub Controller and
> the Video Engine with it's reserved memory region for the implementation
> of the iKVM functionality in the BMC.
>
> Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
> index 2a86bda8afd8..b93ed44eba0c 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
> @@ -13,6 +13,21 @@
>         memory@80000000 {
>                 reg = <0x80000000 0x20000000>;
>         };
> +
> +       reserved-memory {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges;
> +
> +               video_engine_memory: jpegbuffer {
> +                       size = <0x02000000>;    /* 32M */
> +                       alignment = <0x01000000>;
> +                       compatible = "shared-dma-pool";
> +                       reusable;
> +               };
> +       };
> +
> +
>         aliases {
>                 serial0 = &uart1;
>                 serial4 = &uart5;
> @@ -220,5 +235,12 @@
>         };
>  };
>
> +&video {
> +       status = "okay";
> +       memory-region = <&video_engine_memory>;
> +};
>
> +&vhub {
> +       status = "okay";
> +};
>
> --
> 2.17.1
>
